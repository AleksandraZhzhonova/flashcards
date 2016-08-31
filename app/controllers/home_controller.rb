class HomeController < ApplicationController
  def index
  @card = Card.find(1)
  end
end
