class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|

      t.string :category
      t.string :identifier

      t.timestamps null: false
    end
  end
end
