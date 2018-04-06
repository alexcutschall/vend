class Snack < ApplicationRecord
  validates :name, :price, presence: true
  has_many :machine_snacks
  has_and_belongs_to_many :snacks
end
