class CreateButtonDevelopers < ActiveRecord::Migration[6.1]
  def change
    create_table :button_developers do |t|
      t.references :button, null: false, foreign_key: true
      t.references :developer, null: false, foreign_key: true
      t.boolean :current, default: true
    end
  end
end
