#pragma once

extern std::string base64_encode(unsigned char const* bytes_to_encode, unsigned int in_len);
extern std::string base64_decode(std::string const& encoded_string);