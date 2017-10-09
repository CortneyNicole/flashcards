Rails.application.routes.draw do
    root 'decks#index'

    resources 'decks' do
      resources 'cards' do
        resources 'rounds'
      end
    end
end
