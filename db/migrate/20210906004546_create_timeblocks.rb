class CreateTimeblocks < ActiveRecord::Migration[6.1]
  def change
    create_table :timeblocks do |t|
      t.references :developer, null: false, foreign_key: true
      t.references :reason, null: false, foreign_key: true
    end
  end
end
