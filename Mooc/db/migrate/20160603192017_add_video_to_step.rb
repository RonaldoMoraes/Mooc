class AddVideoToStep < ActiveRecord::Migration
  def change
    add_column :steps, :video_url, :string
  end
end
