class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_answers, on: :create

  scope :find_true_answer, -> {where(correct: true)}

  private

  def validate_count_answers
    errors.add(:base, 'Maximum answers must be 4') if question.answers.count > 3
  end
end
