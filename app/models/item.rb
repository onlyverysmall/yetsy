# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  description :text             not null
#  price       :decimal(, )      not null
#  category_id :integer          not null
#  shop_id     :integer          not null
#  purchased   :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base
  attr_accessible :title, :description, :price, :category_id, :shop_id

  validates :title, :description, :price, :category_id, :shop_id, presence: true

  belongs_to :shop
  belongs_to :category
end
