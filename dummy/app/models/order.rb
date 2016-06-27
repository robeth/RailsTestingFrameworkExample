class Order < ActiveRecord::Base
	has_many :pays, dependent: :destroy
end
