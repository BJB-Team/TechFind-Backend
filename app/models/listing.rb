class Listing < ApplicationRecord
  belongs_to :user 
  belongs_to :job_level
  belongs_to :job_type

  has_many :application, dependent: :delete_all
end
