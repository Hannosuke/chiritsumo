class AddUniqueIndexToUsersEsaId < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :esa_id, unique: true
  end
end
