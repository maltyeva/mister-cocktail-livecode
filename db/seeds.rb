require 'open-uri' #ruby library, not a gem

if Rails.env.development?
  Dose.destroy_all
  Ingredient.destroy_all
  Cocktail.destroy_all
end

url = "https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json"

cocktails = JSON.parse(open(url).read)

cocktails.each do |cocktail|
  c = Cocktail.create!(name: cocktail["name"])
  cocktail["ingredients"].each do |ingredient|
    i = Ingredient.find_or_create_by(name: ingredient["ingredient"])
    d = Dose.create(cocktail: c, ingredient: i, description: ingredient["amount"].to_s || "" + "of" + ingredient["unit"] )
  end
end
