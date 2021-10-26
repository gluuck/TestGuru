class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :autrhor_id, null: false
      
      t.timestamps
    end
  end
end
