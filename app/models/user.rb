class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :job_listings

  validates :username, uniqueness: true, presence: true, length: { minimum: 3 }
  validates :first_name, presence: true
  validates :last_name, presence: true

end
