class HomeController < ApplicationController
  def index
    @card = Card.need_to_review.first
  end

  def check
    result = CheckCard.call(params: card_params)
     if result.success?
       redirect_to root_url, notice: "Правильный перевод"
     else
       redirect_to root_path, notice: "Неправильный перевод, правильно так => #{result.translation}"
     end
   end
  private def card_params
    params.permit(:card_id, :translated_text)
  end
end
