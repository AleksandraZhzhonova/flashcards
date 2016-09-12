class CheckCard
  include Interactor

  def call
    card = Card.find(context.params[:card_id])
    context.translation = card.translated_text
    if card.translated_text == context.params[:translated_text]
      context.card = card
    else
      context.fail!
    end 
  
  end
end
      
