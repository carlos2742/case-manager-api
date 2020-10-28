class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.string :name,              null: false
      t.string :number,            null: false, unique: true
      t.integer :practice_area,    null: false, default: 0
      t.integer :stage,            null: false, default: 0
      t.string :description
      t.integer :billing_method,   null: false, default: 0
      t.references :client
      t.references :user
      t.timestamps
    end
  end
end
