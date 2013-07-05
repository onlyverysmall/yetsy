# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  session_token   :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  filepicker_url  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :password, :username, :shop_attributes, :filepicker_url

  validates :username, :password_digest, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 3 }

  has_one :shop, 
    foreign_key: :owner_id,
    dependent: :destroy,
    inverse_of: :owner
  has_many :items, through: :shop
  has_many :favorites, dependent: :destroy
  has_many :favorited_items, 
    through: :favorites,
    source: :item
  has_many :orders, foreign_key: :buyer_id

  accepts_nested_attributes_for :shop, :reject_if => :all_blank
  

  def password
    @password || self.password_digest
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def verify_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end
