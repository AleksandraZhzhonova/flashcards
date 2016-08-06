class CardsController < ApplicationController
  def new
  end
  def index
    @cards = Card.all 
  end 

end
