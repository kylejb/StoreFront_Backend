puts "Destroying seeded data..."
User.destroy_all
Item.destroy_all
PurchaseHistory.destroy_all

def create_items(name, url, cost, description)
    Item.create!(name: name, img_url: url, cost: cost, description: description)
end

(1..20).each do |i|
    create_items("Name#{i}", "http://lorempixel.com/402/200/", i, "Description#{i}")
end

User.create!(name: "Luis", email: "luis@email.com", password: "123", isAdmin: true)
User.create!(name: "Kyle", email: "kyle@email.com", password: "password")

# PurchaseHistory.create!(user: User.last, item: Item.first, status: "purchased")

puts "End of seed file."