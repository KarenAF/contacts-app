# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

contacts = [2, 4, 6, 12, 14]
contacts.each do |contact|
  groupedcontact = GroupedContact.new(contact_id: contact, group_id: 1)
  groupedcontact.save
end

contacts = [1, 4, 8, 9, 11, 12, 13]
contacts.each do |contact|
  groupedcontact = GroupedContact.new(contact_id: contact, group_id: 2)
  groupedcontact.save
end

contacts = [2, 6, 11, 14]
contacts.each do |contact|
  groupedcontact = GroupedContact.new(contact_id: contact, group_id: 3)
  groupedcontact.save
end



