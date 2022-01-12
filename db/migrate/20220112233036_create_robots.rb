class CreateRobots < ActiveRecord::Migration[6.1]
  def change
    create_table :robots do |t|
      t.integer :x_location
      t.integer :y_location
      t.string :f_direction

      t.timestamps
    end
  end
end
