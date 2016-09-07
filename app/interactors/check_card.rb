class CheckCard
  include Interactor

  def call
    card = Card.find(context.params)
    if card.translated_text == params[:translated_text]
      context.card = card
    else
      context.fail!
    end 
  end
end
      
