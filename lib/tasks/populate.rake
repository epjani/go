namespace :populate do
  desc "Add admin nurses"
  task :admin_nurse => :environment do
    Nurse.create_admin_nurse
  end
end