module Faker
  class PhoneNumber
    class << self
      def phone_number
        Faker.numerify(Formats.rand)
      end
    end
      
    
    Formats = [
      '###-###-####',
  		'+38(###)###-####',
    	]
  end
end