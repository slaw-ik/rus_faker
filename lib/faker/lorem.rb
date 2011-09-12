module Faker
  # Based on Perl's Text::Lorem
  class Lorem
    Words = %w(Принцип восприятия непредвзято создает паллиативный интеллект, условно. Концепция ментально оспособляет закон внешнего мира. Сомнение раскладывает на элементы неоднозначный структурализм. Смысл жизни профанирует принцип восприятия, отрицая очевидное. Жизнь философски ассоциирует напряженный постмодернизм. Объект деятельности означает конфликт. Согласно предыдущему, конфликт, в рамках сегодняшних воззрений, ясен не всем)

    def self.words(num = 3)
      Words.shuffle[0, num]
    end

    def self.sentence(word_count = 4)
      words(word_count + rand(6)).join(' ').capitalize + '.'
    end

    def self.sentences(sentence_count = 3)
      returning([]) do |sentences|
        1.upto(sentence_count) do
          sentences << sentence
        end
      end
    end

    def self.paragraph(sentence_count = 3)
      sentences(sentence_count + rand(3)).join(' ')
    end

    def self.paragraphs(paragraph_count = 3)
      returning([]) do |paragraphs|
        1.upto(paragraph_count) do
          paragraphs << paragraph
        end
      end
    end
  end
end