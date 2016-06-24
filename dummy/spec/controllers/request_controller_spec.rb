require 'rails_helper'

RSpec.describe RequestController, :type => :controller do

	describe "notification webhook" do

		let(:pay) { FactoryGirl.build(:pay) }
		let(:json_string) {
			RecursiveOpenStruct.new(
			  {
			    status_code: "200",
			    status_message: "Test Notification",
			    transaction_id: Faker::Number.number(16) ,
			    order_id: Faker::Number.number(16) ,
			    transaction_time: "2016-06-22 22:44:22 +0700",
			    transaction_status: "settlement",
			    gross_amount: "7000",
			    signature_key: Faker::Number.hexadecimal(128)
			  }
			)
		}
		let(:veritrans_status) { 
	      {  
	        status_code: 200, 
	        data: {
	          order_id: Faker::Number.number(16),
	          payment_type: "bank_transfer",
	          transaction_status: "settlement",
	          fraud_status: "accept",
	          gross_amount: Faker::Number.number(4)
	        }
	      } 
	    }

		before :each do
			@string = json_string

			allow(Veritrans).to receive(:status).and_return(RecursiveOpenStruct.new(veritrans_status))
			allow(Pay).to receive(:where).and_return([pay])
		end

      	describe "database behaviour" do

  		  	context 'Veritrans return 200 status code' do

    		  it "should update the database" do
    			expect(Pay).to receive(:where)
    			post :receive_webhook, @string.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    		  end

  		   	end

  		  	context 'Veritrans return 404 status code' do
  			  let(:veritrans_status) { {status_code: 404, data: {order_id: "testing-0.3124-1466655065"}} }

  			    it "should not update the database" do
  				  expect(Pay).not_to receive(:where)
  				  post :receive_webhook, @string.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  			    end

  			end

    	end

		it "able to receive data, regardless of valid or not" do
			post :receive_webhook, @string.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
		end

		it "able to process data" do
			# formulate testing post data and post it
			@string = json_string
			expect(Pay).to receive(:where)
			post :receive_webhook, @string.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

			# test every components and make sure it's existence
			post_body = controller.request.body.read
		   	callback_params = Veritrans.decode_notification_json(post_body)
			verified_data = Veritrans.status(callback_params['transaction_id'])

	        expect(post_body).not_to eq nil
	        expect(callback_params).not_to eq nil
	        expect(verified_data).not_to eq nil

	   		expect(callback_params['status_message']).to eq json_string.status_message
	  		expect(verified_data.status_code).not_to eq 404
		end

	end

end