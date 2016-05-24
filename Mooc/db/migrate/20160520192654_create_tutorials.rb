class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
