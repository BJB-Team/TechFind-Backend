class User < ApplicationRecord
  has_secure_password
  has_one :seeker, dependent: :delete
  has_one :company, dependent: :delete
  has_many :listings, dependent: :delete_all


  accepts_nested_attributes_for :seeker  
  accepts_nested_attributes_for :company  

  validates :username, presence: true, uniqueness: true, length: {minimum: 5}    
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}  

end
