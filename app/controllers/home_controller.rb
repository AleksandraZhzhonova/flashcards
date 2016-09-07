class HomeController < ApplicationController
  def index
    @card = Card.need_to_review.first
  end

 def check
    card = Card.find(params[:card_id])
    if card.translated_text == params[:translated_text]
    render text: "Верный перевод"
    else
    render text: "Неверный перевод " + "нужно перевести так: " + card.translated_text
    end
  end
end
