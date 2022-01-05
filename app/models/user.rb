class User < ApplicationRecord
  has_secure_password
  has_one :seeker, :dependent => :destroy
  has_one :company, :dependent => :destroy

  has_many :listings, :dependent => :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  accepts_nested_attributes_for :seeker  
  accepts_nested_attributes_for :company  
end
