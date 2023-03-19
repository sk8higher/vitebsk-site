namespace :mockdb do
  sqlite_path = '/usr/bin/sqlite3'
  sql_file = 'db/production.sqlite3'

  desc 'Back up the database'
  task backup: :environment do
    puts 'Backing up the database..'
    system "#{sqlite_path} #{sql_file} .dump > #{dump_path}"
    puts 'All data has been backed up!'
  end

  def dump_path
    Rails.root.join('db/backup.sql').to_path
  end
end
