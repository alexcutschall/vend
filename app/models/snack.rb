class Snack < ApplicationRecord
  validates :name, :price, presence: true
  has_and_belongs_to_many :machines
end
