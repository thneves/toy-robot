class AddLocationToRobots < ActiveRecord::Migration[6.1]
  def change
    add_column :robots, :x_location, :integer
    add_column :robots, :y_location, :integer
    add_column :robots, :f_orientation, :string
  end
end
