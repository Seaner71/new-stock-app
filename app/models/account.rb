class Account < ApplicationRecord
  belongs_to :user
  has_many :stocks, dependent: :destroy
  validates :name, presence: true, length: { minimum: 6 }
  before_save :capitalize_fields

   def capitalize_fields
      self.name.capitalize!
   end

end
