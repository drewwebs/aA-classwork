# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all
# user1 = user.create!([username: 'Kendrick'])
users = User.create([
    {username: 'Kendrick'}, 
    {username: 'Earl Sweatshirt'}, 
    {username: 'Notorious B.I.G.'}, 
    {username: 'Tyler the Creator'}, 
    {username: 'Kanye West'}
])

artworks = Artwork.create([
    {title: "GKMC", image_url: "www.gkmc.com", artist_id: users[0].id },
    {title: "Late Registration", image_url: "www.kw.com", artist_id: users[4].id },
    {title: "Doris", image_url: "www.sweatshirt.com", artist_id: users[1].id },
    {title: "808s and Heartbreak", image_url: "www.kw.com", artist_id: users[4].id },
    {title: "Ready to Die", image_url: "www.biggie.com", artist_id: users[2].id }
])

artworks_shares = ArtworkShare.create([
    {viewer_id: users[0].id, artwork_id: artworks[1].id },
    {viewer_id: users[0].id, artwork_id: artworks[3].id },
    {viewer_id: users[4].id, artwork_id: artworks[3].id },
    {viewer_id: users[4].id, artwork_id: artworks[1].id },
    {viewer_id: users[0].id, artwork_id: artworks[4].id },
    {viewer_id: users[3].id, artwork_id: artworks[2].id }
])


comments = Comment.create([
    {user_id: users[0].id, artwork_id: artworks[4].id, body: "RIP MY MAN" },
    {user_id: users[1].id, artwork_id: artworks[4].id, body: "RIP MY MAN" },
    {user_id: users[3].id, artwork_id: artworks[4].id, body: "RIP MY MAN" },
    {user_id: users[4].id, artwork_id: artworks[4].id, body: "RIP MY MAN" },
    {user_id: users[2].id, artwork_id: artworks[4].id, body: "THIS IS A MASTERPIECE" }
])
