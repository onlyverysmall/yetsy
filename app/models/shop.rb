# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  owner_id   :integer          not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shop < ActiveRecord::Base
  attr_accessible :name, :owner_id

  validates :name, :owner, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 16 }

  belongs_to :owner, 
    class_name: "User",
    inverse_of: :shop
  has_many :items, 
    dependent: :destroy
  has_many :orders, 
    through: :items, 
    inverse_of: :shop
  has_many :sold_items, 
    through: :orders,
    source: :items
  has_many :buyers, 
    through: :orders

  def to_param
    self.name
  end
end
