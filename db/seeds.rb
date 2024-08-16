# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing records
Review.delete_all
Booking.delete_all
LifeMoment.delete_all
User.delete_all

# Life MOMENT 1 : Cat in Delhi
cloudinary_image_1 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723735571/development/rq7kj597wkk3sqa7a9a5sezcvo4d.jpg"

# Creating User
user1 = User.create!(email: "user1@gmail.com", username: "user1", password: "passworduser1")
puts "User created: #{user1.persisted?}"

# Creating LifeMoment 1
life_moment1 = LifeMoment.new(
  user: user1,
  title: "LIVE THE BEAUTIFUL CAT LIFE. BECOME A CAT!",
  price_per_night: 2200,
  description: "Location: New Delhi, India. Cat is taken care of by neighbours (no food problem). We are not responsible of any fights with other cats."
)

# Validate and save LifeMoment 1
if life_moment1.valid?
  life_moment1.save!
  puts "First LifeMoment created: #{life_moment1.persisted?}"
else
  puts "First LifeMoment invalid: #{life_moment1.errors.full_messages.join(', ')}"
end

# Attaching the Photo to LifeMoment 1
life_moment1.photo.attach(
  io: URI.open(cloudinary_image_1),
  filename: 'cat.jpg',
  content_type: 'image/jpg'
)
life_moment1.save!


# Life MOMENT 2 : 50 year old wall street executive living in NY
cloudinary_image_2 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723545473/development/ai0j0dwoormgz2tsvgknl2nuibjg.jpg"

# Creating LifeMoment 2
life_moment2 = LifeMoment.new(
  user: user1,
  title: "50 year old wall street executive living in NY",
  price_per_night: 15000,
  description: "You're not that guy pal. But you can be this guy."
)

# Validate and save LifeMoment 2
if life_moment2.valid?
  life_moment2.save!
  puts "Second LifeMoment created: #{life_moment2.persisted?}"
else
  puts "Second LifeMoment invalid: #{life_moment2.errors.full_messages.join(', ')}"
end

# Attaching the Photo to LifeMoment 2
life_moment2.photo.attach(
  io: URI.open(cloudinary_image_2),
  filename: 'man.jpg',
  content_type: 'image/jpg'
)
life_moment2.save!
