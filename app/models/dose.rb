class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true
  validates :ingredient, uniqueness: { scope: :cocktail}

  def full_description
    self.description + " - " + self.ingredient.name
  end
end
