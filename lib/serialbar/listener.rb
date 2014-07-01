require 'serialport'
require 'timers'

module Serialbar
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
  					@sp.close
  				end
  			end
		end

		# Poll device by sending string 
		#
		# ==== Attributes
		#
		# * +send+ - string to send to the serial port
		# * +block+ - execute a block if port is open - call parse on return data
		#
		# ==== Examples
		# 
		# 		data = listener.poll("#001N\n")
		# 
		# read lines not implemented yet
		def poll(send,&block)
			if port_initialized?
				if block_given?
					block.call	
				else
					begin
						@sp.write(send)
						data = @sp.readline
					rescue Interrupt
  						puts "Exiting"	
  						@sp.close
  					end
  						parse(data)
  				end
  			end
		end

		# Poll device with a timer
		#
		# data is passed as an argument to parse
		#
		# ==== Attributes
		#
		# * +send+ - string to send to the serial port
		# * +n+ - number of seconds between each poll of the device
		#
		def poll_every_n_seconds(send,n=1)
			timer = Timers::Group.new
			every_seconds = timer.every(n) { poll(send) }
			loop { timer.wait } 
		end
	
		# Poll device with a timer
		# 
		# data is passed as an argument to parse
		#
		# ==== Attributes
		#
		# * +send+ - string to send to the serial port
		# * +n+ - number of minutes between each poll of the device
		#
		def poll_every_n_minutes(send,n=1)
			timer = Timers::Group.new
			every_seconds = timer.every(60*n) { poll(send) }
			loop { timer.wait } 
		end

		# Using method missing to check for the inclusion of the subclass implementation of parse
		# 
		def method_missing(id, *args) #:nodoc:
			if id.to_s.eql?("parse")    		
				raise Serialbar::Exceptions::NoParseMethodError, "Parse method not implemented"     
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
				raise Serialbar::Exceptions::PortNotInitialized, "Call setup on listener class to initialize serial port"     
			else
				return true
			end

		end

end

end
