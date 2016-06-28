require 'spec_helper'

RSpec.describe DemoController, :type => :controller do

	describe "demo/index" do 

		it "should respond with an okay 200 status code" do
			get :index
      		expect(response).to be_success
      		expect(response).to have_http_status(200)
		end

		it "should render an index page" do 
			get :index
      		expect(response).to render_template("index")
		end

	end

	describe "demo/initial_store" do

		it "should respond with an okay 200 status code" do
			get :initial_store
      		expect(response).to be_success
      		expect(response).to have_http_status 200
		end

		it "should render a store page" do
			get :initial_store
      		expect(response).to render_template("store")
		end

		it "should have an integer initializer value from index" do
			get :initial_store, :item1 => 0, :item2 => 0
			expect(controller.params[:item1].to_i).to be_a_kind_of Integer
			expect(controller.params[:item2].to_i).to be_a_kind_of Integer
		end

		it "should have an initializer value of zeroes" do
			get :initial_store, :item1 => 0, :item2 => 0
			expect(controller.params[:item1].to_i).to eq 0
			expect(controller.params[:item2].to_i).to eq 0
		end
	end

	describe "demo/store" do 

		before :each do
			@item1 = Faker::Number.number(1)
			@item2 = Faker::Number.number(1)
		end

		it "should respond with an okay 200 status code" do
			get :store, :jumlahBeruang1 => @item1, :jumlahBeruang2 => @item2
      		expect(response).to be_success
      		expect(response).to have_http_status(200)
		end

		it "should render a store page" do
			get :store, :jumlahBeruang1 => @item1, :jumlahBeruang2 => @item2
      		expect(response).to render_template("store")
		end

		it "should have a cart values" do
			get :store, :jumlahBeruang1 => @item1, :jumlahBeruang2 => @item2
			expect(assigns(:jumlahBeruang1)).to eq @item1
			expect(assigns(:jumlahBeruang2)).to eq @item2
		end

	end

	describe "demo/pay_transaction" do

		before :each do
			@item1 = Faker::Number.number(1)
			@item2 = Faker::Number.number(1)
		end

		it "should respond with an okay 302 status code" do
			get :pay_transaction, :jumlahBeruang1 => @item1, :jumlahBeruang2 => @item2
      		expect(response).to have_http_status 302
		end

		it "should have a predefined store parameters" do
			get :pay_transaction, :jumlahBeruang1 => @item1, :jumlahBeruang2 => @item2

			expect(assigns(:jumlahBeruang1)).to_not eq nil
			expect(assigns(:jumlahBeruang2)).to_not eq nil
			expect(assigns(:jumlah)).to_not eq nil

			expect(assigns(:jumlahBeruang1)).to be_a_kind_of String
			expect(assigns(:jumlahBeruang2)).to be_a_kind_of String
			expect(assigns(:jumlah)).to be_a_kind_of Integer
		end

		it "should have several payment object" do 
			get :pay_transaction, :jumlahBeruang1 => @item1, :jumlahBeruang2 => @item2
			expect(assigns(:payment)).to_not eq nil
			expect(assigns(:result)).to_not eq nil
		end

		it "should have an order id and an amount" do 
			get :pay_transaction, :jumlahBeruang1 => @item1, :jumlahBeruang2 => @item2

			expect(assigns(:payment).order_id).to be_a_kind_of String
			expect(assigns(:payment).amount).to be_a_kind_of Integer
		end

		it "shouldn't have a minus transaction value" do
			get :pay_transaction, :jumlahBeruang1 => @item1, :jumlahBeruang2 => @item2
			expect(assigns(:payment).amount).to be > 0
		end

	end

	describe "demo/pay" do

		before :each do
			@order_id = Faker::Number.number(10)
		end

		it "should respond with an okay 200 status code" do
			get :pay, :order_id => @order_id
      		expect(response).to have_http_status(:success)
		end

		it "should have an order_id" do
			get :pay, :order_id => @order_id
		end

	end

end