class CreateConfirmableKindType < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE confirmable_kind AS ENUM ('confirm_account', 'reset_password');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE confirmable_kind;
    SQL
  end
end
