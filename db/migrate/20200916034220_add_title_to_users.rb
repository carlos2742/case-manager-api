class AddTitleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :title, :integer, default: 0
  end
end
