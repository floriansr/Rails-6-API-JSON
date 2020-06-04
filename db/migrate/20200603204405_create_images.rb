class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer :user_id, null: false
      t.binary :stream, null: false
      t.string :extension, null: false
      t.string :description

      t.timestamps
    end
  end
end
