class ProfessorHomeController < ApplicationController
  
   before_action :require_user, only: [:professorhome, :addprofessorpreference, :profsetsession]
   
  def professorhome
    @semester = Semester.all
  end

  
  
  def professoraddpreference
    
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
 
      if params.has_key?(:unacceptable_ids) || params.has_key?(:preferred_ids)          
        @prof_id = session[:faculty_id]
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
          redirect_to professorhome_path
        end
        
        
      end
    else
      flash[:error] = "Please choose semester"
      redirect_to professorhome_path
    end
  end
  
  def viewpreferences
    if session[:semester_id] !=nil && session[:semester_id]!=""  
      
    else
      flash[:error] = "Please choose semester"
      redirect_to professorhome_path
    end
  end
  def profsetsession
    session[:semester_id] = params[:class][:semester_id]
    redirect_to professorhome_path
  end
 

 

end
