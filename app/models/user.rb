# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests , through: :results, dependent: :destroy
  has_many :author_tests, foreign_key: :author_id, class_name: 'Test', dependent: :destroy

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },uniqueness: true
  validates :password,  length: { minimum: 6 }

  def find_by_level(level)
    tests.where(level: level)
  end
end
