class CreateFavors < ActiveRecord::Migration
  def change
    create_table :favors do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :favors, [:user_id, :created_at]
  end
end
