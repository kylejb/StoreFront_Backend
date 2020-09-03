class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :img_url
      t.float :cost
      t.text :description

      t.timestamps
    end
  end
end
