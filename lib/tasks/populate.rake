namespace :populate do
  desc "Add admin nurses"
  task :admin_nurse => :environment do
  	puts "Creating admin nurse"
    Nurse.create_admin_nurse
  end
  desc "Add reservation times"
  task :reservation_times => :environment do
  	puts "Creating reservation times"
  	ExaminationTime.create({:examination_time => "07:00-07:15"})
  	ExaminationTime.create({:examination_time => "07:15-07:30"})
  	ExaminationTime.create({:examination_time => "07:30-07:45"})
  	ExaminationTime.create({:examination_time => "07:45-08:00"})
  	ExaminationTime.create({:examination_time => "08:00-08:15"})
  	ExaminationTime.create({:examination_time => "08:15-08:30"})
  	ExaminationTime.create({:examination_time => "08:30-08:45"})
  	ExaminationTime.create({:examination_time => "08:45-09:00"})
  	ExaminationTime.create({:examination_time => "09:00-09:15"})
  	ExaminationTime.create({:examination_time => "09:15-09:30"})
  	ExaminationTime.create({:examination_time => "09:30-09:45"})
  	ExaminationTime.create({:examination_time => "09:45-10:00"})
  	ExaminationTime.create({:examination_time => "10:00-10:15"})
  	ExaminationTime.create({:examination_time => "10:15-10:30"})
  	ExaminationTime.create({:examination_time => "10:30-10:45"})
  	ExaminationTime.create({:examination_time => "10:45-11:00"})
  end
end