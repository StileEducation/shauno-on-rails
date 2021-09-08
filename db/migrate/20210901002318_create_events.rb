class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :button, null: false, foreign_key: true
      t.timestamp :timestamp, null:false
      t.references :reason, null: false, foreign_key: true
      t.references :developer, null: false, foreign_key: true
      t.boolean :to_ignore, default: false
    end
  end
end
