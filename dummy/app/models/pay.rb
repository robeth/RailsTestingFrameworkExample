class Pay < ActiveRecord::Base
	belongs_to :order, :foreign_key => "order_id"
end
