class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
    @card.each do |card|

    end
  end
end