class AddLimitDateToTodolists < ActiveRecord::Migration[5.2]
  def change
    add_column :todolists, :limit_date, :date
  end
end
