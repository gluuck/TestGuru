class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :correct
      t.string :non_correct
      
      t.timestamps
    end
  end
end
