module Serialbox
	module Listener

		def initialize(portname)
			puts "serial port " + portname
		end

		def listener?
			true  #testing method
		end

		def setup
			#create serial port
			puts parse
		end

		def run
			# Start reading from serial port
		end

		def method_missing(id, *args)
			 raise Serialbox::NoParseMethodError, "Parse method not implemented" if id.to_s.eql?("parse")    		    
 		end

end

end
