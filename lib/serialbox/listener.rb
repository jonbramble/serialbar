require 'serialport'
require 'timers'

module Serialbox
	module Listener

		# Setup the serial port
		def setup(port, baud=9600, data_bits=8, stop_bits=1, parity=1)
			@portname = port
			@sp = SerialPort.new(@portname,baud,data_bits,stop_bits,parity)
			@setup = true
		end

		# Direct access to the serialport serial port object
		def serial_port
			return @sp if port_initialized?
		end

		# Trigger listening on setup serial port
		# 
		# simply reads each line from the port and passes it as string to implemented parse method
		def run
			#is the serial port setup?
			puts "Listening on serial port #{@portname}"
			if port_initialized?
				@sp.flush_input
    			begin 
 				while data = @sp.readline
 					parse(data)
 				end
 	  			rescue Interrupt
  					puts "Exiting"	
  				end
  			end
		end

		# Poll device by sending string 
		#
		# ==== Attributes
		#
		# * +send+ - string to send to the serial port
		# * +lines+ - number of lines to read back
		#
		# ==== Examples
		# 
		# 		data = listener.poll("#001\\n")
		# 
		# read lines not implemented yet
		def poll(send,lines=1)
			if port_initialized?
				begin
					@sp.write(send)
					data = @sp.readline
				rescue Interrupt
  					puts "Exiting"	
  				end
  				parse(data)
  			end
		end

		# Poll device with a timer
		# could use clever missing_method stuff here
		#
		# data is passed as an argument to parse
		#
		# ==== Attributes
		#
		# * +send+ - string to send to the serial port
		# * +lines+ - number of lines to read back
		# * +n+ - number of seconds between each poll of the device
		#
		def poll_every_n_seconds(send,lines=1,n=1)
			timer = Timer.new
			every_seconds = timers.every(n) { parse(poll(send,lines)) }
			loop { timers.wait } 
		end
	
		# Poll device with a timer
		# could use clever missing_method stuff here
		# 
		# data is passed as an argument to parse
		#
		# ==== Attributes
		#
		# * +send+ - string to send to the serial port
		# * +lines+ - number of lines to read back
		# * +n+ - number of minutes between each poll of the device
		#
		def poll_every_n_minutes(send,lines=1,n=1)
			timer = Timer.new
			every_seconds = timers.every(60*n) { parse(poll(send,lines)) }
			loop { timers.wait } 
		end

		# Using method missing to check for the inclusion of the subclass implementation of parse
		# 
		def method_missing(id, *args) #:nodoc:
			if id.to_s.eql?("parse")    		
				raise Serialbox::Exceptions::NoParseMethodError, "Parse method not implemented"     
			else
				raise NoMethodError
			end
 		end

 		def listener? #:nodoc: Testing method for class inclusion
			return true  #testing method
		end

		def parse_missing? #:nodoc: Testing method for presence of parse
			parse("test string")
		end

		def port_initialized?
			if @sp.nil?
				raise Serialbox::Exceptions::PortNotInitialized, "Call setup on listener class to initialize serial port"     
			else
				return true
			end

		end

end

end
