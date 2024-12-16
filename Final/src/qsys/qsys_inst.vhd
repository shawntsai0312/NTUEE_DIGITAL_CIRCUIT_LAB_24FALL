	component qsys is
		port (
			altpll_108m_clk                   : out   std_logic;                                        -- clk
			clk_clk                           : in    std_logic                     := 'X';             -- clk
			reset_reset_n                     : in    std_logic                     := 'X';             -- reset_n
			usb_0_avalon_usb_slave_address    : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			usb_0_avalon_usb_slave_chipselect : in    std_logic                     := 'X';             -- chipselect
			usb_0_avalon_usb_slave_read       : in    std_logic                     := 'X';             -- read
			usb_0_avalon_usb_slave_write      : in    std_logic                     := 'X';             -- write
			usb_0_avalon_usb_slave_writedata  : in    std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			usb_0_avalon_usb_slave_readdata   : out   std_logic_vector(15 downto 0);                    -- readdata
			usb_0_external_interface_INT1     : in    std_logic                     := 'X';             -- INT1
			usb_0_external_interface_DATA     : inout std_logic_vector(15 downto 0) := (others => 'X'); -- DATA
			usb_0_external_interface_RST_N    : out   std_logic;                                        -- RST_N
			usb_0_external_interface_ADDR     : out   std_logic_vector(1 downto 0);                     -- ADDR
			usb_0_external_interface_CS_N     : out   std_logic;                                        -- CS_N
			usb_0_external_interface_RD_N     : out   std_logic;                                        -- RD_N
			usb_0_external_interface_WR_N     : out   std_logic;                                        -- WR_N
			usb_0_external_interface_INT0     : in    std_logic                     := 'X';             -- INT0
			altpll_12m_clk                    : out   std_logic;                                        -- clk
			altpll_100k_clk                   : out   std_logic;                                        -- clk
			altpll_400k_clk                   : out   std_logic                                         -- clk
		);
	end component qsys;

	u0 : component qsys
		port map (
			altpll_108m_clk                   => CONNECTED_TO_altpll_108m_clk,                   --              altpll_108m.clk
			clk_clk                           => CONNECTED_TO_clk_clk,                           --                      clk.clk
			reset_reset_n                     => CONNECTED_TO_reset_reset_n,                     --                    reset.reset_n
			usb_0_avalon_usb_slave_address    => CONNECTED_TO_usb_0_avalon_usb_slave_address,    --   usb_0_avalon_usb_slave.address
			usb_0_avalon_usb_slave_chipselect => CONNECTED_TO_usb_0_avalon_usb_slave_chipselect, --                         .chipselect
			usb_0_avalon_usb_slave_read       => CONNECTED_TO_usb_0_avalon_usb_slave_read,       --                         .read
			usb_0_avalon_usb_slave_write      => CONNECTED_TO_usb_0_avalon_usb_slave_write,      --                         .write
			usb_0_avalon_usb_slave_writedata  => CONNECTED_TO_usb_0_avalon_usb_slave_writedata,  --                         .writedata
			usb_0_avalon_usb_slave_readdata   => CONNECTED_TO_usb_0_avalon_usb_slave_readdata,   --                         .readdata
			usb_0_external_interface_INT1     => CONNECTED_TO_usb_0_external_interface_INT1,     -- usb_0_external_interface.INT1
			usb_0_external_interface_DATA     => CONNECTED_TO_usb_0_external_interface_DATA,     --                         .DATA
			usb_0_external_interface_RST_N    => CONNECTED_TO_usb_0_external_interface_RST_N,    --                         .RST_N
			usb_0_external_interface_ADDR     => CONNECTED_TO_usb_0_external_interface_ADDR,     --                         .ADDR
			usb_0_external_interface_CS_N     => CONNECTED_TO_usb_0_external_interface_CS_N,     --                         .CS_N
			usb_0_external_interface_RD_N     => CONNECTED_TO_usb_0_external_interface_RD_N,     --                         .RD_N
			usb_0_external_interface_WR_N     => CONNECTED_TO_usb_0_external_interface_WR_N,     --                         .WR_N
			usb_0_external_interface_INT0     => CONNECTED_TO_usb_0_external_interface_INT0,     --                         .INT0
			altpll_12m_clk                    => CONNECTED_TO_altpll_12m_clk,                    --               altpll_12m.clk
			altpll_100k_clk                   => CONNECTED_TO_altpll_100k_clk,                   --              altpll_100k.clk
			altpll_400k_clk                   => CONNECTED_TO_altpll_400k_clk                    --              altpll_400k.clk
		);

