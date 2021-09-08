class CreateTimeblockMappings < ActiveRecord::Migration[6.1]
  def change
    create_table :timeblock_mappings do |t|
      t.references :timeblock, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
