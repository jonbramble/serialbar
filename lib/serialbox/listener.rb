module Serialbox
    
    # need this here otherwise it gives an error for uninit const
    module Helpers
    end

	class Listener
		include Helpers
		
		def initialize(portname)
			puts portname
			puts time
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
