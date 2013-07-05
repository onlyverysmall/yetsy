# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  buyer_id   :integer          not null
#  shop_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ActiveRecord::Base
  attr_accessible :buyer_id, :shop_id

  belongs_to :buyer, class_name: "User"
  belongs_to :shop 
  has_many :items
end
