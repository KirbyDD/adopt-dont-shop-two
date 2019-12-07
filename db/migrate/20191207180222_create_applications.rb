class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :phone_number
      t.text :why_would_you_make_a_good_pet_owner
			t.timestamps
    end
  end
end
