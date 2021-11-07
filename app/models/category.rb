# frozen_string_literal: true

class Category < ApplicationRecord

  has_many :tests, dependent: :destroy

  default_scope {order(title: :asc)}

  has_many :tests, dependent: :destroy

  validates :title, presence: true

end
