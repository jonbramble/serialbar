module Serialbox
 module BoilerPlate

  def self.listener_class
    "require 'serialbox'\n"+
    "require_relative 'data_file'\n\n"+
  	"class Listener\n"+
  	"\tinclude Serialbox::Listener\n"+
  	"\tdef parse(string)\n"+
  	"\t#TODO: implement your parser here\n"+
  	"\tend\n"+
  	"end\n"+
  	"\n\n"+
    "ln = Listener.new\n"+
	"ln.setup(serialport params)\n"+
	"ln.run\n"
  end

  def self.data_file_class
  	"class DataFile\n"+
  	"\tinclude Serialbox::Adapter\n"+
  	"\tstore_in session: 'default'\n"+
  	"\t#TODO: add your data variables here\n"+
  	"\t#field :time\n"+
  	"\t#field :experiment\n"+
  	"end\n\n"+
  	"#Subclass DataFile for specific data points"
  	"class DataPoint < DataFile\n"+
  	"\t#field :temp\n"+
  	"end"
  end

  def self.config_adapter_string(adapter)
  	"\tconfigure_adapter :#{adapter.to_sym}\n"
  end
 end
end
