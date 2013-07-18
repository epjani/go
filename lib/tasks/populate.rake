namespace :populate do
  desc "Add admin nurses"
  task :admin_nurse => :environment do
  	puts "Creating admin nurse"
    Nurse.create_admin_nurse
  end
  desc "Add reservation times"
  task :reservation_times => :environment do
  	puts "Creating reservation times"
  	ExaminationTime.create({:examination_time => "07:30-07:45", :shift => 1})
  	ExaminationTime.create({:examination_time => "07:45-08:00", :shift => 1})
  	ExaminationTime.create({:examination_time => "08:00-08:15", :shift => 1})
  	ExaminationTime.create({:examination_time => "08:15-08:30", :shift => 1})
  	ExaminationTime.create({:examination_time => "08:30-08:45", :shift => 1})
  	ExaminationTime.create({:examination_time => "08:45-09:00", :shift => 1})
  	ExaminationTime.create({:examination_time => "09:00-09:15", :shift => 1})
  	ExaminationTime.create({:examination_time => "09:15-09:30", :shift => 1})
  	ExaminationTime.create({:examination_time => "09:30-09:45", :shift => 1})
  	ExaminationTime.create({:examination_time => "09:45-10:00", :shift => 1})
  	ExaminationTime.create({:examination_time => "10:00-10:15", :shift => 1})
  	ExaminationTime.create({:examination_time => "10:15-10:30", :shift => 1})
  	ExaminationTime.create({:examination_time => "10:30-10:45", :shift => 1})
  	ExaminationTime.create({:examination_time => "10:45-11:00", :shift => 1})
    ExaminationTime.create({:examination_time => "11:00-11:15", :shift => 1})
    ExaminationTime.create({:examination_time => "11:15-11:30", :shift => 1})
    ExaminationTime.create({:examination_time => "11:30-11:45", :shift => 1})
    ExaminationTime.create({:examination_time => "11:45-12:00", :shift => 1})
    ExaminationTime.create({:examination_time => "12:00-12:15", :shift => 1})
    ExaminationTime.create({:examination_time => "12:15-12:30", :shift => 1})
    ExaminationTime.create({:examination_time => "12:30-12:45", :shift => 1})
    ExaminationTime.create({:examination_time => "12:45-13:00", :shift => 1})
    ExaminationTime.create({:examination_time => "13:00-13:15", :shift => 1})
    ExaminationTime.create({:examination_time => "13:15-13:30", :shift => 1})
    ExaminationTime.create({:examination_time => "13:30-13:45", :shift => 1})
    ExaminationTime.create({:examination_time => "13:45-14:00", :shift => 1})
    ExaminationTime.create({:examination_time => "14:15-14:30", :shift => 1})

    ExaminationTime.create({:examination_time => "12:30-12:45", :shift => 2})
    ExaminationTime.create({:examination_time => "12:45-13:00", :shift => 2})
    ExaminationTime.create({:examination_time => "13:00-13:15", :shift => 2})
    ExaminationTime.create({:examination_time => "13:15-13:30", :shift => 2})
    ExaminationTime.create({:examination_time => "13:30-13:45", :shift => 2})
    ExaminationTime.create({:examination_time => "13:45-14:00", :shift => 2})
    ExaminationTime.create({:examination_time => "14:15-14:30", :shift => 2})
    ExaminationTime.create({:examination_time => "14:30-14:45", :shift => 2})
    ExaminationTime.create({:examination_time => "14:45-15:00", :shift => 2})   
    ExaminationTime.create({:examination_time => "15:00-15:15", :shift => 2})
    ExaminationTime.create({:examination_time => "15:15-15:30", :shift => 2})
    ExaminationTime.create({:examination_time => "15:30-15:45", :shift => 2})
    ExaminationTime.create({:examination_time => "15:45-16:00", :shift => 2})
    ExaminationTime.create({:examination_time => "16:00-16:15", :shift => 2})
    ExaminationTime.create({:examination_time => "16:15-16:30", :shift => 2})
    ExaminationTime.create({:examination_time => "16:30-16:45", :shift => 2})
    ExaminationTime.create({:examination_time => "16:45-17:00", :shift => 2})
    ExaminationTime.create({:examination_time => "17:00-17:15", :shift => 2})
    ExaminationTime.create({:examination_time => "17:15-17:30", :shift => 2})
    ExaminationTime.create({:examination_time => "17:30-17:45", :shift => 2})
    ExaminationTime.create({:examination_time => "17:45-18:00", :shift => 2})
    ExaminationTime.create({:examination_time => "18:00-18:15", :shift => 2})
    ExaminationTime.create({:examination_time => "18:15-18:30", :shift => 2})
    ExaminationTime.create({:examination_time => "18:30-18:45", :shift => 2})
    ExaminationTime.create({:examination_time => "18:45-19:00", :shift => 2})
    ExaminationTime.create({:examination_time => "19:15-19:30", :shift => 2})
    ExaminationTime.create({:examination_time => "19:30-19:45", :shift => 2})
    
  end

  task :examinations => :environment do
    puts "Adding standard reservations (pause/cito)"
    Examination.create({:name => "Pauza", :description => "Pauza"})
    Examination.create({:name => "CITO", :description => "CITO"})
  end

end