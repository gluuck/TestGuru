# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :find_true_answer, -> {where(correct: true)}

  validates :body, presence: true
  validate :validate_count_answers

  private

  def validate_count_answers
    errors.add(:base, 'Maximum answers must be 4') if question.answers.count > 4
  end
end
