class CreateReview < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :rating
      t.string :content
      t.string :optional_picture

      t.timestamp
    end
  end
end
