class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses
  has_many :ingredients, through: :doses

end
