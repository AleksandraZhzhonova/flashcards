class Card < ActiveRecord::Base
  before_create :add_days
  validates :original_text, :translated_text, presence: true
  validate :check_word_and_translation

  def check_word_and_translation
    errors.add(:original_text, "Слово и перевод должны отличаться") if original_text.mb_chars.lstrip.downcase == translated_text.mb_chars.lstrip.downcase
  end

  def add_days
    self.review_date = Date.today + 3.days
  end
end
