require 'spec_helper'

#dummy class
class Ascoltatore
	include Serialbox::Listener
end

class Listener
	include Serialbox::Listener
	def parse(string)
	end
end

RSpec.describe Ascoltatore do
	it_behaves_like Serialbox::Listener

	before(:each) do
		@obj = described_class.new
	end

    it 'should raise error if parse is missing' do
    	expect { @obj.parse_missing? }.to raise_error(Serialbox::NoParseMethodError, "Parse method not implemented")
    end
end

RSpec.describe Listener do
	it_behaves_like Serialbox::Listener

	before(:each) do
		@obj = described_class.new
	end

    it 'should not raise error if parse is present' do
    	expect { @obj.parse_missing? }.not_to raise_error
    end
end