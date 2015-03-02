class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :name
      t.string :tel
      t.string :address

      t.timestamps null: false
    end
  end
end
