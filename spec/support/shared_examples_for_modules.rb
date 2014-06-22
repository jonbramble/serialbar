RSpec.shared_examples_for Serialbox::Adapter do
		context 'with an instance' do
			#before(:each) do
			#	@obj = described_class.new
			#end
			# test instance methods here
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


RSpec.shared_examples_for Serialbox::Listener do
		context 'with an instance' do
			before(:each) do
				@obj = described_class.new("portname")
			end
			# test instance methods here

			it 'should be an instance of listener' do
				expect(@obj).to be_instance_of(described_class)
			end

			it 'should response to test listener method' do
      			expect(@obj.listener?).to be true
    		end

    		it 'should raise error if parse is missing on setup' do
    			expect(@obj.setup).to raise_error(NoMethodError, "Parse method not implemented")
    		end


		end

end