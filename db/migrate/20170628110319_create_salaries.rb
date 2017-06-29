class CreateSalaries < ActiveRecord::Migration[5.1]
  def change
    create_table :salaries do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
