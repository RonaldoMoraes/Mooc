class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end


#def change
#  create_table :categorizations do |t|
#    t.integer :category_id
#    t.integer :product_id
#
#    t.timestamps
#  end
#end