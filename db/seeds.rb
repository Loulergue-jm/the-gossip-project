require 'faker'
require 'table_print'

City.destroy_all
Gossip.destroy_all
Tag.destroy_all
TagGossip.destroy_all
PrivateMessage.destroy_all
MultiPm.destroy_all
User.destroy_all



10.times do
    City.create(
         name: Faker::Address.city,
         zip_code: Faker::Address.zip_code,
    )

    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        description: Faker::Lorem.sentence(word_count: 20),
        email: Faker::Internet.email,
        age: rand(18..99),
        city: City.order('RANDOM()').first
    )
end

20.times do
    Gossip.create(
        title: Faker::Lorem.sentence(word_count: 3),
        content: Faker::Lorem.sentence(word_count: 20),
        user: User.order('RANDOM()').first
    )
end

10.times do |i|
    Tag.create(
        title: Faker::Lorem.sentence(word_count: 3)
    )

    pm = PrivateMessage.create(
        sender: User.order('RANDOM()').first,
        content:  Faker::Lorem.sentence(word_count: 3)
    )

    MultiPm.create(
        recipient: User.order('RANDOM()').last,
        private_message: pm
    )

end

Gossip.all.each do |elem|
    TagGossip.create(
        gossip: elem,
        tag: Tag.order('RANDOM()').last,
    )
end
=begin
tp City.all, :id, :name, :zip_code
gets.chomp 
tp User.all, :id, :last_name, :email, :age, :city
gets.chomp
=end