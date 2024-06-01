class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.float :discount

      t.timestamps
    end
  end
end
