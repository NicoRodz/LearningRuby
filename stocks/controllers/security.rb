require 'digest'
require 'openssl'

class Security

  def initialize()
    @md5 = Digest::MD5.new
  end

  def md5_pass(pass)
     @md5.reset
     @md5 << pass
     @md5.hexdigest
  end

  def encrypt(key)
    cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').encrypt
    cipher.key = Digest::SHA1.hexdigest key
    s = cipher.update(self) + cipher.final

    s.unpack('H*')[0].upcase
  end

  def decrypt(key)
    cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').decrypt
    cipher.key = Digest::SHA1.hexdigest key
    s = [self].pack("H*").unpack("C*").pack("c*")

    cipher.update(s) + cipher.final
  end


end
