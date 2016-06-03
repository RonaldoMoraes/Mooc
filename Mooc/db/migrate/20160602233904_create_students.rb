class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tutorial, index: true, foreign_key: true
    end
  end
end
