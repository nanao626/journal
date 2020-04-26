class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|

      t.string :title
      t.string :content
      t.integer :user_id
      t.timestamps
    end
  end
end
