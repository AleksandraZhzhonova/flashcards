class HomeController < ApplicationController
  def index
    @card = Card.need_to_review.first
  end

  def check
    result = CheckСard.call(params: card_params)
     if result.success?
       redirect_to home_path, notice: "Правильный перевод"
     else
       redirect_to home_path, notice: "Неправильный перевод" 
     end
   end

  private def card_params
     params.require(:card).permit(:card_id, :translated_text)
  end
end
