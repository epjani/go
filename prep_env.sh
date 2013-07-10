bundle exec rake db:drop_db
bundle exec rake db:migrate
bundle exec rake populate:admin_nurse
bundle exec rake populate:reservation_times
bundle exec rake populate:examinations