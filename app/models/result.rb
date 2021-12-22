# frozen_string_literal: true

class Result < ApplicationRecord

  REFERENCE_POINT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def completed?
    current_question.nil?
  end

  def results_percent
    correct_questions.to_f * 100 / test.questions.size
  end

  def test_full_completed?
    results_percent >= REFERENCE_POINT
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.find_true_answer
  end

  def set_current_question
    self.current_question = next_question
  end

  def next_question
    if new_record?
      test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
