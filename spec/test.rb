$LOAD_PATH << File.expand_path( File.dirname(__FILE__) + '/../lib' )

require 'serialbox'

class PhPoint #< Serialbox::DataPoint 
 include Serialbox::DataPoint
 field :ph
 field :time
 store_in session: "default"
end

class EhPoint #< Serialbox::DataPoint
 include Serialbox::DataPoint
 field :eh
 field :time
 store_in session: "default"
end

class Listener
 include Serialbox::Listener
 
 def parse 						#parse the input	
    point = PhPoint.new({ph: "5"})
    puts point.inspect
 end

 #how does it poll the port, or wait for input? 

end

l = Listener.new("creature")
l.setup
l.run
