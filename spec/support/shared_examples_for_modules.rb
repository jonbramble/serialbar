RSpec.shared_examples_for Serialbar::Adapter do
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


RSpec.shared_examples_for Serialbar::Listener do
		context 'with an instance' do
			before(:each) do
				@obj = described_class.new
			end
			
			# test instance methods here
			it 'should be an instance of listener' do
				expect(@obj).to be_instance_of(described_class)
			end

			it 'should response to test listener method' do
      				expect(@obj.listener?).to eq(true)
      			end

		end

end
