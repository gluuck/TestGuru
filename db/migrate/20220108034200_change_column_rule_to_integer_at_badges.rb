class ChangeColumnRuleToIntegerAtBadges < ActiveRecord::Migration[6.1]
  def change
    change_column :badges, :rule, 'integer USING CAST(rule AS integer)'
  end
end
