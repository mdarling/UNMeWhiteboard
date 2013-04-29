# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Room.delete_all
Patient.delete_all
Comment.delete_all
Room.create(room_number: "LD1", position: 1)
Room.create(room_number: "LD2", position: 2)
Room.create(room_number: "LD3", position: 3)
Room.create(room_number: "LD4", position: 4)
Room.create(room_number: "LD5", position: 5)
Room.create(room_number: "LD6", position: 6)
Room.create(room_number: "LD7", position: 7)
Room.create(room_number: "LD8", position: 8)
Room.create(room_number: "LD9", position: 9)
Room.create(room_number: "LD10", position: 10)
Room.create(room_number: "LD11", position: 11)
Room.create(room_number: "LD12", position: 12)
Room.create(room_number: "OR13", position: 13)
Room.create(room_number: "OR14", position: 14)
Room.create(room_number: "OR15", position: 15)
Room.create(room_number: "RR1", position: 16)
Room.create(room_number: "RR2", position: 17)
Room.create(room_number: "RR3", position: 18)
Room.create(room_number: "RR4", position: 19)
