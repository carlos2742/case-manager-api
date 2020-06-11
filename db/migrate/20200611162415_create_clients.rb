class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.date :birthday
      t.string :address
      t.string :phone_number
      t.string :ssn
      t.string :arn
      t.string :emergency_contact
      t.timestamps
    end
  end
end
