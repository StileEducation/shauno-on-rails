class AddIndexToReasons < ActiveRecord::Migration[6.1]
  def change
    add_index :reasons, :reason, unique:true
  end
end
