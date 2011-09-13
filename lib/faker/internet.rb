require "unicode"
module Faker
  class Internet
    class << self
      def to_eng(arg = "")
        out = ""
        lib = {"а" => "a", "б" => "b", "в" => "v", "г" => "g", "д" => "d", "е" => "e", "ж" => "zh",
               "з" => "z", "и" => "i", "й" => "j", "к" => "k", "л" => "l", "м" => "m", "н" => "n", "о" => "o",
               "п" => "p", "р" => "r", "с" => "s", "т" => "t", "у" => "u", "ф" => "f", "х" => "h", "ц" => "c",
               "ч" => "ch", "ш" => "sh", "щ" => "sch", "ю" => "ju", "я" => "ja",
               "А" => "a", "Б" => "b", "В" => "v", "Г" => "g", "Д" => "d", "Е" => "e", "Ж" => "zh",
               "З" => "z", "И" => "i", "Й" => "j", "К" => "k", "Л" => "l", "М" => "m", "Н" => "n", "О" => "o",
               "П" => "p", "Р" => "r", "С" => "s", "Т" => "t", "У" => "u", "Ф" => "f", "Х" => "h", "Ц" => "c",
               "Ч" => "ch", "Ш" => "sh", "Щ" => "sch", "Ю" => "ju", "Я" => "ja"}
        arg.each_char do |char|
          unless lib[char].nil?
            out << lib[char]
          end
        end
        return out
      end

      def email(name = nil)
        [user_name(name), domain_name].join('@')
      end

      def free_email(name = nil)
        [user_name(name), %w(gmail.com yahoo.com hotmail.com).rand].join('@')
      end

      def user_name(name = nil)
        return name.scan(/\w+/).shuffle.join(%w(. _).rand).downcase if name

         #f_name = to_eng(Unicode::downcase(Name.first_name))


        [
            Proc.new { to_eng(Name.first_name).gsub(/\W/, '').downcase },
            Proc.new {
              [to_eng(Name.first_name), to_eng(Name.last_name)].map { |n|
                n.gsub(/\W/, '')
              }.join(%w(. _).rand).downcase }
        ].rand.call
      end

      def domain_name
        [domain_word, domain_suffix].join('.')
      end

      def domain_word
        Company.name.split(' ').first.gsub(/\W/, '').downcase
      end

      def domain_suffix
        %w(co.uk com us uk ca biz info name).rand
      end
    end

  end
end