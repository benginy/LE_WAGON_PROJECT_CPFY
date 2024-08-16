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

user1 = User.create!(email: "user1@gmail.com", username: "user1", password: "password")
puts "User created: #{user1.persisted?}"

life_moment1 = LifeMoment.new(
  user: user1,
  title: "LIVE THE BEAUTIFUL CAT LIFE. BECOME A CAT!",
  price_per_night: 2200,
  description: "Location: New Delhi, India. Cat is taken care of by neighbours (no food problem). We are not responsible of any fights with other cats."
)

if life_moment1.valid?
  life_moment1.save!
  puts "LifeMoment created: #{life_moment1.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment1.errors.full_messages.join(', ')}"
end

life_moment1.photo.attach(
  io: URI.open(cloudinary_image_1),
  filename: 'cat.jpg',
  content_type: 'image/jpg'
)
life_moment1.save!

#####

# Life MOMENT 2 : 50 year old wall street executive living in NY
cloudinary_image_2 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723545473/development/ai0j0dwoormgz2tsvgknl2nuibjg.jpg"

life_moment2 = LifeMoment.new(
  user: user1,
  title: "50 year old wall street executive living in NY",
  price_per_night: 15000,
  description: "You're not that guy pal. But you can be this guy."
)

if life_moment2.valid?
  life_moment2.save!
  puts "LifeMoment created: #{life_moment2.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment2.errors.full_messages.join(', ')}"
end

life_moment2.photo.attach(
  io: URI.open(cloudinary_image_2),
  filename: 'man.jpg',
  content_type: 'image/jpg'
)
life_moment2.save!


###


# Life MOMENT 3 : Dog

user2 = User.create!(email: "user2@gmail.com", username: "user2", password: "password")

cloudinary_image_3 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723547067/development/vd3kmxcfygn9i9e5c8o214va19cs.jpg"

life_moment3 = LifeMoment.new(
  user: user2,
  title: "Spend 3 days in the life of a dog living in a luxureous Miami mansion",
  price_per_night: 1000,
  description: "Miami luxureous mansion, well-treated dog, nice family."
)

# Validate and save LifeMoment 4
if life_moment3.valid?
  life_moment3.save!
  puts "LifeMoment created: #{life_moment3.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment3.errors.full_messages.join(', ')}"
end

# Attaching the Photo to LifeMoment 4
life_moment3.photo.attach(
  io: URI.open(cloudinary_image_3),
  filename: 'dog.jpg',
  content_type: 'image/jpg'
)
life_moment3.save!





# Life MOMENT 4 : Yacht

cloudinary_image_4 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723644702/development/44npqkffy8l49fqcf4ao85znym68.jpg"

life_moment4 = LifeMoment.new(
  user: user2,
  title: "Become the owner of a beautiful yacht",
  price_per_night: 57000,
  description: "Live the life of a successful entrepreneur owning a yacht. Friends and food included."
)

# Validate and save LifeMoment 4
if life_moment4.valid?
  life_moment4.save!
  puts "LifeMoment created: #{life_moment4.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment4.errors.full_messages.join(', ')}"
end

# Attaching the Photo to LifeMoment 4
life_moment4.photo.attach(
  io: URI.open(cloudinary_image_4),
  filename: 'dog.jpg',
  content_type: 'image/jpg'
)
life_moment4.save!





# Life MOMENT 5 : Singap

user3 = User.create!(email: "user3@gmail.com", username: "user3", password: "password")

cloudinary_image_5 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723644758/development/nnyzswg9wnxrig7k3nl9gvhggs0a.jpg"

life_moment5 = LifeMoment.new(
  user: user3,
  title: "Random person from Singapore",
  price_per_night: 2000,
  description: "Random person from Singapore. During your stay, please do not chew any gum. Thanks. - The Host"
)

# Validate and save LifeMoment 2
if life_moment5.valid?
  life_moment5.save!
  puts "LifeMoment created: #{life_moment5.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment5.errors.full_messages.join(', ')}"
end

# Attaching the Photo to LifeMoment 2
life_moment5.photo.attach(
  io: URI.open(cloudinary_image_5),
  filename: 'singap.jpg',
  content_type: 'image/jpg'
)
life_moment5.save!


# Life MOMENT 6 : London

cloudinary_image_6 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723644975/development/hi2ssafwd2l9reem0c7zstbckytg.webp"

life_moment6 = LifeMoment.new(
  user: user3,
  title: "Cool young person from London",
  price_per_night: 4100,
  description: "Experience life as a cool person with many friends! Life in easy mode, my friend."
)

# Validate and save LifeMoment 2
if life_moment6.valid?
  life_moment6.save!
  puts "LifeMoment created: #{life_moment6.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment6.errors.full_messages.join(', ')}"
end

# Attaching the Photo to LifeMoment 2
life_moment6.photo.attach(
  io: URI.open(cloudinary_image_6),
  filename: 'dog.jpg',
  content_type: 'image/jpg'
)
life_moment6.save!


# Life MOMENT 7 : Miami

user4 = User.create!(email: "user4@gmail.com", username: "user4", password: "password")

cloudinary_image_7 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723645037/development/k2bu0i8qpk0o0yg9uhwyw03xclra.jpg"

life_moment7 = LifeMoment.new(
  user: user4,
  title: "A guy from Miami",
  price_per_night: 5000,
  description: "Be this guy from Miami. Perfect host condition if user wants to party."
)

if life_moment7.valid?
  life_moment7.save!
  puts "LifeMoment created: #{life_moment7.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment7.errors.full_messages.join(', ')}"
end

life_moment7.photo.attach(
  io: URI.open(cloudinary_image_7),
  filename: 'miami.jpg',
  content_type: 'image/jpg'
)
life_moment7.save!



# Life MOMENT 8 : Wagon


cloudinary_image_8 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723645341/development/wam06v8gdp6c5z1swh2z2e4z23n3.jpg"

life_moment8 = LifeMoment.new(
  user: user4,
  title: "BECOME A TA AT THE WAGON AND HELP PEOPLE BECOME ROR DEVELOPERS",
  price_per_night: 12000,
  description: "Very cool."
)

if life_moment8.valid?
  life_moment8.save!
  puts "LifeMoment created: #{life_moment8.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment8.errors.full_messages.join(', ')}"
end

life_moment8.photo.attach(
  io: URI.open(cloudinary_image_8),
  filename: 'wagon.jpg',
  content_type: 'image/jpg'
)
life_moment8.save!




# Life MOMENT 9 : Eastern city

user5 = User.create!(email: "user5@gmail.com", username: "user5", password: "password")


cloudinary_image_9 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723644370/development/yu4gpvu3txrozci5v208ex91p6p9.jpg"

life_moment9 = LifeMoment.new(
  user: user5,
  title: "accomodation included. Espace from your exciting life to a boring one! Experience true boredom",
  price_per_night: 235,
  description: "Very cool."
)

if life_moment9.valid?
  life_moment9.save!
  puts "LifeMoment created: #{life_moment9.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment9.errors.full_messages.join(', ')}"
end

life_moment9.photo.attach(
  io: URI.open(cloudinary_image_9),
  filename: 'east.jpg',
  content_type: 'image/jpg'
)
life_moment9.save!




# Life MOMENT 10 : Hobbit


cloudinary_image_10 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723644249/development/ht9kdpt8y88ui10rmlmisr4s59dd.jpg"

life_moment10 = LifeMoment.new(
  user: user5,
  title: "Luxury HOBBIT LIFE (party season)",
  price_per_night: 17000,
  description: "FLASH SALE -50% DO NOT MISS THIS OPPORTUNITY. Become a hobbit from the shire. Enjoy the yearly fireworks party with celeb magicians and other guests."
)

if life_moment10.valid?
  life_moment10.save!
  puts "LifeMoment created: #{life_moment10.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment10.errors.full_messages.join(', ')}"
end

life_moment10.photo.attach(
  io: URI.open(cloudinary_image_10),
  filename: 'hobbit.jpg',
  content_type: 'image/jpg'
)
life_moment10.save!



# Life MOMENT 11 : Edimburgh

user6 = User.create!(email: "user6@gmail.com", username: "user6", password: "password")

cloudinary_image_11 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723644845/development/xmugepxx3m6xy59vcqapb38v1min.jpg"

life_moment11 = LifeMoment.new(
  user: user6,
  title: "Random person from Edinburgh",
  price_per_night: 1700,
  description: "very random."
)

if life_moment11.valid?
  life_moment11.save!
  puts "LifeMoment created: #{life_moment11.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment11.errors.full_messages.join(', ')}"
end

life_moment11.photo.attach(
  io: URI.open(cloudinary_image_11),
  filename: 'edimbourgh.jpg',
  content_type: 'image/jpg'
)
life_moment11.save!



# Life MOMENT 12 : Office

cloudinary_image_12 = "https://res.cloudinary.com/dnrfsvgnj/image/upload/v1723647460/development/jupbzhgol4oqtt71875hj0qzj9n6.jpg"

life_moment12 = LifeMoment.new(
  user: user6,
  title: "Boring day at the office!",
  price_per_night: 1200,
  description: "Spend time working at an open office. Random job! A lot of boring work guaranteed or get your money back!"
)

if life_moment12.valid?
  life_moment12.save!
  puts "LifeMoment created: #{life_moment12.persisted?}"
else
  puts "LifeMoment invalid: #{life_moment12.errors.full_messages.join(', ')}"
end

life_moment12.photo.attach(
  io: URI.open(cloudinary_image_12),
  filename: 'edimbourgh.jpg',
  content_type: 'image/jpg'
)
life_moment12.save!
