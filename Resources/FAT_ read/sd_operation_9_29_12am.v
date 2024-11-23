//Filename:sd_opeartion.v
//Creat:2011_9_13 11am
//Author:lichenlin
//Commit:sd card operation in read or write.
module	sd_operation(
	sys_clk,
	
	read_req,
	
	start_block_address,
	end_block_address,
	
	outdata_en,
	outdata,
	outdata_num,
	out_block_number,
	
	write_req,
	
	read_ram_data,
	read_ram_en,
	read_ram_address,
	
	sd_idle_flag,
	
	sd_command,
	sd_data,
	sd_clk,
	
	crc7_outdata_en,
	crc7_outdata,
	crc7_indata,
	crc7_indata_req
	
	);

input	sys_clk;//系统时锟斤拷50MHz
input read_req;//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷

input[31:0]	start_block_address;//锟斤拷锟斤拷锟斤拷写锟斤拷始锟斤拷址
input[31:0]	end_block_address;//锟斤拷锟斤拷锟斤拷写锟斤拷锟斤拷锟斤拷址

output	outdata_en;//锟斤拷锟斤拷锟斤拷效
output[7:0]	outdata;//锟斤拷锟斤拷锟斤拷锟�
output[8:0]	outdata_num;//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
output[31:0]	out_block_number;


input	write_req;//写锟斤拷锟斤拷
input[7:0]	read_ram_data;//锟斤拷写锟斤拷锟斤拷锟饺★拷锟斤拷锟�
output read_ram_en;//锟斤拷写锟斤拷锟斤拷锟饺∈癸拷锟�
output[31:0]	read_ram_address;//锟斤拷写锟斤拷锟斤拷锟饺★拷锟街�

output sd_idle_flag;//锟斤拷锟捷匡拷锟叫憋拷志

inout sd_command;//sd锟斤拷锟斤拷锟斤拷锟�
inout[3:0]	sd_data;//sd锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷
output	sd_clk;//sd时锟斤拷

input	crc7_outdata_en;
input[6:0]	crc7_outdata;
output[39:0]	crc7_indata;
output	crc7_indata_req;

wire	sd_command_dir;
wire	sd_command_in;
wire	sd_command_out;


assign	sd_command_in=(sd_command_dir==1'b1)?sd_command:1'bz;
assign	sd_command=(sd_command_dir==1'b0)?sd_command_out:1'bz;

reg	sd_sddata_dir;
wire[3:0]	sd_sddata_out;
wire[3:0]	sd_sddata_in;

assign	sd_sddata_out=4'b1111;
assign	sd_sddata_in=(sd_sddata_dir==1'b1)?sd_data:4'bz;
assign	sd_data=(sd_sddata_dir==1'b0)?sd_sddata_out:4'bz;



//锟斤拷始锟斤拷锟节硷拷锟斤拷锟斤拷锟斤拷锟绞憋拷硬锟斤拷锟�
parameter	counter2_5us=8'd250;//7'd125;
reg[7:0]	id_clk_counter;
reg	id_clk_pluse;
reg	id_clk;
always @(posedge	sys_clk)
begin
	if(id_clk_counter==counter2_5us)
		begin
			id_clk_counter<=0;
			id_clk_pluse<=1'b1;
		end
	else
		begin
			id_clk_pluse<=1'b0;
			if(id_clk_counter>(counter2_5us/2))
				begin
					id_clk_counter<=id_clk_counter+1'd1;
					id_clk<=1'b1;			
				end
			else
				begin
					id_clk_counter<=id_clk_counter+1'b1;
					id_clk<=1'b0;		
				end
		end
end	


//锟斤拷锟斤拷锟斤拷锟捷达拷锟斤拷锟斤拷锟斤拷碌锟绞憋拷印锟�
reg	data_clk;
always @(posedge	sys_clk)
begin
	data_clk<=~data_clk;		
end	



//系统锟斤拷始锟斤拷锟斤拷锟斤拷
parameter	counter100ms=24'h3D0900;//16'h9c40;
parameter	counterncc=4'd15;
parameter	sd_int_idle=5'd0,
					sd_int_waittime=5'd1,
					sd_int_sendcmd0=5'd2,
					sd_int_waitcmd0=5'd3,
					sd_int_sendcmd8=5'd4,
					sd_int_get_res_r7=5'd5,
					sd_int_send_cmd55=5'd6,
					sd_int_get_res_first_r1=5'd7,
					sd_int_send_acmd41=5'd8,
					sd_int_get_first_r3=5'd9,
					sd_int_send_cmd2=5'd10,
					sd_int_get_first_r2=5'd11,
					sd_int_send_cmd3=5'd12,
					sd_int_get_first_r6=5'd13,
					sd_int_send_cmd9=5'd14,
					sd_int_get_three_r2=5'd15,
					sd_int_send_cmd7=5'd16,
					sd_int_get_first_r1b=5'd17,
					sd_int_send_sec_cmd55=5'd18,
					sd_int_get_res_second_r1=5'd19,
					sd_int_send_acmd6=5'd20,
					sd_int_get_res_third_r1=5'd21,
					sd_int_over=5'd22,
					sd_int_errorout=5'd23;
reg[4:0]	sd_int_state;
reg[23:0]	sd_int_time_counter;

reg	sd_int_req;

reg[3:0]	cmd0time_counter;
reg	sd_int_next_cmd0;
reg[37:0]	SD_ACMD41;
reg[1:0]	sd_type;
reg[15:0]	sd_rca;
reg	sd_int_overflag;

//CMD
reg[37:0] send_int_cmd;
reg	send_int_cmd_req;
reg	send_int_cmd_overflag;
//Respone
reg int_get_respone_req;
reg int_respone_long_req;
reg	int_get_respone_overflag;
reg	int_get_respone_timeout;			
reg[133:0]	int_res_longdata;
reg[45:0]	int_res_shortdata;

//ERR
reg[7:0] int_errout;

//timeout
reg[6:0]	tran_data_timout;

always@(posedge	sys_clk)
begin
	case(sd_int_state)
		sd_int_idle://0
			begin
				sd_int_state<=sd_int_waittime;
				sd_int_req<=1'b1;//锟叫伙拷锟斤拷int模式锟斤拷
				sd_int_overflag<=1'b0;
			end
		sd_int_waittime://锟斤拷锟斤拷时锟斤拷却锟� 1
			begin
				if(sd_int_time_counter==counter100ms)
					begin
						sd_int_time_counter<=0;
						sd_int_state<=sd_int_sendcmd0;	
					end
				else
					if(id_clk_pluse==1'b1)
						begin
							sd_int_time_counter<=sd_int_time_counter+1'd1;
						end
			end
		sd_int_sendcmd0://锟斤拷位 2
			begin
				if(send_int_cmd_overflag==1'b1)
					begin
						sd_int_state<=sd_int_waitcmd0;
						send_int_cmd_req<=1'b0;
					end
				else
					begin
						send_int_cmd<={6'h0,32'h0};//cmd0
						send_int_cmd_req<=1'b1;
					end
			end
		sd_int_waitcmd0://cmd0锟饺达拷指锟斤拷锟斤拷时锟斤拷 3
			begin
				if(cmd0time_counter==counterncc)
					begin
						cmd0time_counter<=0;
						if(sd_int_next_cmd0==1'b1)
							begin
								sd_int_state<=sd_int_send_cmd55;
							end
						else
							begin
								sd_int_state<=sd_int_sendcmd8;
								//sd_int_state<=sd_int_sendcmd0;
							end
					end
				else
					if(id_clk_pluse==1'b1)
						begin
							cmd0time_counter<=cmd0time_counter+1'd1;
						end
			end
		sd_int_sendcmd8://锟斤拷锟斤拷CMD8锟斤拷支锟斤拷V2 4
			begin
				if(send_int_cmd_overflag==1'b1)
					begin
						sd_int_state<=sd_int_get_res_r7;
						send_int_cmd_req<=1'b0;
					end
				else
					begin
						send_int_cmd<={6'd8,20'h0,4'h1,8'haa};//cmd8 2.7V-3.6V
						send_int_cmd_req<=1'b1;
					end			
			end
		sd_int_get_res_r7://锟矫碉拷R7锟斤拷应 48bit 5
			begin
				if(int_get_respone_overflag==1'b1)
					begin
						int_get_respone_req<=1'b0;
						int_respone_long_req<=1'b0;
						if(int_get_respone_timeout==1'b1)//锟斤拷时锟睫伙拷应
							begin
								sd_int_state<=sd_int_sendcmd0;
								sd_int_next_cmd0<=1'b1;//说锟斤拷锟斤拷锟斤拷一锟轿碉拷CMD0
								SD_ACMD41<={6'd41,8'b0000_0000,8'hff,8'b0,8'b0};//锟斤拷一锟斤拷锟芥本锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 [31:0] OCR
								sd_type<=2'd1;//ver1.0 锟斤拷准锟斤拷锟斤拷sd锟斤拷
							end
						else//锟斤拷应锟斤拷要锟斤拷锟�
							if((int_res_shortdata[45:40]==6'd8)
							&&(int_res_shortdata[19:16]==4'd1)
							&&(int_res_shortdata[0]==1'd1))
								begin
									sd_int_state<=sd_int_send_cmd55;
									SD_ACMD41<={6'd41,8'b0100_0000,8'hff,8'h80,8'b0};//锟节讹拷锟斤拷锟芥本锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷 支锟斤拷HC 
									sd_type<=2'd2;//ver2.0 锟斤拷准锟斤拷锟斤拷锟斤拷锟竭革拷锟斤拷锟斤拷sd锟斤拷
								end
							else
								begin
									sd_int_state<=sd_int_errorout;
								end						
					end
				else
					begin
						int_get_respone_req<=1'b1;
						int_respone_long_req<=1'b0;
					end
			end
		sd_int_send_cmd55://Acmd锟斤拷锟斤拷头 6
			begin
				if(send_int_cmd_overflag==1'b1)
					begin
						sd_int_state<=sd_int_get_res_first_r1;
						send_int_cmd_req<=1'b0;
					end
				else
					begin
						sd_int_next_cmd0<=1'b0;//锟斤拷锟�
						send_int_cmd_req<=1'b1;
						send_int_cmd<={6'd55,32'd0};//RCA为0						
					end					
			end			
		sd_int_get_res_first_r1://CMD55 锟斤拷应 48bits 7
			begin
				if(int_get_respone_overflag==1'b1)
					begin
						int_get_respone_req<=1'b0;
						int_respone_long_req<=1'b0;
						if(int_get_respone_timeout==1'b1)//锟斤拷时锟睫伙拷应
							begin
								sd_int_state<=sd_int_errorout;//锟斤拷锟斤拷锟斤拷锟�
								sd_int_next_cmd0<=1'b0;//锟斤拷锟斤拷麓锟絚md0锟斤拷锟斤拷
							end
						else//锟叫伙拷应锟斤拷要锟斤拷锟紸PP_CMD,READ
							begin
								if((int_res_shortdata[45:40]==6'd55)&&(int_res_shortdata[13]==1'b1)
								&&(int_res_shortdata[0]==1'b1))
								//int_res_shortdata[13]	card status [5]
									sd_int_state<=sd_int_send_acmd41;
								else
									sd_int_state<=sd_int_errorout;
							end
					end
				else
					begin
						int_get_respone_req<=1'b1;
						int_respone_long_req<=1'b0;
					end					
			end
		sd_int_send_acmd41://acmd41 8
			begin
				if(send_int_cmd_overflag==1'b1)
					begin
						sd_int_state<=sd_int_get_first_r3;
						send_int_cmd_req<=1'b0;
					end
				else
					begin 
						send_int_cmd<=SD_ACMD41;//锟斤拷锟斤拷ACMD41		index 41 
						send_int_cmd_req<=1'b1;						
					end				
			end
		sd_int_get_first_r3://锟矫碉拷R3应锟斤拷 48bits  9
			begin
				if(int_get_respone_overflag==1'b1)
					begin
						int_get_respone_req<=1'b0;
						int_respone_long_req<=1'b0;
						if(int_get_respone_timeout==1'b1)//锟斤拷时锟睫伙拷应
							begin
								sd_int_state<=sd_int_errorout;
							end
						else//锟斤拷锟紿CS锟斤拷值
							begin
								if((int_res_shortdata[39]==1'b1)&&(int_res_shortdata[0]==1'b1))
								//锟斤拷锟絙usy锟角凤拷为1,1锟斤拷示锟斤拷锟斤拷系锟斤拷锟斤拷
									begin
										sd_int_state<=sd_int_send_cmd2;
										if(int_res_shortdata[38]==1'b0)
											sd_type<=2'd2;//ver2.0 锟斤拷准锟斤拷锟斤拷锟斤拷锟斤拷sd锟斤拷
										else
											sd_type<=2'd3;//ver2.0 锟斤拷锟斤拷锟斤拷sd锟斤拷
									end									
								else
									sd_int_state<=sd_int_send_cmd55;//锟斤拷锟斤拷锟斤拷锟斤拷ACMD41
							end
					end	
				else
					begin
						int_get_respone_req<=1'b1;
						int_respone_long_req<=1'b0;
					end					
			end
	sd_int_send_cmd2://SD 锟斤拷锟斤拷锟斤拷息 10
		begin
			if(send_int_cmd_overflag==1'b1)
				begin
					sd_int_state<=sd_int_get_first_r2;
					send_int_cmd_req<=1'b0;	
				end
			else
				begin
					send_int_cmd<={6'h2,32'h0};//锟斤拷锟斤拷CMD2
					send_int_cmd_req<=1'b1;						
				end			
		end
	sd_int_get_first_r2://134 bits 11
		begin
			if(int_get_respone_overflag==1'b1)
				begin
					int_get_respone_req<=1'b0;
					int_respone_long_req<=1'b0;
					if(int_get_respone_timeout==1'b1)//锟斤拷时锟睫伙拷应
						begin
							sd_int_state<=sd_int_errorout;
						end
					else//锟斤拷锟斤拷谢锟接︼拷锟斤拷锟揭�锟斤拷锟�
						if(int_res_shortdata[0]==1'b1)
							begin
								sd_int_state<=sd_int_send_cmd3;
							end
						else
							begin
								sd_int_state<=sd_int_errorout;
							end
				end	
			else
				begin
					int_get_respone_req<=1'b1;
					int_respone_long_req<=1'b1;
				end
		end
	sd_int_send_cmd3://锟矫碉拷锟铰碉拷RCA值 12
		begin
			if(send_int_cmd_overflag==1'b1)
				begin
					sd_int_state<=sd_int_get_first_r6;
					send_int_cmd_req<=1'b0;
				end
			else
				begin
					send_int_cmd<={6'h3,32'h0};//锟斤拷锟斤拷CMD3
					send_int_cmd_req<=1'b1;					
				end			
		end
	sd_int_get_first_r6:// 48 bits  13
		begin
			if(int_get_respone_overflag==1'b1)
				begin
					int_get_respone_req<=1'b0;
					int_respone_long_req<=1'b0;
					if(int_get_respone_timeout==1'b1)//锟斤拷时锟睫伙拷应
						begin
							sd_int_state<=sd_int_errorout;
						end
					else//锟斤拷锟斤拷谢锟接︼拷锟斤拷RCA
						begin
							sd_rca<=int_res_shortdata[31:16];
							sd_int_state<=sd_int_send_cmd9;
						end
				end
			else
				begin
					int_get_respone_req<=1'b1;
					int_respone_long_req<=1'b0;
				end
		end
	
	//LAST ADD
	sd_int_send_cmd9://锟斤拷锟斤拷RCA锟斤拷锟斤拷CSD锟斤拷锟斤拷  2
		begin
			if(send_int_cmd_overflag==1'b1)
				begin
					sd_int_state<=sd_int_get_three_r2;
					send_int_cmd_req<=1'b0;
				end
			else
				begin
					send_int_cmd<={6'd9,sd_rca[15:0],16'd0};//cmd9
					send_int_cmd_req<=1'b1;
				end
		end
	sd_int_get_three_r2://锟矫碉拷R2锟斤拷应锟斤拷锟斤拷锟斤拷CSD锟斤拷锟斤拷  134bits 3
		begin
			if(int_get_respone_overflag==1'b1)
				begin
					int_get_respone_req<=1'b0;
					int_respone_long_req<=1'b0;
					if(int_get_respone_timeout==1'b1)//锟斤拷时锟睫伙拷应
						begin
							sd_int_state<=sd_int_errorout;
						end
					else//锟斤拷锟斤拷谢锟接︼拷锟斤拷憧�锟秸间，锟斤拷取锟斤拷时时锟斤拷
						begin
							sd_int_state<=sd_int_send_cmd7;
							if(int_res_longdata[127:126]==2'b00) //ver 1.0 csd
								begin
									//sd_size<=(int_res_longdata[73:62]+1)*(
									case(int_res_longdata[114:112])
										6:
											tran_data_timout<=8;//锟斤拷取锟斤拷锟捷筹拷时锟叫讹拷 ms为锟斤拷位
										7:
											tran_data_timout<=80;
										default:
											tran_data_timout<=2;
									endcase
								end
							else
								if(int_res_longdata[127:126]==2'b00)
									begin
										tran_data_timout<=2;
									end
						end
				end
			else
				begin
					int_respone_long_req<=1'b1;//锟斤拷锟斤拷锟捷凤拷锟斤拷
					int_get_respone_req<=1'b1;
				end
		end			
	sd_int_send_cmd7://锟斤拷锟斤拷状态锟斤拷锟斤拷锟斤拷锟斤拷锟捷达拷锟斤拷状态  4
		begin
			if(send_int_cmd_overflag==1'b1)
				begin
					sd_int_state<=sd_int_get_first_r1b;
					send_int_cmd_req<=1'b0;
				end
			else
				begin
					send_int_cmd<={6'd7,sd_rca[15:0],16'd0};
					send_int_cmd_req<=1'b1;
				end
		end
	sd_int_get_first_r1b://锟矫碉拷R1b锟斤拷应  48bits 5
		begin
			if(int_get_respone_overflag==1'b1)
				begin
					int_get_respone_req<=1'b0;
					int_respone_long_req<=1'b0;
					if(int_get_respone_timeout==1'b1)//锟斤拷时锟睫伙拷应
						begin
							sd_int_state<=sd_int_errorout;
						end
					else//锟斤拷锟斤拷谢锟接︼拷锟斤拷锟揭�锟斤拷锟�
						begin
							sd_int_state<=sd_int_send_sec_cmd55;
						end
				end
			else
				begin
					int_respone_long_req<=1'b0;
					int_get_respone_req<=1'b1;						
				end
		end	
	sd_int_send_sec_cmd55://Acmd锟斤拷锟斤拷头  6
		begin
			if(send_int_cmd_overflag==1'b1)
				begin
					sd_int_state<=sd_int_get_res_second_r1;
					send_int_cmd_req<=1'b0;
				end
			else
				begin
					send_int_cmd<={6'd55,sd_rca[15:0],16'd0};
					send_int_cmd_req<=1'b1;						
				end					
		end
	sd_int_get_res_second_r1://CMD55 锟斤拷应  48bits 7
		begin
			if(int_get_respone_overflag==1'b1)
				begin
					int_get_respone_req<=1'b0;
					int_respone_long_req<=1'b0;
					if(int_get_respone_timeout==1'b1)//锟斤拷时锟睫伙拷应
						begin
							sd_int_state<=sd_int_errorout;
						end
					else//锟叫伙拷应锟斤拷要锟斤拷锟紸PP_CMD,READ
						begin
							//if((int_res_shortdata[45:40]==6'd55)
							//&&(int_res_shortdata[13]==1'b1)
							//&&(int_res_shortdata[0]==1'b1))
							if(int_res_shortdata[13]==1'b1)//APP_CMD
								sd_int_state<=sd_int_send_acmd6;
							else
								sd_int_state<=sd_int_idle;
						end
				end
			else
				begin
					int_respone_long_req<=1'b0;
					int_get_respone_req<=1'b1;
				end			
		end
	sd_int_send_acmd6://acmd6 锟斤拷锟斤拷锟斤拷锟捷匡拷锟斤拷  8
		begin
			if(send_int_cmd_overflag==1'b1)
				begin
					sd_int_state<=sd_int_get_res_third_r1;
					send_int_cmd_req<=1'b0;
				end
			else
				begin
					send_int_cmd<={6'd6,30'd0,2'b01};//锟斤拷锟斤拷ACMD6						
					send_int_cmd_req<=1'b1;
				end				
		end
	sd_int_get_res_third_r1://锟矫碉拷锟节讹拷锟斤拷R1应锟斤拷  9
		begin
			if(int_get_respone_overflag==1'b1)
				begin
					int_get_respone_req<=1'b0;
					int_respone_long_req<=1'b0;
					if(int_get_respone_timeout==1'b1)//锟斤拷时锟睫伙拷应
						begin
							sd_int_state<=sd_int_errorout;
						end
					else//锟斤拷锟斤拷锟�
						begin
							sd_int_state<=sd_int_over;
						end
				end
			else
				begin
					int_respone_long_req<=1'b0;	
					int_get_respone_req<=1'b1;
				end					
		end				
	sd_int_over:// 14
		begin
			sd_int_overflag<=1'b1;//锟斤拷沙锟绞硷拷锟斤拷锟街�
			sd_int_req<=1'b0;//锟剿筹拷int模式锟斤拷
		end
	sd_int_errorout:
		begin		
			int_errout<=8'b0;
		end
	endcase
end



//锟斤拷锟捷达拷锟斤拷锟斤拷锟�
parameter	sd_tran_idle=4'd0,
					sd_tran_sync=4'd1,
					//sd_tran_send_cmd9=4'd2,
					//sd_tran_get_first_r2=4'd3,
					//sd_tran_send_cmd7=4'd4,
					//sd_tran_get_first_r1b=4'd5,
					//sd_tran_send_cmd55=4'd6,
					//sd_tran_get_res_first_r1=4'd7,
					//sd_tran_send_acmd6=4'd8,
					//sd_tran_get_res_sec_r1=4'd9,
					sd_tran_wait_req=4'd2,
					sd_tran_send_cmd17=4'd3,
					sd_tran_getdata	=4'd4,
					sd_tran_error=4'd5;
reg[3:0]	sd_tran_state;
reg[1:0]	sd_tran_data_sync_counter;

//reg[6:0]	tran_data_timout;

reg[31:0]	sd_block_address;
reg[31:0]	block_numbers;
reg[31:0]	block_counter;			
reg[31:0]	out_block_number;
reg[7:0]	trant_errout;

//SD_DATA
reg	get_sddata_outtime_flag;
reg	get_sddata_overflag;
reg	get_sddata_req;
//CMD
reg[37:0] send_tran_cmd;
reg	send_tran_cmd_req;
reg	send_tran_cmd_overflag;
//Respone
reg tran_get_respone_req;
reg tran_respone_long_req;
reg	tran_get_respone_overflag;
reg	tran_get_respone_timeout;			
reg[133:0]	tran_res_longdata;
reg[45:0]	tran_res_shortdata;

reg	sd_tran_idle_flag;
					
always@(posedge	sys_clk)
begin
	case(sd_tran_state)
		sd_tran_idle:// 0
			begin
				if(sd_int_overflag==1'b1)//锟饺达拷锟斤拷始锟斤拷锟斤拷锟�
					begin						 
						sd_tran_state<=sd_tran_sync;
					end
			end
		sd_tran_sync://锟斤拷锟斤拷同锟斤拷25M时锟斤拷  1
			begin
				if(sd_tran_data_sync_counter==3)
					begin
						sd_tran_data_sync_counter<=0;
						sd_tran_state<=sd_tran_wait_req;	
					end
				else
					if(data_clk==1'b1)
						begin
							sd_tran_data_sync_counter<=sd_tran_data_sync_counter+1'd1;
						end
			end
		
		sd_tran_wait_req:// 锟饺达拷写锟斤拷锟斤拷   10 
			begin
				if(read_req==1'b1)
					begin
						sd_tran_state<=sd_tran_send_cmd17;
						sd_tran_idle_flag<=1'b0;//锟斤拷锟斤拷忙状态
						case(sd_type)
							2'd1,2'd2://V1.0 V2.0 锟斤拷准锟斤拷锟斤拷
								begin
									sd_block_address<={start_block_address[22:0],9'b0};
									block_numbers<=end_block_address[22:0]-start_block_address[22:0];//block锟斤拷目
								end
							2'd3://锟斤拷锟斤拷锟斤拷
								begin
									sd_block_address<=start_block_address;
									block_numbers<=end_block_address-start_block_address;//block锟斤拷目
								end
						endcase
					end
				else
					begin
						sd_tran_idle_flag<=1'b1;//锟斤拷锟斤拷状态
						sd_tran_state<=sd_tran_wait_req;
					end
			end
		sd_tran_send_cmd17://锟斤拷取锟斤拷锟斤拷block锟斤拷息  11
			begin
				if(send_tran_cmd_overflag==1'b1)
					begin
						sd_tran_state<=sd_tran_getdata;
						send_tran_cmd_req<=1'b0;
					end
				else
					begin
						send_tran_cmd<={6'd17,sd_block_address};//锟斤拷锟斤拷cmd17
						send_tran_cmd_req<=1'b1;
					end			
			end		
		sd_tran_getdata://getdata  12
			begin
				if(get_sddata_overflag==1'b1)
					begin
						get_sddata_req<=1'b0;
						if(get_sddata_outtime_flag==1'b1)//锟斤拷取锟斤拷锟捷筹拷时
							begin							
								sd_tran_state<=sd_tran_wait_req;
							end
						else
							begin
								if(block_counter==block_numbers)
									begin
										block_counter<=0;
										out_block_number<=0;
										sd_tran_state<=sd_tran_wait_req;
									end
								else
									begin
										case(sd_type)
											2'd1,2'd2://V1.0 V2.0 锟斤拷准锟斤拷锟斤拷
												begin
													sd_block_address<={sd_block_address[22:0]+1'd1,9'b0};
												end
											2'd3://锟斤拷锟斤拷锟斤拷
												begin
													sd_block_address<=sd_block_address+1'd1;
												end
										endcase
										block_counter<=block_counter+1'd1;
										out_block_number<=out_block_number+1'd1;
										sd_tran_state<=sd_tran_send_cmd17;
									end
							end
					end
				else
					get_sddata_req<=1'b1;
			end
		sd_tran_error:
			begin
				trant_errout<=8'b0;
			end	
	endcase
end

//锟斤拷锟斤拷CLK
wire	cmd_clk;
assign	cmd_clk=(sd_int_req)?id_clk_pluse:data_clk;

//锟斤拷锟捷达拷锟斤拷锟叫凤拷锟斤拷锟斤拷锟斤拷
parameter	send_cmd_idle=2'd0,
					send_cmd_sync=2'd1,
					send_cmd_bitdata=2'd2,
					send_cmd_over=2'd3;

reg[1:0]	send_cmd_state;
//reg	send_cmd_overflag;
reg[2:0]	cmd_sync_counter;
reg[37:0]	cmd_outdata;
reg[6:0]	cmd_bit_counter;
reg[7:0]	cmd_last_data;
reg	cmd_last_data_outreq;

reg	sd_command_out_temp;

reg[39:0]	crc7_indata;
reg	crc7_indata_req;

reg[37:0] send_cmd;
reg	send_cmd_req;
reg	sd_out_command_dir;
reg send_cmd_overflag;

always @(posedge	sys_clk)
	case(send_cmd_state)
		send_cmd_idle:
			begin
				if(send_cmd_req==1'b1)
					send_cmd_state<=send_cmd_sync;
			end
		send_cmd_sync://同锟斤拷锟斤拷锟斤拷时锟斤拷
			begin
				if(cmd_sync_counter==3'd5)
					begin
						cmd_sync_counter<=0;
						crc7_indata_req<=1'b0;//锟斤拷止crc7锟斤拷锟斤拷锟脚猴拷
						send_cmd_state<=send_cmd_bitdata;
					end
				else
					begin
						if(cmd_clk==1'b1)
							begin
								sd_command_out_temp<=1'b1;
								sd_out_command_dir<=1'b1;//command锟斤拷锟�
														
								cmd_outdata<=send_cmd;//锟矫碉拷cmd
								
								crc7_indata<={2'b01,send_cmd[37:0]};//锟斤拷锟絚rc7锟斤拷锟斤拷锟斤拷值
								crc7_indata_req<=1'b1;//crc7锟斤拷锟斤拷锟脚猴拷
								
								cmd_sync_counter<=cmd_sync_counter+1'd1;
							end
					end
			end
		send_cmd_bitdata://锟斤拷锟酵碉拷锟斤拷bit值
			begin
				if(cmd_clk==1'b1)
					case(cmd_bit_counter)
						0://锟斤拷始0
							begin
								sd_command_out_temp<=1'b0;
								cmd_bit_counter<=1;
							end
						1://锟斤拷锟斤拷1
							begin
								sd_command_out_temp<=1'b1;
								cmd_bit_counter<=2;
							end
						39://锟斤拷锟斤拷锟�40bit位锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷crc值
							begin
								sd_command_out_temp<=cmd_outdata[37];
								cmd_bit_counter<=40;
								if(crc7_outdata_en==1'b1)//CRC7锟斤拷值
									begin 
										cmd_last_data<={crc7_outdata,1'b1};
										cmd_last_data_outreq<=1'b1;
									end
								else
									begin
										cmd_last_data<=8'hff;
									end
							end
						48:
							begin
								send_cmd_state<=send_cmd_over;
								send_cmd_overflag<=1'b1;
								
								cmd_last_data_outreq<=1'b0;
								cmd_bit_counter<=0;
							end
						default:
							begin
								cmd_bit_counter<=cmd_bit_counter+1'd1;
								if(cmd_last_data_outreq==1'b1)
									begin
										sd_command_out_temp<=cmd_last_data[7];
										cmd_last_data<={cmd_last_data[6:0],1'b0};										
									end
								else
									begin
										sd_command_out_temp<=cmd_outdata[37];
										cmd_outdata<={cmd_outdata[36:0],1'b0};
									end
							end
					endcase
			end
		send_cmd_over:
			begin
				send_cmd_state<=send_cmd_idle;
				sd_out_command_dir<=1'b0;
				send_cmd_overflag<=1'b0;
			end
	endcase

//锟矫碉拷锟斤拷锟捷伙拷应 锟斤拷CMD锟斤拷锟斤拷
parameter	get_respone_idle=3'd0,
					get_respone_bitstart=3'd1,
					get_respone_iddata=3'd2,
					get_respone_timeoutover=3'd3,
					get_respone_shiftdata=3'd4,
					get_respone_last=3'd5,
					get_respone_sendover=3'd6;
					
reg[2:0]	get_respone_state;
reg	sd_in_command_dir;
reg[6:0]	get_outtime_counter;
//reg	get_respone_overflag;
//reg	get_respone_timeout;			
//reg[133:0]	res_longdata;
//reg[45:0]	res_shortdata;
reg[1:0]	zero_counter;
reg[7:0]	respone_shift_counter;
reg[133:0]	sd_command_intemp;
reg[3:0]	get_last_counter;

reg get_respone_req;
reg respone_long_req;
reg get_respone_overflag;
reg	get_respone_timeout;
reg[133:0]	respone_longdata;
reg[45:0]	respone_shortdata;

always @(posedge	sys_clk)
case(get_respone_state)
	get_respone_idle:
		begin
			if(get_respone_req==1'b1)
				get_respone_state<=get_respone_bitstart;
		end
	get_respone_bitstart:
		begin
			sd_in_command_dir<=1'b1;//锟斤拷锟斤拷锟斤拷锟斤拷
			get_respone_state<=get_respone_iddata;
		end
	get_respone_iddata://识锟斤拷锟斤拷始锟酵凤拷锟斤拷锟斤拷锟斤拷
		begin
			if(cmd_clk==1'b1)
				begin
					if(get_outtime_counter==7'd80)
						begin
							get_outtime_counter<=0;
							
							get_respone_state<=get_respone_timeoutover;
						end
					else
						begin
							get_outtime_counter<=get_outtime_counter+1'd1;
							case(zero_counter)//锟斤拷位2锟斤拷0
								0:
									begin
										if(sd_command_in==1'b0)
											zero_counter<=1;
									end
								1:
									begin
										if(sd_command_in==1'b0)
											begin
												zero_counter<=0;
												get_respone_state<=get_respone_shiftdata;
											end	
										else
											begin
												zero_counter<=0;
												get_respone_state<=get_respone_timeoutover;
											end
									end
							endcase										
						end
				end
		end
	get_respone_timeoutover:
		begin
			if(cmd_clk==1'b1)
				begin
					get_outtime_counter<=0;
					get_respone_timeout<=1'b1;
					get_respone_overflag<=1'b1;
					get_respone_state<=get_respone_sendover;
				end
		end
	get_respone_shiftdata://锟斤拷锟斤拷锟斤拷锟斤拷 锟斤拷时锟斤拷锟斤拷crc校锟斤拷
		begin				
			if(cmd_clk==1'b1)
				begin
					get_outtime_counter<=0;
					case(respone_shift_counter)
						46:
							begin
								if(respone_long_req==1'b1)//锟斤拷锟斤拷浅锟斤拷锟斤拷莼锟接�
									begin
										sd_command_intemp<={sd_command_intemp[132:0],sd_command_in};
										respone_shift_counter<=47;
									end
								else//锟斤拷锟斤拷锟捷伙拷应
									begin
										get_respone_state<=get_respone_last;
										respone_shift_counter<=0;
									end
							end
						134://锟斤拷锟斤拷134bit锟侥伙拷应
							begin
								get_respone_state<=get_respone_last;							
								respone_shift_counter<=0;
							end
						default:
							begin
								sd_command_intemp<={sd_command_intemp[132:0],sd_command_in};;
								respone_shift_counter<=respone_shift_counter+1'd1;
							end
					endcase		
				end
		end
	get_respone_last://锟斤拷锟斤拷crc锟斤拷转 16crc+8状态锟斤拷转 锟斤拷应锟斤拷锟铰革拷CMD锟斤拷锟�
		begin
			if(get_last_counter==4'd10)
				begin
					get_last_counter<=0;
					get_respone_overflag<=1'b1;
					get_respone_state<=get_respone_sendover;
					if(respone_long_req==1'b1)
						respone_longdata<=sd_command_intemp[133:0];
					else
						respone_shortdata<=sd_command_intemp[45:0];				
				end
			else
				if(cmd_clk==1'b1)
					begin
						get_last_counter<=get_last_counter+1'd1;
					end
		end
	get_respone_sendover:
		begin
			get_respone_state<=get_respone_idle;
			get_respone_overflag<=1'b0;
			get_respone_timeout<=1'b0;
			sd_in_command_dir<=1'b0;
			sd_command_intemp<=0;
		end
endcase		

//锟斤拷data锟斤拷锟斤拷锟竭得碉拷锟斤拷锟斤拷
parameter	get_sddata_idle=3'd0,
					get_sddat_ready=3'd1,
					get_sddata_wait_start=3'd2,
					get_sddata_shiftdata=3'd3,
					get_sddata_over=3'd4;
reg[2:0]	get_sddata_state;
//reg	get_sddata_outtime_flag;
//reg	sd_sddata_dir;
//reg	get_sddata_overflag;
reg	get_sddata_outtime_req;
reg[6:0]	get_sddata_times;
reg	half_flag;
reg[7:0]	outdata;
reg	outdata_en;
reg[8:0]	outdata_num;
reg		get_sddata_outtime_over;

always@(posedge	sys_clk)
begin
	case(get_sddata_state)	
		get_sddata_idle:
			begin
				if(get_sddata_req==1'b1)
					get_sddata_state<=get_sddat_ready;
			end
		get_sddat_ready:
			begin
				sd_sddata_dir<=1'b1;//锟斤拷为锟斤拷锟斤拷
				get_sddata_state<=get_sddata_wait_start;
			end
		get_sddata_wait_start:
			begin
				if(get_sddata_outtime_over==1'b1)
					begin
						get_sddata_outtime_req<=1'b0;// 锟斤拷锟斤拷锟绞憋拷锟斤拷锟斤拷锟�
						get_sddata_outtime_flag<=1'b1;
						get_sddata_overflag<=1'b1;
						get_sddata_state<=get_sddata_over;
					end
				else				
					if((cmd_clk==1'b1)&&(sd_sddata_in==4'd0))						
						begin
							get_sddata_state<=get_sddata_shiftdata;
							get_sddata_outtime_req<=1'b0;// 锟斤拷锟斤拷锟绞憋拷锟斤拷锟斤拷锟�
						end
					else
						begin
							get_sddata_outtime_req<=1'b1;// 锟斤拷时锟斤拷锟斤拷锟斤拷
							get_sddata_times<=tran_data_timout;
						end
			end
		get_sddata_shiftdata:
			begin
				if(cmd_clk==1'b1)
					case(half_flag)
						0:
							begin
								outdata[7:4]<=sd_sddata_in[3:0];
								half_flag<=1'b1;
							end
						1:
							begin
								if(outdata_num==9'd511)
									begin
										get_sddata_state<=get_sddata_over;
										get_sddata_overflag<=1'b1;
									end
								else
									begin
										outdata[3:0]<=sd_sddata_in[3:0];
										half_flag<=1'b0;
										outdata_en<=1;
										outdata_num<=outdata_num+1'd1;
									end
							end
					endcase	
			end
		get_sddata_over:
			begin
				get_sddata_overflag<=1'b0;
				get_sddata_state<=get_sddata_idle;
				sd_sddata_dir<=1'b0;//锟斤拷为锟斤拷锟�
				half_flag<=0;
				outdata_en<=0;
				outdata_num<=0;
			end
	endcase
end

//锟斤拷锟捷达拷锟斤拷锟斤拷痰却锟斤拷锟斤拷锟斤拷锟斤拷莩锟绞�
parameter	counter1ms=16'hc350;
reg	clk1ms_pluse;
reg[15:0]	clk1ms_counter;
always @(posedge	sys_clk)
begin
	if(clk1ms_counter==counter1ms)
		begin
			clk1ms_counter<=0;
			clk1ms_pluse<=1'b1;
		end
	else
		begin
			clk1ms_pluse<=1'b0;
			clk1ms_counter<=clk1ms_counter+1'd1;
		end
end

reg[6:0]	get_sddata_outtime_counter;
//reg	get_sddata_outtime_over;
always @(posedge	sys_clk)
begin
	if(get_sddata_outtime_req==1'b1)
		begin
			if(get_sddata_outtime_counter==get_sddata_times)
				get_sddata_outtime_over<=1'b1;
			else
				if(clk1ms_pluse==1'b1)
					get_sddata_outtime_counter<=get_sddata_outtime_counter+1'd1;
		end
	else
		begin
			get_sddata_outtime_over<=0;
			get_sddata_outtime_counter<=0;
		end
end



//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟接δｏ拷锟�
always @(*)
begin
	if(sd_int_req==1'b1)
		begin
			send_cmd=send_int_cmd;
			send_cmd_req=send_int_cmd_req;
			send_int_cmd_overflag=send_cmd_overflag;
			
			get_respone_req=int_get_respone_req;
			respone_long_req=int_respone_long_req;
			int_get_respone_overflag=get_respone_overflag;
			int_get_respone_timeout=get_respone_timeout;			
			int_res_longdata=respone_longdata;
			int_res_shortdata=respone_shortdata;

			send_tran_cmd_overflag=0;
			tran_get_respone_overflag=0;
			tran_get_respone_timeout=0;
			tran_res_longdata=0;
			tran_res_shortdata=0;			
		end
	else
		begin
			send_cmd=send_tran_cmd;
			send_cmd_req=send_tran_cmd_req;
			send_tran_cmd_overflag=send_cmd_overflag;
			
			get_respone_req=tran_get_respone_req;
			respone_long_req=tran_respone_long_req;
			tran_get_respone_overflag=get_respone_overflag;
			tran_get_respone_timeout=get_respone_timeout;			
			tran_res_longdata=respone_longdata;
			tran_res_shortdata=respone_shortdata;	
		
			send_int_cmd_overflag=0;
			
			int_get_respone_overflag=0;
			int_get_respone_timeout=0;
			int_res_longdata=0;
			int_res_shortdata=0;			
		end
end


assign	sd_command_dir=(sd_in_command_dir==1'b1)?1'b1:1'b0;//SD_IN锟斤拷锟斤拷锟斤拷锟斤拷

assign	sd_command_out=(sd_out_command_dir==1'b1)?sd_command_out_temp:1'b1;//锟斤拷锟斤拷SD_CMD默锟斤拷锟斤拷1

assign	sd_clk=(sd_int_req==1'b1)?id_clk:data_clk;

assign	sd_idle_flag=(sd_int_req==1'b1)?sd_tran_idle_flag:1'b0;
// synopsys translate_off
initial	
begin

	id_clk_counter=0;
	id_clk_pluse=0;
	id_clk=0;
	data_clk=0;

	sd_int_state=sd_int_idle;
	sd_int_time_counter=0;

	sd_int_req=0;

	cmd0time_counter=0;
	sd_int_next_cmd0=0;
	SD_ACMD41=0;
	sd_type=0;
	sd_rca=0;
	sd_int_overflag=0;


	send_int_cmd=0;
	send_int_cmd_req=0;
	send_int_cmd_overflag=0;
//Respone
	int_get_respone_req=0;
	int_respone_long_req=0;
	int_get_respone_overflag=0;
	int_get_respone_timeout=0;			
	int_res_longdata=0;
	int_res_shortdata=0;

//ERR
	int_errout=0;

	sd_tran_state=sd_tran_idle;
	sd_tran_data_sync_counter=0;

	tran_data_timout=0;

	sd_block_address=0;
	block_numbers=0;
	block_counter=0;			
	out_block_number=0;
	trant_errout=0;

//SD_DATA
	get_sddata_outtime_flag=0;
	get_sddata_overflag=0;
	get_sddata_req<=0;
//CMD
	send_tran_cmd=0;
	send_tran_cmd_req=0;
	send_tran_cmd_overflag=0;
//Respone
	tran_get_respone_req=0;
	tran_respone_long_req=0;
	tran_get_respone_overflag=0;
	tran_get_respone_timeout=0;			
	tran_res_longdata=0;
	tran_res_shortdata=0;

	sd_tran_idle_flag<=0;

	send_cmd_state=send_cmd_idle;
//reg	send_cmd_overflag;
	cmd_sync_counter=0;
	cmd_outdata=0;
	cmd_bit_counter=0;
	cmd_last_data=0;
	cmd_last_data_outreq=0;

	sd_command_out_temp=0;

	crc7_indata=0;
	crc7_indata_req=0;

	send_cmd=0;
	send_cmd_req=0;
	sd_out_command_dir=0;
	send_cmd_overflag=0;


	get_respone_state=get_respone_idle;
	sd_in_command_dir=0;
	get_outtime_counter=0;

	zero_counter=0;
	respone_shift_counter=0;
	sd_command_intemp=0;
	get_last_counter=0;

	get_respone_req=0;
	respone_long_req=0;
	get_respone_overflag=0;
	get_respone_timeout=0;
	respone_longdata=0;
	respone_shortdata=0;


	get_sddata_state=get_sddata_idle;

	get_sddata_outtime_req=0;
	get_sddata_times=0;
	half_flag=0;
	outdata=0;
	outdata_en=0;
	outdata_num=0;

	sd_sddata_dir<=0;

	get_sddata_outtime_flag=0;

	clk1ms_pluse=0;
	clk1ms_counter=0;

	get_sddata_outtime_counter=0;
	
end
//synopsys translate_on 
endmodule
