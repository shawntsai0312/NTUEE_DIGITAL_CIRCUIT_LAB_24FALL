#include <cstdio>
#include <vector>
#include <boost/asio.hpp>
using namespace std;
namespace BAsio = boost::asio;

vector<char> LoadFile(const char *file_name, bool null_terminated = false)
{
	FILE *fp = fopen(file_name, "rb");
	assert(fp != nullptr);
	fseek(fp, 0, SEEK_END);
	const long file_size = ftell(fp);
	const long data_size = file_size + long(null_terminated);
	vector<char> data(data_size);
	rewind(fp);
	fread(data.data(), 1, file_size, fp);
	if (null_terminated) {
		data[file_size] = '\0';
	}
	fclose(fp);
	return data;
}

void SaveFile(const char *file_name, const vector<char> &data, bool null_terminated = false)
{
	FILE *fp = fopen(file_name, "wb");
	assert(fp != nullptr);
	fseek(fp, 0, SEEK_END);
	const long file_size = data.size() - long(null_terminated);
	fwrite(data.data(), 1, file_size, fp);
	fclose(fp);
}

class RsaRs232 {
	BAsio::io_service io;
	BAsio::serial_port port;
public:
	RsaRs232(const char *name): port(io)
	{
		typedef boost::asio::serial_port_base SB;
		boost::system::error_code err;
		port.open(name, err);
		assert(not err);
		port.set_option(SB::baud_rate(115200));
		port.set_option(SB::character_size(8));
		port.set_option(SB::stop_bits(SB::stop_bits::one));
		port.set_option(SB::parity(SB::parity::none));
		port.set_option(SB::flow_control(SB::flow_control::none));
	}
	void SendKey(const char *n_and_d)
	{
		BAsio::write(port, BAsio::buffer(n_and_d, 64));
	}
	void Decrypt(const char *encrypted_data, char *decrypted_data, const int n_chunk)
	{
		for (int i = 0; i < n_chunk; ++i) {
			BAsio::write(port, BAsio::buffer(encrypted_data+i*32, 32));
			BAsio::read(port, BAsio::buffer(decrypted_data+i*31, 31));
		}
	}
};

int main(int argc, char const* argv[])
{
	assert(argc == 2);

	// File I/O
	vector<char> key_data(LoadFile("key.bin"));
	assert(key_data.size() == 64);
	vector<char> encrypted_data(LoadFile("enc.bin"));
	const int n_chunk = encrypted_data.size()/32;
	assert(n_chunk*32 == encrypted_data.size());
	vector<char> decrypted_data(n_chunk*31);

	// Decrypte PC->RS232->FPGA->RS232->FPGA
	RsaRs232 rsa_rs232(argv[1]);
	rsa_rs232.SendKey(key_data.data());
	rsa_rs232.Decrypt(encrypted_data.data(), decrypted_data.data(), n_chunk);

	// File I/O
	SaveFile("dec.bin", decrypted_data);
	return 0;
}
