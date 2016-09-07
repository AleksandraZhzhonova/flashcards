class CheckCard
  include Interactor

  def call
    card = Card.find(context.params[:card_id])
    if card.translated_text == contex.params[:translated_text]
      context.card = card
    else
      context.fail!
    end 
  end
end
      
