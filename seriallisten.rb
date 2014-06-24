require 'serialport'
require 'mongoid'
require 'json'
require 'awesome_print'

class PHPoint
	include Mongoid::Document
	field :time
	field :experiment
	field :ph
	store_in session: "default"
end

class EHPoint
	include Mongoid::Document
	field :time
	field :experiment
	field :mv
	store_in session: "default"
end

class PHListener
	
  	
end



class SerialListen
   def initialize(port)
   	 puts "Initialize"
   	 Mongoid.load!("mongoid.yml", :production)
   	 @portname = port || "/dev/ttyUSB0"
   	 @sp = SerialPort.new(port,9600,8,1)
   end

   	def parse_input(string)	
		ig = ["Channel: R", "Channel: L"]
    	unless ig.any?{|s| string.include?(s)} || string.chomp.empty?
    		tm = Time.now
    		data = string.split
    		mv = ""
    		ph = ""

    		#experiment = options[:experiment]
    		experiment = "SPN0001"

    		if data[1].eql?("mV")
    			mv = data[0]
    			str = {time: tm, mv: mv, experiment: experiment}
    			save_eh_to_db(str)
    		end
    		if data[1].eql?("pH")
    			ph = data[0]
    			str = {time: tm, ph: ph, experiment: experiment}
    			save_ph_to_db(str)
    		end

    		ap str
    	end
    end


   def run
   	puts "Listening on serial port #{@portname}"
    
   	@sp.flush_input
    begin 
 		while data = @sp.readline
 			parse_input(data)
 		end
 	  rescue Interrupt
  		puts "exiting"	
  	end

   end

   def save_eh_to_db(data)
   		data_point = EHPoint.new(data)
   		data_point.save
   end

   def save_ph_to_db(data)
   	   	data_point = PHPoint.new(data)
   		data_point.save
   	
   end

end

#listen = SerialListen.new("/dev/ttyUSB0")
#listen.run

Mongoid.load!("mongoid.yml", :production)
#PHPoint.where(experiment: "TEST0002").each do |point|
 #puts point.ph
#end
puts PHPoint.last.ph

