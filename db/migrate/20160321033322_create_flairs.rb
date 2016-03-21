class CreateFlairs < ActiveRecord::Migration
  def change
    create_table :flairs do |t|
      t.string :name
      t.string :category
      t.text :content

      t.timestamps null: false
    end
  end
end
