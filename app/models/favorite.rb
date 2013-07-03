# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :item_id

  validates :user_id, :item_id, presence: true
  validates :user_id, uniqueness: { scope: :item_id }

  belongs_to :user
  belongs_to :item
end
