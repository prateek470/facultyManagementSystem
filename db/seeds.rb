# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

buildings = [{:building_name => 'HRBB'},
			]

rooms = [{:room_name => '124', :building_id => 1, :Capacity => 135},
		 {:room_name => '126', :building_id => 1, :Capacity => 27},
		 {:room_name => '113', :building_id => 1, :Capacity => 60},
		]

		
	 
daycombinations = [{:day_combination => 'MW'},
				   {:day_combination => 'TR'},
				   {:day_combination => 'MWF'},
				   {:day_combination => 'M'},
				   {:day_combination => 'T'},
				   {:day_combination => 'W'},
				   {:day_combination => 'R'}
				]

faculties = [{:faculty_name => 'Amato Nancy', :permission => 'User'},
			 {:faculty_name => 'Bettati Riccardo', :permission => 'User'},
			 {:faculty_name => 'Chai Jinxiang',:permission => 'User'},
			 {:faculty_name => 'Caverlee James',:permission => 'User'},
			 {:faculty_name => 'Chen Jianer',:permission => 'User'},
			 {:faculty_name => 'Choe Yoonsuck', :permission => 'User'},
			 {:faculty_name => 'Da Silva Dilma',:permission => 'Admin'},
			 {:faculty_name => 'Daugherity Walter',:permission => 'User'},
			 {:faculty_name => 'Davis Tim',:permission => 'User'},
			 {:faculty_name => 'Furuta Richard',:permission => 'User'},
			 {:faculty_name => 'Gooch Bruce',:permission => 'User'},
			 {:faculty_name => 'Gu Guofei',:permission => 'User'},
			 {:faculty_name => 'Gutierrez-Osuna Ricardo',:permission => 'User'},
			 {:faculty_name => 'Hammond Tracy Anne',:permission => 'User'},
			 {:faculty_name => 'Hu Xia',:permission => 'User'},
			 {:faculty_name => 'Huang Ruihong',:permission => 'User'},
			 {:faculty_name => 'Huang Jeff',:permission => 'User'},
			 {:faculty_name => 'Hurley Joseph',:permission => 'User'},
			 {:faculty_name => 'Ioerger Thomas',:permission => 'User'},
			 {:faculty_name => 'Jafari Roozbeh',:permission => 'User'},
			 {:faculty_name => 'Jarvi Jaakko',:permission => 'User'},
			 {:faculty_name => 'Jiang Andrew',:permission => 'User'},
			 {:faculty_name => 'Jiménez Daniel',:permission => 'User'},
			 {:faculty_name => 'Kerne Andruid',:permission => 'User'},
			 {:faculty_name => 'Keyser John',:permission => 'Admin'},
			 {:faculty_name => 'Kim Eun Jung',:permission => 'User'},
			 {:faculty_name => 'Klappenecker Andreas',:permission => 'User'},
			 {:faculty_name => 'Lee Hyunyoung',:permission => 'User'},
			 {:faculty_name => 'Leyk Teresa',:permission => 'User'},
			 {:faculty_name => 'Liu Jyh-Charn',:permission => 'User'},
			 {:faculty_name => 'Loguinov Dmitri',:permission => 'User'},
			 {:faculty_name => 'Mahapatra Rabi',:permission => 'User'},
			 {:faculty_name => 'Moore Michael',:permission => 'User'},
			 {:faculty_name => 'Murphy Robin',:permission => 'User'},
			 {:faculty_name => 'Ragsdale Daniel',:permission => 'User'},
			 {:faculty_name => 'Rauchwerger Lawrence',:permission => 'User'},
			 {:faculty_name => 'Ritchey Philip',:permission => 'User'},
			 {:faculty_name => 'Sarin Vivek',:permission => 'User'},
			 {:faculty_name => 'Schaefer Scott',:permission => 'User'},
			 {:faculty_name => 'Shell Dylan',:permission => 'User'},
			 {:faculty_name => 'Shipman Frank',:permission => 'User'},
			 {:faculty_name => 'Song Dezhen',:permission => 'User'},
			 {:faculty_name => 'Stoleru Radu',:permission => 'User'},
			 {:faculty_name => 'Sze Sing-Hoi',:permission => 'User'},
			 {:faculty_name => 'Taylor Valerie',:permission => 'User'},
			 {:faculty_name => 'Tyagi Aakash',:permission => 'User'},
			 {:faculty_name => 'Walker Duncan',:permission => 'User'},
			 {:faculty_name => 'Ward Ronnie',:permission => 'User'},
			 {:faculty_name => 'Welch Jennifer',:permission => 'User'},
			 {:faculty_name => 'Williams Tiffani',:permission => 'User'},
			 
			]

courses = 	[		 
			 {:CourseTitle => 'Programming with C and Java', :course_name => 'CSCE 601', :course_size => '100'},
			 {:CourseTitle => 'Object-Oriented Programming, Development and Software Engineering', :course_name => 'CSCE 602', :course_size => '20'},
			 {:CourseTitle => 'Database Systems and Applications', :course_name => 'CSCE 603'},
			 {:CourseTitle => 'Programming Languages', :course_name => 'CSCE 604'},
			 {:CourseTitle => 'Compiler Design', :course_name => 'CSCE 605'},
			 {:CourseTitle => 'Software Engineering', :course_name => 'CSCE 606'},
			 {:CourseTitle => 'Database Systems', :course_name => 'CSCE 608'},
			 {:CourseTitle => 'Hypertext/Hypermedia Systems', :course_name => 'CSCE 610'},
			 {:CourseTitle => 'Operating Systems and Applications', :course_name => 'CSCE 611'},
			 {:CourseTitle => 'Applied Networks and Distributed Processing', :course_name => 'CSCE 612'},
			 {:CourseTitle => 'Operating Systems', :course_name => 'CSCE 613'},
			 {:CourseTitle => 'Computer Architecture', :course_name => 'CSCE 614'},
			 {:CourseTitle => 'Co-Design of Embedded Systems', :course_name => 'CSCE 617'},
			 {:CourseTitle => 'Networks and Distributed Computing', :course_name => 'CSCE 619'},
			 {:CourseTitle => 'Computational Geometry', :course_name => 'CSCE 620'},
			 {:CourseTitle => 'Language, Library, and Program Design Using C++', :course_name => 'CSCE 621'},
			 {:CourseTitle => 'Generic Programming', :course_name => 'CSCE 622'},
			 {:CourseTitle => 'Sketch Recognition', :course_name => 'CSCE 624'},
			 {:CourseTitle => 'Introduction to Artificial Intelligence', :course_name => 'CSCE 625'},
			 {:CourseTitle => 'Parallel Algorithm Design and Analysis', :course_name => 'CSCE 626'},
			 {:CourseTitle => 'Theory of Computability', :course_name => 'CSCE 627'},
			 {:CourseTitle => 'Computational Biology', :course_name => 'CSCE 628'},
			 {:CourseTitle => 'Analysis of Algorithms', :course_name => 'CSCE 629'},
			 {:CourseTitle => 'Speech Processing', :course_name => 'CSCE 630'},
			 {:CourseTitle => 'Intelligent Agents', :course_name => 'CSCE 631'},
			 {:CourseTitle => 'Machine Learning', :course_name => 'CSCE 633'},
			 {:CourseTitle => 'Intelligent User Interfaces', :course_name => 'CSCE 634'},
			 {:CourseTitle => 'AI Robotics', :course_name => 'CSCE 635'},
			 {:CourseTitle => 'Neural Networks', :course_name => 'CSCE 636'},
			 {:CourseTitle => 'Complexity Theory', :course_name => 'CSCE 637'},
			 {:CourseTitle => 'Fuzzy Logic and Intelligent Systems', :course_name => 'CSCE 639'},
			 {:CourseTitle => 'Quantum Algorithms', :course_name => 'CSCE 640'},
			 {:CourseTitle => 'Computer Graphics', :course_name => 'CSCE 641'},
			 {:CourseTitle => 'Seminar in Intelligent Systems and Robotics', :course_name => 'CSCE 643'},
			 {:CourseTitle => 'Cortical Networks', :course_name => 'CSCE 644'},
			 {:CourseTitle => 'Geometric Modeling', :course_name => 'CSCE 645'},
			 {:CourseTitle => 'The Digital Image', :course_name => 'CSCE 646'},
			 {:CourseTitle => 'Image Synthesis', :course_name => 'CSCE 647'},
			 {:CourseTitle => 'Computer Aided Sculpting', :course_name => 'CSCE 648'},
			 {:CourseTitle => 'Physically-Based Modeling', :course_name => 'CSCE 649'},
			 {:CourseTitle => 'Computer Methods in Applied Sciences', :course_name => 'CSCE 653'},
			 {:CourseTitle => 'Supercomputing', :course_name => 'CSCE 654'},
			 {:CourseTitle => 'Human Centered Systems and Information', :course_name => 'CSCE 655'},
			 {:CourseTitle => 'Computers and New Media', :course_name => 'CSCE 656'},
			 {:CourseTitle => 'High Performance Computing for Earth Science and Petroleum Engineering', :course_name => 'CSCE 657'},
			 {:CourseTitle => 'Randomized Algorithms', :course_name => 'CSCE 658'},
			 {:CourseTitle => 'Parallel/Distributed Numerical Algorithms and Applications', :course_name => 'CSCE 659'},
			 {:CourseTitle => 'Computational Linear Algebra', :course_name => 'CSCE 660'},
			 {:CourseTitle => 'Integrated Systems Design Automation', :course_name => 'CSCE 661'},
			 {:CourseTitle => 'Distributed Processing Systems', :course_name => 'CSCE 662'},
			 {:CourseTitle => 'Real-Time Systems', :course_name => 'CSCE 663'},
			 {:CourseTitle => 'Wireless and Mobile Systems', :course_name => 'CSCE 664'},
			 {:CourseTitle => 'Advance Networking and Security', :course_name => 'CSCE 665'},
			 {:CourseTitle => 'Pattern Analysis', :course_name => 'CSCE 666'},
			 {:CourseTitle => 'Seminar in Human-Centered Computing and Information', :course_name => 'CSCE 667'},
			 {:CourseTitle => 'Distributed Algorithms and Systems', :course_name => 'CSCE 668'},
			 {:CourseTitle => 'Computational Optimization', :course_name => 'CSCE 669'},
			 {:CourseTitle => 'Information Storage and Retrieval', :course_name => 'CSCE 670'},
			 {:CourseTitle => 'Computer-Human Interaction', :course_name => 'CSCE 671'},
			 {:CourseTitle => 'Computer Supported Collaborative Work', :course_name => 'CSCE 672'},
			 {:CourseTitle => 'Digital Libraries', :course_name => 'CSCE 675'},
			 {:CourseTitle => 'Testing and Diagnosis of Digital Systems', :course_name => 'CSCE 680'},
			 {:CourseTitle => 'Seminar', :course_name => 'CSCE 681'},
			 {:CourseTitle => 'Professional Internship', :course_name => 'CSCE 684'},
			 {:CourseTitle => 'Directed Studies', :course_name => 'CSCE 685'},
			 {:CourseTitle => 'Special Topics in..', :course_name => 'CSCE 689'},
			]

timeranges = 	[{:t_range => 'Early morning', :t_slots => '', :day_combination_id => '1'},
				 {:t_range => 'Morning', :t_slots => '', :day_combination_id => '1'},
				 {:t_range => 'Mid-Day / Lunch', :t_slots => '', :day_combination_id => '1'},
				 {:t_range => 'Post-Lunch', :t_slots => '', :day_combination_id => '1'},
				 {:t_range => 'Evening', :t_slots => '8', :day_combination_id => '1'},

				 {:t_range => 'Early morning', :t_slots => '9', :day_combination_id => '2'},
				 {:t_range => 'Morning', :t_slots => '10,11', :day_combination_id => '2'},
				 {:t_range => 'Mid-Day / Lunch', :t_slots => '12', :day_combination_id => '2'},
				 {:t_range => 'Post-Lunch', :t_slots => '13', :day_combination_id => '2'},
				 {:t_range => 'Evening', :t_slots => '14', :day_combination_id => '2'},

				 {:t_range => 'Early morning', :t_slots => '1', :day_combination_id => '3'},
				 {:t_range => 'Morning', :t_slots => '2,3,4', :day_combination_id => '3'},
				 {:t_range => 'Mid-Day / Lunch', :t_slots => '5,6', :day_combination_id => '3'},
				 {:t_range => 'Post-Lunch', :t_slots => '7', :day_combination_id => '3'},
				 {:t_range => 'Evening', :t_slots => '', :day_combination_id => '3'},
			 
				]

timeslots = 	[{:time_slot => '8:00 am to 8:50 am', :day_combination_id => '3', :start => '2016-04-15 08:00:00.000000', :end_time => '2016-04-15 08:50:00.000000'},
				 {:time_slot => '9:10 am to 10:00 am', :day_combination_id => '3',:start => '2016-04-15 09:10:00.000000', :end_time => '2016-04-15 10:00:00.000000'},
				 {:time_slot => '10:20 am to 11:10 am', :day_combination_id => '3', :start => '2016-04-15 10:20:00.000000', :end_time => '2016-04-15 11:10:00.000000'},
				 {:time_slot => '11:30 am to 12:10 pm', :day_combination_id => '3', :start => '2016-04-15 11:30:00.000000', :end_time => '2016-04-15 12:10:00.000000'},
				 {:time_slot => '1:50 pm to 2:40 pm', :day_combination_id => '3', :start => '2016-04-15 13:50:00.000000', :end_time => '2016-04-15 14:40:00.000000'},
				 {:time_slot => '3:00 pm to 3:50 pm', :day_combination_id => '3', :start => '2016-04-15 15:00:00.000000', :end_time => '2016-04-15 15:50:00.000000'},
				 {:time_slot => '4:10 pm to 5:25 pm', :day_combination_id => '1', :start => '2016-04-15 16:10:00.000000', :end_time => '2016-04-15 17:25:00.000000'},
				 {:time_slot => '8:00 am to 9:15 am', :day_combination_id => '2', :start => '2016-04-15 08:00:00.000000', :end_time => '2016-04-15 09:15:00.000000'},
				 {:time_slot => '9:35 am to 10:50 am', :day_combination_id => '2',:start => '2016-04-15 09:35:00.000000', :end_time => '2016-04-15 10:50:00.000000'},
				 {:time_slot => '11:10 am to 12:25 pm', :day_combination_id => '2', :start => '2016-04-15 11:10:00.000000', :end_time => '2016-04-15 12:25:00.000000'},
				 {:time_slot => '12:45 pm to 2:00 pm', :day_combination_id => '2', :start => '2016-04-15 12:45:00.000000', :end_time => '2016-04-15 14:00:00.000000'},
				 {:time_slot => '2:20 pm to 3:35 pm', :day_combination_id => '2', :start => '2016-04-15 14:20:00.000000', :end_time => '2016-04-15 15:35:00.000000'},
				 {:time_slot => '3:55 pm to 5:10 pm', :day_combination_id => '2', :start => '2016-04-15 15:55:00.000000', :end_time => '2016-04-15 17:10:00.000000'},
				 {:time_slot => '5:45 pm to 7:00 pm*', :day_combination_id => '1', :start => '2016-04-15 17:45:00.000000', :end_time=> '2016-04-15 19:00:00.000000'},
				  {:time_slot => '5:30 pm to 8:15 pm*', :day_combination_id => '2', :start => '2016-04-15 17:30:00.000000', :end_time => '2016-04-15 20:15:00.000000'},
				  {:time_slot => '5:45 pm to 8:15 pm*', :day_combination_id => '4', :start => '2016-04-15 17:45:00.000000', :end_time => '2016-04-15 20:15:00.000000'},
				  {:time_slot => '5:30 pm to 8:00 pm*', :day_combination_id => '5', :start => '2016-04-15 17:30:00.000000', :end_time => '2016-04-15 20:00:00.000000'},
				  {:time_slot => '5:45 pm to 8:15 pm*', :day_combination_id => '6', :start => '2016-04-15 17:45:00.000000', :end_time => '2016-04-15 20:15:00.000000'},
				  {:time_slot => '5:30 pm to 8:00 pm*', :day_combination_id => '7', :start => '2016-04-15 17:30:00.000000', :end_time => '2016-04-15 20:00:00.000000'}
			 
				]	


preferences = 	[{:semester_id => '1',:building_id => '1', :day_combination_id => '2', :time_slot_id => '14'},
				 {:semester_id => '1',:building_id => '1', :day_combination_id => '2', :time_slot_id => '13'},
				 {:semester_id => '1',:building_id => '1', :day_combination_id => '2', :time_slot_id => '12'},
				 {:semester_id => '1',:building_id => '1', :day_combination_id => '2', :time_slot_id => '11'},
				 {:semester_id => '1',:building_id => '1', :day_combination_id => '2', :time_slot_id => '10'},
				 {:semester_id => '1',:building_id => '2', :day_combination_id => '2', :time_slot_id => '9'},
				 {:semester_id => '1',:building_id => '2', :day_combination_id => '1', :time_slot_id => '8'},
				 {:semester_id => '1',:building_id => '2', :day_combination_id => '3', :time_slot_id => '7'},
				 {:semester_id => '1',:building_id => '2', :day_combination_id => '3', :time_slot_id => '6'},
				 {:semester_id => '1',:building_id => '2', :day_combination_id => '3', :time_slot_id => '5'},
				 {:semester_id => '1',:building_id => '3', :day_combination_id => '3', :time_slot_id => '4'},
				 {:semester_id => '1',:building_id => '3', :day_combination_id => '3', :time_slot_id => '3'},
				 {:semester_id => '1',:building_id => '3', :day_combination_id => '3', :time_slot_id => '2'},
				 {:semester_id => '1',:building_id => '3', :day_combination_id => '3', :time_slot_id => '1'},
			 
				]	

facultycourses = [{:semester_id => '1',:faculty_id => '1', :course1_id => '2'},
				  {:semester_id => '1',:faculty_id => '2', :course1_id => '1'},
				  {:semester_id => '1',:faculty_id => '3', :course1_id => '3', :course2_id => '6'},
				  {:semester_id => '1',:faculty_id => '5', :course1_id => '4', :course2_id => '5'},
				  			 
				 ]	
				 

facultypreferences = [{:faculty_course_id => '1', :preference1_id => '1', :preference3_id => '3', :semester_id => '1'},
					  {:faculty_course_id => '2', :preference1_id => '3', :preference2_id => '4', :preference3_id => '5', :semester_id => '1'},
					  {:faculty_course_id => '3', :preference1_id => '5', :preference2_id => '7', :preference3_id => '6', :semester_id => '1'},
				      {:faculty_course_id => '4', :preference1_id => '7', :preference3_id => '10', :semester_id => '1'},
					]
semesters = [{:SemesterTitle => 'Fall 2015'},
         ]
					
facultypreferences=[{:preference1_id=>14}]
buildings.each do |building|
  Building.create!(building)
end


daycombinations.each do |dc|
  DayCombination.create!(dc)
end

faculties.each do |fclt|
  Faculty.create!(fclt)
end

courses.each do |crs|
  Course.create!(crs)
end

timeranges.each do |tr|
  TimeRange.create!(tr)
end

timeslots.each do |ts|
  TimeSlot.create!(ts)
end

rooms.each do |room|
  Room.create!(room)
end

semesters.each do |s|
 Semester.create_semester(s[:SemesterTitle])
end

# preferences.each do |pf|
 # Preference.create!(pf)
# end

# facultypreferences.each do |fpf|
 # FacultyPreference.create!(fpf)
# end
#Preference.destroy(3)

#FacultyPreference.all.each do |fp|
	#puts fp[:id]
#end



