class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :picture, presence: true

  enum rule: {
    tests_by_category: 0,
    on_the_first_attempt: 1,
    tests_by_level: 2
  }
end
