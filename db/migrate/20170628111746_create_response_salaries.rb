class CreateResponseSalaries < ActiveRecord::Migration[5.1]
  def change
    create_table :response_salaries do |t|
      t.integer :response_id
      t.integer :salary_id
      t.timestamps
    end
  end
end
