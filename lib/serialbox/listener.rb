module Serialbox
	module Listener

		def initialize(portname)
			puts "serial port " + portname
		end

		def setup
			#create serial port
			puts parse
		end

		def run
			# Start reading from serial port
		end

		def method_missing(id, *args)
			 raise NoMethodError, "Parse method not implemented" if id.to_s.eql?("parse")    		    
 		end

end

end
