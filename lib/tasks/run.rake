desc "Drops the holes table"
task :reset_holes => :environment do
  ActiveRecord::Migration.drop_table 'Holes'
end
