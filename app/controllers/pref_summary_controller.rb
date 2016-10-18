class PrefSummaryController < ApplicationController
before_action :require_user,:check_permission
def create
  redirect_to action: "index"
end	

def index #def
    
  	if session[:semester_id] != nil && session[:semester_id] != ""
  	    @timeslot = TimeSlot.all
        @faculty = Faculty.all
        @semester = session[:semester_id]
        @goodtimes = Array.new
        @oktimes = Array.new
        @badtimes = Array.new
        @assigned = Array.new
        if params[:class]!=nil && params[:class][:selected_time]!=""          
            selected = params[:class][:selected_time]
            @selected_time = @timeslot.find_by_id(selected).as_json["time_slot"]
            day_combo = DayCombination.where(:id=>@timeslot.find_by_id(selected).day_combination_id).select(:day_combination).take.day_combination.to_s
            @selected_time = day_combo + " " + @selected_time
            for faculty in @faculty
                if CourseAssignment.exists?(:time_slot_id=>params[:class][:selected_time], :faculty_id=>faculty.id)
                  @assigned.push(faculty)
                else
                    
                    fac_preference = faculty.preference
                    if fac_preference !=nil
                        facultyPreference = FacultyPreference.find_by_id(fac_preference)
                        preferences = facultyPreference.as_json(except: [:created_at,:updated_at,:faculty_course_id,:id,:semester_id])
                        for preference in preferences.keys
                          prefid = preferences[preference]

                          if prefid !=nil
                            
                              pref = Preference.find_by_id(prefid).as_json
                              time = pref["time_slot_id"]
                              timeslot = @timeslot.find_by_id(time).as_json
                              if time.to_s == selected.to_s
                                  @goodtimes.push(faculty)
                              end 
                          end
                        end
                    end
                      
                    bad_preference = faculty.bad_preference
                    if bad_preference !=nil
                        facultyPreference = FacultyPreference.find_by_id(bad_preference)
                        preferences = facultyPreference.as_json(except: [:created_at,:updated_at,:faculty_course_id,:id,:semester_id])
                        for preference in preferences.keys
                          prefid = preferences[preference] 
                          if prefid !=nil
                            
                              pref = Preference.find_by_id(prefid).as_json
                              time = pref["time_slot_id"]
                              timeslot = @timeslot.find_by_id(time).as_json
                              
                              if time.to_s == selected.to_s
                                  @badtimes.push(faculty)
                              end
                          end
                        end    
                     end
                  if !@badtimes.include?(faculty) && !@goodtimes.include?(faculty) 
                    @oktimes.push(faculty)
                  end

                end
                
             end  
          end 
       
  	  
  	else
    			flash[:error] = "Please choose semester"
    			redirect_to root_path
   

    end
    #def
  end
#class  	
end 

