$LOAD_PATH << File.expand_path( File.dirname(__FILE__) + '/../lib' )

require 'serialbox'

class PhPoint
 include Serialbox::DataPoint
 adapter= :mongoid
 initialize_adapter
 field :ph
 field :time
 store_in session: "default"
end

class EhPoint
 include Serialbox::DataPoint
 adapter= :mongoid
 field :eh
 store_in session: "default"
end

class Listener < Serialbox::Listener
 #point = PhPoint.new({ph: "5"})
 puts PhPoint.respond_to?('mongoize')

 def parse 						#parse the input	
    point.inspect
 end

 #how does it poll the port, or wait for input? 

end

l = Listener.new("creature")
l.setup
l.run
