class Card < ActiveRecord::Base
  before_create :add_days
  validates :original_text, :translated_text, presence: true
  validate :check_word_and_translation

  def check_word_and_translation
    errors.add("Слово и перевод должны отличаться") if original_text.mb_chars.lstrip.downcase == translated_text.mb_chars.lstrip.downcase
  end

  def add_days
    self.review_date = Date.today + 3.days
  end
  scope :need_to_review, ->{where("review_date <=?", 3.days.ago).where("original_text is not null").order("RANDOM()")}
end
