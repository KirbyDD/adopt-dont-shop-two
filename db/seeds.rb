# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
# Shelters
adams_county = Shelter.create(name: "Adams County", address: "1234 Colorado blvd.", city: "Denver", state: "Colorado", zip: 80230)
ddfl = Shelter.create(name: "Denver Dumb Friends League", address: "4593 Qubec st.", city: "Denver", state: "Colorado", zip: 80231)
arvada_shelters = Shelter.create(name: "Arvada Pet Hospital", address: "2325 Lamar st.", city: "Arvada", state: "Colorado", zip: 80003)
#
# Pets
twitch = adams_county.pets.create(image: "https://farm4.static.flickr.com/3564/3416381629_b65196e89a_b.jpg", name: "Twitch", approximate_age: 5, sex: "male", description: "wiener dog")
jona = adams_county.pets.create(image: "https://www.allthingsdogs.com/wp-content/uploads/2018/08/How-to-Care-for-a-Black-German-Shepherd.jpg", name: "Jona", approximate_age: 9, sex: "female", description: "black shepard")
ozzy = adams_county.pets.create(image: "https://www.dogbreedinfo.com/images32/GermanShepherdAdultDogLayInGrassOutside.jpg", name: "Ozzy", approximate_age: 3, sex: "male", description: "German Shepard")
ciri = ddfl.pets.create(image: "http://www.silverbulletlabs.com/sitebuilder/images/Remington2-469x473.jpg", name: "Ciri", approximate_age: 2, sex: "female", description: "white lab")
freja = ddfl.pets.create(image: "https://vetstreet.brightspotcdn.com/dims4/default/fcf6c92/2147483647/thumbnail/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F87%2F5a%2Ffb48bee3434bb5463d7ffa923e3f%2Fgreat-pyrenees-ap-09zyfm-645.jpg", name: "Freja", approximate_age: 6, sex: "female", description: "great pyrenees")
maggie = arvada_shelters.pets.create(image: "https://render.fineartamerica.com/images/rendered/default/poster/8/10/break/images/artworkimages/medium/1/awaiting-spring-black-lab-puppy-black-dog-art-judy-burrows.jpg", name: "Maggie", approximate_age: 12, sex: "female", description: "Black Lab")
#
#Applications
sebastian = Application.create!(name: "Sebastian Sloan", address: "123 Fake st.", city: "Denver", state: "Colorado", zip: 80230, phone_number: 1234567890, why_would_you_make_a_good_pet_owner: "Because why not")
demarcus = Application.create!(name: "DeMarcus Kirby", address: "123 Fake st.", city: "Denver", state: "Colorado", zip: 80230, phone_number: 1234567890, why_would_you_make_a_good_pet_owner: "Because why not")
ray = Application.create!(name: "Ray Nugyen", address: "123 Fake st.", city: "Denver", state: "Colorado", zip: 80230, phone_number: 1234567890, why_would_you_make_a_good_pet_owner: "Because why not")
