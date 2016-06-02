class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.text :body
      t.string :img_url
      t.string :pdf_url
      t.references :tutorial, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end