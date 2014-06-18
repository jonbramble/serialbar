$LOAD_PATH << File.expand_path( File.dirname(__FILE__) + '/../lib' )

require 'serialbox'

class DataFile 
  include Serialbox::Adapter
  configure_adapter :mongoid
  field :time
  field :experiment
  store_in session: "default"
end

class PhPoint < DataFile
 field :ph
end

class EhPoint < DataFile
 field :eh
end

class Listener
 include Serialbox::Listener
 
 def parse 						#parse the input	
    p = PhPoint.new({ph: "5", time: Time.now, experiment: "TEST0001"})
    p.save
 end

 #how does it poll the port, or wait for input? 

end

#l = Listener.new("creature")
#l.setup
#l.run

p = PhPoint.new({ph: "5", time: Time.now, experiment: "TEST0001"})
p.save
points =  PhPoint.where(experiment: "TEST0001")
points.each do |point|
	puts point.time
end