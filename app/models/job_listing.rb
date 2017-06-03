class JobListing < ApplicationRecord

  belongs_to :user

  validates :position, presence: true
  validates :description, presence: true
  validates :salary, presence: true

end
