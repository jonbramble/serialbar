require 'serialport'

module Serialbox
	module Listener

		def parse_missing?
			parse("test string")
		end

		def listener?
			return true  #testing method
		end

		def setup(port, baud=9600, data_bits=8, stop_bits=1)
			@portname = port || "/dev/tty0"
			@sp = SerialPort.new(@portname,baud,data_bits,stop_bits)
		end

		def run
			puts "Listening on serial port #{@portname}"
		end

		def method_missing(id, *args)
			 raise Serialbox::NoParseMethodError, "Parse method not implemented" if id.to_s.eql?("parse")    		    
 		end

end

end
