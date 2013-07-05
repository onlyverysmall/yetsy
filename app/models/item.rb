# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  title          :string(255)      not null
#  description    :text             not null
#  price          :decimal(, )      not null
#  category_id    :integer          not null
#  shop_id        :integer          not null
#  purchased      :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  filepicker_url :string(255)
#  order_id       :integer
#

class Item < ActiveRecord::Base
  attr_accessible :title, :description, :price, :category_id, :shop_id, :filepicker_url, :order_id

  validates :title, :description, :price, :category_id, :shop_id, :filepicker_url, presence: true

  belongs_to :shop
  has_one :owner, through: :shop
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :favoriting_users, 
    through: :favorites, 
    source: :user
  belongs_to :order

  scope :available, conditions: { order_id: nil }
  scope :sold, where("order_id IS NOT NULL ")

  def category_name
    self.category.name
  end
end
