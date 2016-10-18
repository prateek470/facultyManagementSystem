class HomePageController < ApplicationController
   before_action :require_user,:check_permission, only: [:home, :addfaculty, :addcourse, :addsemester, :setsession, :createsemester]


  def home
    @semester = Semester.all
  end
  
  def resetuser
    @users = User.all
    
    if params[:class] != nil
      desired_user = params[:class][:selectedUser]
      name = @users.where(:id =>desired_user).select(:faculty_name).take.faculty_name.to_s
      User.destroy(desired_user)
      flash[:success] = "Reset Account for " + name
      redirect_to root_path
    end
  end
  
  def addfaculty
     
    @permissions = ["Admin", "User"]
  	if params[:class] != nil && params[:class][:FacultyName] != "" && params[:class][:permission] !=
    		Faculty.create!(faculty_name: params[:class][:FacultyName], permission: params[:class][:permission])
    		flash[:success] = "New Faculty Member added"
    		redirect_to root_path
    #elsif
      #flash[:error] = "Please enter Faculty Name"
      #redirect_to addfaculty_path
	 end
     
  end

  def addcourse
  	if params[:class] != nil && params[:class][:CourseName] != ""
    		Course.create!(:course_name => params[:class][:CourseName], :CourseTitle => params[:class][:CourseTitle], :course_size => params[:class][:course_size])
    		flash[:success]= params[:class][:CourseName] + " added to the courses"
  	end
  end

  def addsemester
  end

  def setsession
  	session[:semester_id] = params[:class][:semester_id]
  	redirect_to root_path;
  end
  
  
  def addpreference
    if session[:semester_id] !=nil && session[:semester_id]!=""
      @timeslot = TimeSlot.all
      @semester_id = session[:semester_id]
      @faculty = Faculty.all
      @defaultBad = Array.new
      
      for slot in @timeslot
        if slot.time_slot.to_s.include?("*")
          @defaultBad.push(slot)
        end
      end
      goodPreference = Array.new(9)
      badPreference = Array.new(9)
      
      preferencesGoodArray = Array.new(9)
      preferencesBadArray = Array.new(9)
      if params[:class]!=nil
        if params[:class][:FacultyName] !=""
          if params.has_key?(:class) && (params.has_key?(:unacceptable_ids) || params.has_key?(:preferred_ids))          
            if params[:class] !=nil && params[:class][:FacultyName] !=nil         
              @prof_id = params[:class][:FacultyName]
             
              if !Faculty.exists?(:id=>@prof_id)
                flash[:error] = "Professor does not exist"
                redirect_to addpreference_path
              end
             
               
    
             
           end
            if params.has_key?(:preferred_ids)
              count = 0
              for time in params[:preferred_ids]
                goodPreference[count] = time
                count +=1
              end
            end
            if params.has_key?(:unacceptable_ids)
              count = 0
              for time in params[:unacceptable_ids]
                badPreference[count] = time
                count +=1
              end
            end
            count = 0
            for time in goodPreference
              if time == nil
                next
              end
              day_combo = TimeSlot.where(:id=>time).select(:day_combination_id).take.day_combination_id
              if !Preference.exists?(:time_slot_id => @params_time_slot1,:day_combination_id=>day_combo, :building_id=> '1',:semester_id=> @semester_id)
                Preference.create!(:time_slot_id=>time,:day_combination_id=>day_combo, :building_id=> '1',:semester_id=> @semester_id)
                puts "New Preference Added"
              end
              id = Preference.where(:time_slot_id=>time,:day_combination_id=>day_combo, :building_id=> '1',:semester_id=> @semester_id).select(:id).take.id
              preferencesGoodArray[count] = id
              count +=1
            end
            
            count = 0
            for time in badPreference
              if time == nil
                next
              end
              day_combo = TimeSlot.where(:id=>time).select(:day_combination_id).take.day_combination_id
              if !Preference.exists?(:time_slot_id => @params_time_slot1,:day_combination_id=>day_combo, :building_id=> '1',:semester_id=> @semester_id)
                Preference.create!(:time_slot_id=>time,:day_combination_id=>day_combo, :building_id=> '1',:semester_id=> @semester_id)
                puts "New Preference Added"
              end
              id = Preference.where(:time_slot_id=>time,:day_combination_id=>day_combo, :building_id=> '1',:semester_id=> @semester_id).select(:id).take.id
              preferencesBadArray[count] = id
              count +=1
            end
            
            if !FacultyPreference.exists?(:preference1_id=>preferencesGoodArray[0],:preference2_id=>preferencesGoodArray[1],:preference3_id=>preferencesGoodArray[2],:preference4_id=>preferencesGoodArray[3],:preference5_id=>preferencesGoodArray[4],
                                          :preference6_id=>preferencesGoodArray[5],:preference7_id=>preferencesGoodArray[6],:preference8_id=>preferencesGoodArray[7],:preference9_id=>preferencesGoodArray[8], :semester_id=> @semester_id)
                                          
              FacultyPreference.create!(:preference1_id=>preferencesGoodArray[0],:preference2_id=>preferencesGoodArray[1],:preference3_id=>preferencesGoodArray[2],:preference4_id=>preferencesGoodArray[3],:preference5_id=>preferencesGoodArray[4],
                                        :preference6_id=>preferencesGoodArray[5],:preference7_id=>preferencesGoodArray[6],:preference8_id=>preferencesGoodArray[7],:preference9_id=>preferencesGoodArray[8], :semester_id=> @semester_id)
            end
              goodPref =FacultyPreference.where(:preference1_id=>preferencesGoodArray[0],:preference2_id=>preferencesGoodArray[1],:preference3_id=>preferencesGoodArray[2],:preference4_id=>preferencesGoodArray[3],:preference5_id=>preferencesGoodArray[4],
                                          :preference6_id=>preferencesGoodArray[5],:preference7_id=>preferencesGoodArray[6],:preference8_id=>preferencesGoodArray[7],:preference9_id=>preferencesGoodArray[8], :semester_id=> @semester_id).take 
             
             
             if !FacultyPreference.exists?(:preference1_id=>preferencesBadArray[0],:preference2_id=>preferencesBadArray[1],:preference3_id=>preferencesBadArray[2],:preference4_id=>preferencesBadArray[3],:preference5_id=>preferencesBadArray[4],
                                          :preference6_id=>preferencesBadArray[5],:preference7_id=>preferencesBadArray[6],:preference8_id=>preferencesBadArray[7],:preference9_id=>preferencesBadArray[8], :semester_id=> @semester_id)
                                          
              FacultyPreference.create!(:preference1_id=>preferencesBadArray[0],:preference2_id=>preferencesBadArray[1],:preference3_id=>preferencesBadArray[2],:preference4_id=>preferencesBadArray[3],:preference5_id=>preferencesBadArray[4],
                                        :preference6_id=>preferencesBadArray[5],:preference7_id=>preferencesBadArray[6],:preference8_id=>preferencesBadArray[7],:preference9_id=>preferencesBadArray[8], :semester_id=> @semester_id)
            end
              badPref =FacultyPreference.where(:preference1_id=>preferencesBadArray[0],:preference2_id=>preferencesBadArray[1],:preference3_id=>preferencesBadArray[2],:preference4_id=>preferencesBadArray[3],:preference5_id=>preferencesBadArray[4],
                                          :preference6_id=>preferencesBadArray[5],:preference7_id=>preferencesBadArray[6],:preference8_id=>preferencesBadArray[7],:preference9_id=>preferencesBadArray[8], :semester_id=> @semester_id).take
             
             
             if goodPref !=nil && badPref !=nil
              good_pref_id = goodPref.id
              bad_pref_id = badPref.id
              prof_name = Faculty.where(:id=>@prof_id).select(:faculty_name).take.faculty_name.to_s
              Faculty.update(@prof_id, preference: good_pref_id.to_s)
              Faculty.update(@prof_id, bad_preference: bad_pref_id.to_s)
              if !params.has_key?(:unacceptable_ids)
                Faculty.update(@prof_id, bad_preference: nil)
              end
              if !params.has_key?(:preferred_ids)
                Faculty.update(@prof_id, preference: nil)
              end
              
              flash[:success]= "Updated Preference for " + prof_name
              redirect_to addpreference_path
            end
            
            
          end
        else
          flash[:error] = "Please select professor"
          redirect_to addpreference_path
        end
        
      end
    else
      flash[:error] = "Please choose semester"
      redirect_to root_path
    end
  end
  
  def createsemester
    success = false;
    if params[:class] != nil && params[:class][:SemesterTitle] != ""
  	semester = Semester.find_by(SemesterTitle: params[:class][:SemesterTitle])
	if semester == nil
		Semester.create_semester(params[:class][:SemesterTitle])
		success = true
	end
    end
    if success == true
	flash[:success] = "Created new semester"
	redirect_to root_path;
    else
	flash[:error] = "Enter a valid and new semester"
	redirect_to addsemester_path;
    end
  end
  
  def addclassroom
    if  params[:class] == nil || params[:class][:building_name] == "" || params[:class][:room_name] == "" || params[:class][:room_capacity] == "" 
       
    else
      @building = Building.find_or_create_by!(:building_name=>params[:class][:building_name])
      @room = Room.find_or_create_by!(:room_name=>params[:class][:room_name],:building_id=>@building.id)
      @room.Capacity =  params[:class][:room_capacity]
      @room.save
      flash[:success] = "Successfully Created/Updated Classroom"
      redirect_to root_path; 
    end
  end

  def calendar
    #course_name =Course.where(:id => "1").select(:course_name).take.course_name.to_s
    #name = @users.where(:id =>desired_user).select(:faculty_name).take.faculty_name.to_s
    #name = User.where(:id =>"1").select(:faculty_name).take.faculty_name.to_s
    @course = Course.where(:id =>"1").select(:course_name).take.course_name.to_s
    @start = "2016-04-14T09:35:00"
    @end =  "2016-04-14T10:20:00"
    print "COURSE NAME \n"
    #print name + "\n"
    print @course
    print @start
    print @end
    print "------------------------------"
    
  end
end
