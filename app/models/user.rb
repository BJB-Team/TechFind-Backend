class User < ApplicationRecord
  has_secure_password
  has_one :seeker, :dependent => :destroy
  has_one :company, :dependent => :destroy
  accepts_nested_attributes_for :seeker  
  accepts_nested_attributes_for :company  
  

  has_many :listings, :dependent => :destroy

  validates :username, presence: true, uniqueness: true, length: {minimum: 5}    
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}  

end
