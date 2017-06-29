class AddNameToSalaries < ActiveRecord::Migration[5.1]
  def change
     add_column :salaries, :name, :string
  end
end
