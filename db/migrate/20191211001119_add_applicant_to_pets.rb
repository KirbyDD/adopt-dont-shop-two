class AddApplicantToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :applicants, :string
  end
end
