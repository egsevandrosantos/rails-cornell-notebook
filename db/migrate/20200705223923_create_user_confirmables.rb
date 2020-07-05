class CreateUserConfirmables < ActiveRecord::Migration[6.0]
  def change
    create_table :user_confirmables do |t|
      t.string :confirmable_token, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_column :user_confirmables, :kind, :confirmable_kind, null: false, default: :confirm_account
    add_index :user_confirmables, :kind
    add_index :user_confirmables, :confirmable_token, unique: true
  end
end
