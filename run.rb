require 'lib/faker'

require "unicode"
$KCODE = "utf-8"

puts person_name            = Faker::Name.name
puts person_name            = Unicode::upcase("иван")
puts person_name            = Faker::Internet.to_eng("Иванов")
puts person_email           = Faker::Internet.email
puts person_company         = Faker::Company.name
puts person_company_slogan  = Faker::Company.bs
puts person_phone           = Faker::PhoneNumber.phone_number
puts person_address         = Faker::Address.street_address
puts person_city            = Faker::Address.city
puts person_state           = Faker::Address.us_state
puts person_zip             = Faker::Address.zip_code
puts person_zip             = Faker::Lorem.paragraph