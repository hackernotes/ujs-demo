class DefineSchema < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :position
      t.timestamps
    end

    add_index :notes, :position
  end
end
