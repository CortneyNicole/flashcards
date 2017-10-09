# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def load_flashcards(filename, deck)
  questions = []
  answers = []
  File.open(filename) do |file|
    file.each_line do |line|
      if line.include?("?")
        questions << line.chomp
      else
        answers << line.chomp unless line == "\n"
      end
    end
  end
  @cards_array = questions.zip(answers)
  @cards_array.each do |card_question_answer|
    card = Card.new
    card.card_question = card_question_answer[0]
    card.card_answer = card_question_answer[1]
    card.deck_id = deck.id
    card.save
  end
end


nighthawk_deck = Deck.create(name: "nigthawk", creator_id: User.first.id)
otter_deck = Deck.create(name: "otter", creator_id: User.first.id)
raccoon_deck = Deck.create(name: "raccoon", creator_id: User.first.id)

load_flashcards("app/cards/nighthawk_deck.txt", nighthawk_deck)
load_flashcards("app/cards/otter_deck.txt", otter_deck)
load_flashcards("app/cards/raccoon_deck.txt", raccoon_deck)