# frozen_string_literal: true

class Result < ApplicationRecord

  REFERENCE_POINT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_find_first_question, on: :create

  after_update :next_question, if: :not_nil?

  def completed?
    current_question.nil?
  end

  def not_nil?
    !current_question.nil?
  end

  def results_percent
    correct_question * 100 / test.questions.size
  end

  def test_full_completed?
    results_percent >= REFERENCE_POINT
  end

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)
    self.current_question = next_question
    save!
  end

  private

  def before_validation_find_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.find_true_answer
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
