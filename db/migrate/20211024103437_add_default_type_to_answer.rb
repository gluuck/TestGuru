class AddDefaultTypeToAnswer < ActiveRecord::Migration[6.1]
  def change
    change_column_default :answers, :correct, 'correct'
  end
end
