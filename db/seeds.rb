# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
recipes = [
  "cheeseburger",
  "grilled cheese",
  "spaghetti",
  "pizza",
  "chili",
]

ingredients = [
  "cheese",
  "beef",
  "bread",
  "butter",
  "tomato sauce",
  "pasta",
  "dough",
  "sausage",
  "beans",
  "onions"
]

recipe_ings = [
  {
    name: "cheesburger",
    ingredients: ["cheese", "beef", "bread"]
  },
  {
    name: "grilled cheeese",
    ingredients: ["cheese", "bread", "butter"]
  },
  {
    name: "spaghetti",
    ingredients: ["tomato sauce", "pasta", "butter"]
  },
  {
    name: "pizza",
    ingredients: ["tomato sauce", "cheese", "dough", "sausage"]
  },
  {
    name: "chili",
    ingredients: ["beef", "tomato sauce", "beans", "onions"]
  }
]

3.times do
  Table.create
end

Party.create(name: Faker::Name.first_name, table_id: 1)
Party.create(name: Faker::Name.first_name, table_id: 2)
Party.create(name: Faker::Name.first_name, table_id: 3)


Pot.create

recipe_ings.each do |item|
  new_rec = Recipe.create(name: item[:name], cook_time: rand(10..30))

  item[:ingredients].each do |ing|
    new_ing = Ingredient.find_or_create_by(name: ing)
    RecipeIngredient.create(recipe_id: new_rec.id, ingredient_id: new_ing.id)
  end

end

10.times do
  recipe = Recipe.all.sample
  Order.create(item_name: recipe.name, served: false, price: rand(5..20), party_id: rand(Party.first.id..Party.last.id), recipe_id: recipe.id)
end
