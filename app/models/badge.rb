class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :picture, presence: true

  enum rule: {
    tests_by_category: 'tests_by_category',
    on_the_first_attempt: 'on_the_first_attempt',
    tests_by_level: 'tests_by_level'
  }
end
