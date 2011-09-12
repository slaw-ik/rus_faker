module Faker
  class Address
    class << self
      def zip_code
        Faker.numerify(['#####', '#####-####'].rand)
      end
      
      def us_state
        [ " АР Крым", " Винницкая область", " Волынская область", " Днепропетровская область", " Донецкая область", " Житомирская область", " Закарпатская область", " Запорожская область", " Ивано-Франковская область"].rand
      end
      
      def us_state_abbr
        %w(AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY AE AA AP).rand
      end
      
      def city_prefix
        %w(Сев. Южн. Бльш. Мал. ).rand
      end
      
      def city_suffix
        %w(town ton land ville berg burgh borough bury view port mouth stad furt chester mouth fort haven side shire).rand
      end
      
      def city
        [
          '%s %s' % [city_prefix, Name.first_name],
          '%s %s' % [city_prefix, Name.first_name]
        ].rand
      end
      
      def street_suffix
        %w(улица набережная проспект).rand
      end
    
      def street_name
        [ 
          Proc.new { [street_suffix, Name.last_name].join(' ') },
          Proc.new { [street_suffix, Name.first_name].join(' ') }
        ].rand.call
      end
      
      def street_address(include_secondary = false)
        Faker.numerify([
          '##### %s' % street_name,
          '#### %s' % street_name,
          '### %s' % street_name
        ].rand + (include_secondary ? ' ' + secondary_address : ''))
      end
      
      def secondary_address
        Faker.numerify([
          'Apt. ###',
          'Suite ###'
        ].rand)
      end
      
      # UK Variants
      def uk_county
        ['Avon', 'Bedfordshire', 'Berkshire', 'Borders', 'Buckinghamshire', 'Cambridgeshire', 'Central', 'Cheshire', 'Cleveland', 'Clwyd', 'Cornwall', 'County Antrim', 'County Armagh', 'County Down', 'County Fermanagh', 'County Londonderry', 'County Tyrone', 'Cumbria', 'Derbyshire', 'Devon', 'Dorset', 'Dumfries and Galloway', 'Durham', 'Dyfed', 'East Sussex', 'Essex', 'Fife', 'Gloucestershire', 'Grampian', 'Greater Manchester', 'Gwent', 'Gwynedd County', 'Hampshire', 'Herefordshire', 'Hertfordshire', 'Highlands and Islands', 'Humberside', 'Isle of Wight', 'Kent', 'Lancashire', 'Leicestershire', 'Lincolnshire', 'Lothian', 'Merseyside', 'Mid Glamorgan', 'Norfolk', 'North Yorkshire', 'Northamptonshire', 'Northumberland', 'Nottinghamshire', 'Oxfordshire', 'Powys', 'Rutland', 'Shropshire', 'Somerset', 'South Glamorgan', 'South Yorkshire', 'Staffordshire', 'Strathclyde', 'Suffolk', 'Surrey', 'Tayside', 'Tyne and Wear', 'Warwickshire', 'West Glamorgan', 'West Midlands', 'West Sussex', 'West Yorkshire', 'Wiltshire', 'Worcestershire'].rand
      end
      
      def uk_country
        ['England', 'Scotland', 'Wales', 'Northern Ireland'].rand
      end
      
      def uk_postcode
        Faker.bothify([
          '??# #??',
          '??## #??'
        ].rand).upcase
      end      
    end
  end
end