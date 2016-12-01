class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :name, unique: true

      t.timestamps
    end
    add_index :routes, :name
  end
end
