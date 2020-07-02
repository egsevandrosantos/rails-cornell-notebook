class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name, limit: 100, null: false
      t.string :email, limit: 50, null: false
      t.string :username, limit: 20, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
    add_column :users, :status, :status, null: false, default: :inactive
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :status
  end
end
