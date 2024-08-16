# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Life MOMENT 1 : Cat in Delhi
cat_image_url = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723735571/development/rq7kj597wkk3sqa7a9a5sezcvo4d.jpg"

# Creating User
user1 = User.create!(email: "user1@gmail.com", username: "user1", password: "passworduser1")

# Creating LifeMoment
life_moment1 = LifeMoment.create!(
  user: user1,
  title: "LIVE THE BEAUTIFUL CAT LIFE. BECOME A CAT!",
  price_per_night: 2200,
  description: "Location: New Delhi, India. Cat is taken care of by neighbours (no food problem). We are not responsible of any fights with other cats."
)

# Attaching the Photo
life_moment1.photo.attach(
  io: URI.open(cat_image_url),
  filename: 'cat.jpg', # Name this whatever you like
  content_type: 'image/jpg' # Ensure this matches the image type
)

# Saving the LifeMoment (Not strictly necessary since create! already saves it)
life_moment1.save!
