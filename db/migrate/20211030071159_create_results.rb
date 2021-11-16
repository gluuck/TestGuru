# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :current_question  # foreign_key: true  ругается изза ключа
                                      # SQLite не видит таблицу main.current_question
                                      # SQLite3::SQLException: no such table: main.current_questions
      t.integer :correct_question, null: false, default: 0

      t.timestamps
    end
  end
end
