require 'rails_helper'

FactoryGirl.define do
	factory :order do
		order_id 			Faker::Number.number(10)
		item1				Faker::Number.number(1)
		item2				Faker::Number.number(1)
		vtweblink			'link' 
	end
end