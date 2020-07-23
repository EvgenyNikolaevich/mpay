# Подключение `uuid-ossp` необходимо для того, чтобы мы
# могли создавать таблицы где первичным коючем выступает
# uuid вместо integer'a

Sequel.migration do
  up do
    run <<-SQL
      CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
    SQL
  end

  down do
    run <<-SQL
      DROP EXTENSION IF EXISTS "uuid-ossp";
    SQL
  end
end
