class AddIndexToButtonUuid < ActiveRecord::Migration[6.1]
  def change
    add_index :buttons, :uuid, unique:true
  end
end
