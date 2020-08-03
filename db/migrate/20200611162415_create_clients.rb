class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :email,              null: false, default: "", unique: true
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :address
      t.string :phone_number,       null: false, default: "", unique: true
      t.string :ssn,                unique: true
      t.string :arn,                unique: true
      t.string :emergency_contact,  null: false, default: ""
      t.timestamps
    end
  end
end
