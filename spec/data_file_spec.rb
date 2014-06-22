require 'spec_helper'

RSpec.shared_examples_for Serialbox::Adapter do
		context 'with an instance' do
			#before(:each) do
			#	@obj = described_class.new
			#end
		end

		context 'class methods' do
			it 'should be an adapted class' do
				expect(described_class).to respond_to :foo
			end

			it "responds to configure adapter" do
 	 			expect(described_class).to respond_to :configure_adapter
 			end
		end
end


class DataFile
	include Serialbox::Adapter
end

RSpec.describe DataFile do
	it_behaves_like Serialbox::Adapter
end
