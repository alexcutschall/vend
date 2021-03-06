class Machine < ApplicationRecord
  belongs_to :owner
  has_and_belongs_to_many :snacks

  def average_price_of_snacks
    snacks.average(:price)
  end
end
