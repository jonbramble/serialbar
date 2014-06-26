require 'spec_helper'

#dummy class
class Ascoltatore
	include Serialbar::Listener
end

class Listener
	include Serialbar::Listener
	def parse(string)
	end
end

RSpec.describe Ascoltatore do
	it_behaves_like Serialbar::Listener

	before(:each) do
		@obj = described_class.new
	end

    it 'should raise error if parse is missing' do
    	expect { @obj.parse_missing? }.to raise_error(Serialbar::Exceptions::NoParseMethodError, "Parse method not implemented")
    end
end

RSpec.describe Listener do
	it_behaves_like Serialbar::Listener

	before(:each) do
		@obj = described_class.new
	end

    it 'should not raise error if parse is present' do
    	expect{@obj.parse_missing?}.not_to raise_error
    end

	it 'should raise a PortNotInitialized exception if setup has not been called' do
		expect{@obj.port_initialized?}.to raise_error(Serialbar::Exceptions::PortNotInitialized, "Call setup on listener class to initialize serial port")
	end

	it 'should return a serialport object' do
		#pending("No serialports on this computer")
		#this_should_not_get_executed
		@obj.setup("/dev/ttyS0")  # don't have serialports on this test computer
		expect(@obj.serial_port).to be_instance_of SerialPort
	end
end
