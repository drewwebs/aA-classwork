# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.delete_all
Album.delete_all

bands = Band.create([
    { name: "Leftover Crack"}, 
    { name: "Choking Victim"}, 
    { name: "InDK"}, 
    { name: "Morning Glory"}, 
    { name: "WiFS"}
])

albums = Album.create([
    { title: "Mediocre Generica", year: 2001, studio?: true, band_id: Band.find_by(name: "Leftover Crack").id}, 
    { title: "Fuck World Trade", year: 2004, studio?: true, band_id: Band.find_by(name: "Leftover Crack").id}, 
    { title: "Rock the 40 Oz", year: 2000, studio?: true, band_id: Band.find_by(name: "Leftover Crack").id}, 
    { title: "No Gods, No Managers", year: 1999, studio?: true, band_id: Band.find_by(name: "Choking Victim").id}, 
    { title: "Squatta's Paradise", year: 1996, studio?: true, band_id: Band.find_by(name: "Choking Victim").id}, 
    { title: "Kill Whitey!", year: 1999, studio?: true, band_id: Band.find_by(name: "Choking Victim").id}
])