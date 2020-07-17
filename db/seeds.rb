require 'faker'

(1..50000).each do 
    User.create!(
        name: Faker::Name.name ,
        wallet: rand(200..20000)
    )
end