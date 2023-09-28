class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.bigint :esa_id, null: false
      t.string :name, null: false
      t.string :screen_name, null: false
      t.string :access_token

      t.timestamps
    end
  end
end
