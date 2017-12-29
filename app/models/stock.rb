class Stock < ApplicationRecord
  belongs_to :account
  belongs_to :user
  validates :ticker, uniqueness: true
end
