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
    name: "cheeseburger",
    ingredients: ["cheese", "beef", "bread"]
  },
  {
    name: "grilled cheese",
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

9.times do
  Table.create
end

User.create(username: "jagens", password: "123", wallet: 100)
User.create(username: "John", password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)
User.create(username: Faker::Name.first_name, password: "123", wallet: 100)



Pot.create
Pot.create
Pot.create


recipe_ings.each do |item|
  new_rec = Recipe.create(name: item[:name], cook_time: rand(10..30))

  item[:ingredients].each do |ing|
    new_ing = Ingredient.find_or_create_by(name: ing)
    RecipeIngredient.create(recipe_id: new_rec.id, ingredient_id: new_ing.id)
  end

end

150.times do
  table = Table.all.sample
  boos = [true, false]
  order = Order.new(item_name: recipes.sample, served: false, price: 4, user_id: rand(User.first.id..User.last.id), table_id: rand(2..9))
  if order.valid?
    order.save
  end
end
