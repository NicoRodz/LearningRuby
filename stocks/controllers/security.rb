require 'digest'
require 'openssl'

class Security

  def initialize()
    @md5 = Digest::MD5.new
    @key = 'als823lj8adqnkl'
  end

  def md5_pass(pass)
     @md5.reset
     @md5 << pass
     @md5.hexdigest
  end

  def encrypt(plain_text)
    key = @key
    cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').encrypt
    cipher.key = Digest::SHA1.hexdigest key
    s = cipher.update(plain_text) + cipher.final

    s.unpack('H*')[0].upcase
  end

  def decrypt(cipher_text)
    key = @key
    cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').decrypt
    cipher.key = Digest::SHA1.hexdigest key
    s = [cipher_text].pack("H*").unpack("C*").pack("c*")

    cipher.update(s) + cipher.final
  end

end
