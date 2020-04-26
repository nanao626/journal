class CreateTodolists < ActiveRecord::Migration[5.2]
  def change
    create_table :todolists do |t|

      t.string :title
      t.string :content
      t.integer :user_id
      t.timestamps
    end
  end
end
