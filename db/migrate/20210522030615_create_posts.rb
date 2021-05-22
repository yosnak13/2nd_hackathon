class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user
      t.references :station
      t.text :comment
      t.integer :congestion_level
      t.date :date
      t.string :day_of_week
      t.integer :time
      t.integer :direction
      t.string :train_type

      t.timestamps
    end
  end
end
