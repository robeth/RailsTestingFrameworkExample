class DemoController < ApplicationController

  def new
  end

  def show
  end

  def initial_store
  	@jumlahBeruang1 = params['item1']
  	@jumlahBeruang2 = params['item2']
  	render('demo/store')
  end

  def store
  	if params['jumlahBeruang1'].to_i < 0
  		@jumlahBeruang1 = 0
  	else 
  		@jumlahBeruang1 = params['jumlahBeruang1']
  	end

  	if params['jumlahBeruang2'].to_i < 0
  		@jumlahBeruang2 = 0
  	else 
  		@jumlahBeruang2 = params['jumlahBeruang2']
  	end
  end

  def pay_transaction
    @jumlahBeruang1 = params['jumlahBeruang1']
    @jumlahBeruang2 = params['jumlahBeruang2']

    @jumlah = (params['jumlahBeruang1'].to_i*2000) + (params['jumlahBeruang2'].to_i*3000)

    @payment = make_payment @jumlah.to_i

    @result = Veritrans.charge(
       payment_type: "VTWEB",
       transaction_details: {
        order_id: @payment.order_id,
        gross_amount: @payment.amount,
      }
    )

    @order = Order.create(
      :order_id => @payment.order_id,
      :item1 => @jumlahBeruang1,
      :item2 => @jumlahBeruang2,
      :vtweblink => "#{@result.redirect_url}"
    )

    @order.save

    @data = Pay.create(
        :order_id => @payment.order_id, 
        :payment_type => nil, 
        :transaction_status => 'notification not sent', 
        :fraud_status => nil, 
        :gross_amount => @payment.amount )

    @data.save

    redirect_to @result.redirect_url

    

    # testing code 
    # redirect_to(:controller => 'demo', :action => 'pay', :status => @result.success?.to_s , :link => @payment.amount)
  end

  def pay
    @order_id           = params['order_id']
    @transaction_status = params['transaction_status']
  end

  def index
  end

  private
  def make_payment(amount)
    @paymentKlass = Struct.new("Payment", :amount, :token_id, :order_id, :credit_card_secure) do
      extend ActiveModel::Naming
      include ActiveModel::Conversion

      def persisted?; false; end

      def self.name
        "Payment"
      end

    end

    @paymentKlass.new(amount, '', "testing-#{rand.round(4)}-#{Time.now.to_i}", false)
  end

end
