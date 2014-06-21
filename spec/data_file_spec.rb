require 'serialbox'

RSpec.describe "Datafile" do 

	context "without include adapter" do 
		class DataFile
			#include Serialbox::Adapter
		end

		it "does not respond to configure adapter" do
	 		expect(DataFile).not_to respond_to :configure_adapter
		end

		it "does not respond to foo" do
	 		expect(DataFile).not_to respond_to :foo
		end
	end

	context "with include adapter" do 
		class DataFile
			include Serialbox::Adapter
		end

		it "responds to configure adapter" do
	 		expect(DataFile).to respond_to :configure_adapter
		end

		it "responds to foo" do
	 		expect(DataFile).to respond_to :foo
		end
	end

end