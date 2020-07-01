class CreateStatusType < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE status AS ENUM ('inactive', 'active');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE status
    SQL
  end
end
