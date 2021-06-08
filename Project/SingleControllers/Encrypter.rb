require 'openssl'
require 'base64'
require_relative "Singleton"

class Encrypter 
    private_class_method :new
    
    def self.controller
        @@controller ||= new
    end

    def initialize
        @private_key = OpenSSL::PKey::RSA.new File.read("/home/diana/Documents/Ruby/Лаба 3/encrypt/private_key.pem")
        @public_key = OpenSSL::PKey::RSA.new File.read("/home/diana/Documents/Ruby/Лаба 3/encrypt/public_key.pem")
    end

    def encrypt(string)
        Base64.encode64(@public_key.public_encrypt(string))
    end

    def decrypt(string)
        @private_key.private_decrypt(Base64.decode64(string))
    end
end