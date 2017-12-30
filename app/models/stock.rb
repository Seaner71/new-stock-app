class Stock < ApplicationRecord
  belongs_to :account
  belongs_to :user
  validates :ticker, uniqueness: true
  validates :ticker, presence: true, length: { maximum: 6 }
end
