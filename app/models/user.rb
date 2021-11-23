# frozen_string_literal: true

class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :results, dependent: :destroy
  has_many :tests , through: :results, dependent: :destroy
  has_many :author_tests, foreign_key: :author_id, class_name: 'Test', dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },uniqueness: true 

  def find_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
