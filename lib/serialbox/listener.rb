require 'serialport'

module Serialbox
	module Listener

		# Setup the serial port
		def setup(port, baud=9600, data_bits=8, stop_bits=1)
			@portname = port || "/dev/tty0"
			@sp = SerialPort.new(@portname,baud,data_bits,stop_bits)
		end

		# Direct access to the serialport serial port object
		def serial_port
			return @sp
		end

		# Trigger listening on setup serial port
		def run
			#is the serial port setup?
			puts "Listening on serial port #{@portname}"
			@sp.flush_input
    		begin 
 				while data = @sp.readline
 					parse_(data)
 				end
 	  			rescue Interrupt
  					puts "exiting"	
  				end
		end

		def method_missing(id, *args) #:nodoc:
			 raise Serialbox::NoParseMethodError, "Parse method not implemented" if id.to_s.eql?("parse")    		    
 		end

 		def listener? #:nodoc: Testing method for class inclusion
			return true  #testing method
		end

		def parse_missing? #:nodoc: Testing method for presence of parse
			parse("test string")
		end

end

end
