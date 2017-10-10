class RoundsController < ApplicationController
  def create
    @round = Round.create(deck_id: params[:deck_id])
    redirect_to [@round, @round.deck.cards.first]
  end
end