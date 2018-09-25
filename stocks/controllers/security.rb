require 'digest'

class Security

  def initialize()
    @md5 = Digest::MD5.new
  end

  def md5_pass(pass)
     @md5.reset
     @md5 << pass
     @md5.hexdigest
  end

end
