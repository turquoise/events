# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
e1 = Event.create(name: "BugSmash", description: "Join us for an evening of bug fixing.", location: "Denver, CO", price: 0.00)
e2 = Event.create(name: "Hackathon", description: "Got a killer app, then join us for a coding session.", location: "Denver", price: 15.00)
e3 = Event.create(name: "Kata Camp", description: "lPractice coding kata style", location: "Colorado", price: 75.00)
e4 = Event.create(name: "Code and Coffee", description: "Enjoy your coffee with some coding", location: "Portland, OR", price: 0.00)