class RequestController < ApplicationController
	skip_before_filter :verify_authenticity_token, only: [:receive_webhook]

	def receive_webhook
		render :nothing => true

    	post_body = request.body.read
    	callback_params = Veritrans.decode_notification_json(post_body)
	    verified_data = Veritrans.status(callback_params['transaction_id'])

	    if verified_data.status_code != 404

	    	@obj = Pay.where( order_id: verified_data.data[:order_id] )

	    	if @obj != nil
	    		@object = @obj.first
	    		@object.order_id 				= verified_data.data[:order_id]
	    		@object.payment_type 			= verified_data.data[:payment_type]
	    		@object.transaction_status 		= verified_data.data[:transaction_status]
	    		@object.fraud_status 			= verified_data.data[:fraud_status]
	    		@object.gross_amount			= verified_data.data[:gross_amount]

	    		@object.save
		    end

	    else
	      # do nothing here
	    end

	end

end
