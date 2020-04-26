class AddStatusToTodolists < ActiveRecord::Migration[5.2]
  def change
    add_column :todolists, :status, :integer
  end
end
