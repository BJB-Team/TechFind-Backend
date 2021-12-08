class User < ApplicationRecord
  has_secure_password
  has_one :seeker

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  accepts_nested_attributes_for :seeker  
end
