require 'rails_helper'

describe 'payment details page', :type => :feature do 
	
	it "should allow user to go to transactions page" do
		visit 'demo/pay'
		click_link 'Lihat Daftar Transaksi'
	end

	it "should allow user to go to order page" do
		visit 'demo/pay'
		click_link 'Lihat Detil Order'
	end

	it "should allow user to go to pay page" do
		visit 'demo/pay'
		click_link 'Lihat Detil Pembayaran'
	end

end