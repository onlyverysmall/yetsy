# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  buyer_id   :integer          not null
#  shop_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :boolean          default(FALSE), not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
