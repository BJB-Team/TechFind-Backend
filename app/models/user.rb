class User < ApplicationRecord
  has_secure_password
  has_one :seeker
  has_many :listings

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  accepts_nested_attributes_for :seeker  
end
