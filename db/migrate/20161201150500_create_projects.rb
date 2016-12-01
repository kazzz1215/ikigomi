class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true, foreign_key: true
      t.text :title

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
