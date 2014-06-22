require 'serialport'

module Serialbox
	module Listener

		def parse_missing?
			parse("test string")
		end

		def listener?
			return true  #testing method
		end

		def setup(port)
			@portname = port || "/dev/tty0"
			@sp = SerialPort.new(@portname,9600,8,1)
		end

		def run
			# Start reading from serial port
		end

		def method_missing(id, *args)
			 raise Serialbox::NoParseMethodError, "Parse method not implemented" if id.to_s.eql?("parse")    		    
 		end

end

end
