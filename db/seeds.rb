require 'faker'

puts "Destroying seeded data..."

PurchaseHistory.destroy_all
User.destroy_all
Item.destroy_all

description = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
"You want to enjoy life, don't you? If you get your job done quickly and your job is fun, that's good isn't it? That's the purpose of life, partly. Your life is better.",
"Use your feelings, Obi-Wan, and find him you will."]
name = ["The Lord of the Rings: The Two Towers","In the beginning, the Universe was created. This has made a lot of people very angry and been widely regarded as a bad move.", "Star Wars"]

def create_items(name, url, cost, description, category)
    Item.create!(name: name, img_url: url, cost: cost, description: description, category: category)
end

(1..20).each do |i|
    create_items(Faker::Commerce.product_name, "http://lorempixel.com/#{rand(1..10)}02/#{rand(1..10)}00/", Faker::Commerce.price, Faker::Lorem.paragraph_by_chars, "Category#{["Men", "Women", "Kids"].sample}")
end

first_address = Address.create!(first_addressline: "123 Main St", second_addressline: "Self.Apt", city: "Flatiron", state: "this.state", zipcode: "11234")
second_address = Address.create!(first_addressline: "456 Main St", second_addressline: "Self.Apt", city: "Flatiron", state: "this.state", zipcode: "12345")

User.create!(name: "Luis", email: "luis@email.com", password: "123", isAdmin: true, address: first_address)
User.create!(name: "Kyle", email: "kyle@email.com", password: "password", address: second_address)

PurchaseHistory.create!(user: User.last, item: Item.first, status: "purchased")

puts "End of seed file."