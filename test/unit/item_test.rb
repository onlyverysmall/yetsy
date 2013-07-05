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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
