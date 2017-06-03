class Penguin < ApplicationRecord

  validates :head, presence: true
  validates :hand, presence: true
  validates :foot, presence: true

end
