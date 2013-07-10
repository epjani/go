call bundle exec rake db:drop_db
call bundle exec rake db:migrate
call bundle exec rake populate:admin_nurse
call bundle exec rake populate:reservation_times
call bundle exec rake populate:examinations