class CreateButtons < ActiveRecord::Migration[6.1]
  def change
    create_table :buttons do |t|
      t.string :uuid
      t.boolean :is_active, default: true
    end
  end
end
