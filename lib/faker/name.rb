module Faker
  class Name
    class << self
      def name
        Formats.rand.call.join(' ')
      end

      def first_name
        %w(Иван Петр Андрей Сергей).rand
      end

      def last_name
        %w(Иванов Петров Сидоров Попович).rand
      end

      def eng_first_name
        %w(Ivan Petr Anfrey Sergey).rand
      end

      def eng_last_name
        %w(Ivanov Petroff Sidoroff Popovich).rand
      end

      def prefix
        %w(ув. господин).rand
      end

      def suffix
        %w().rand
      end

    end

    Formats = [
        Proc.new { [prefix, first_name, last_name] },
        Proc.new { [first_name, last_name, suffix] },
        Proc.new { [first_name, last_name] },
        Proc.new { [first_name, last_name] },
        Proc.new { [first_name, last_name] },
        Proc.new { [first_name, last_name] },
        Proc.new { [first_name, last_name] },
        Proc.new { [first_name, last_name] },
        Proc.new { [first_name, last_name] },
        Proc.new { [first_name, last_name] }
    ]
  end
end