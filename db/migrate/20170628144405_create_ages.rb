class CreateAges < ActiveRecord::Migration[5.1]
  def change
    create_table :ages do |t|
      t.integer :age
      t.timestamps
    end
  end
end
