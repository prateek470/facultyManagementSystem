class EventsController < ApplicationController
  def new
    @event = Event.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  def deleteevent
    event_id = params[:class][:event_id]
    course_assignment_id = Event.where(:id=>event_id).select("course_assignment_id").take.course_assignment_id
    CourseAssignment.where(:id=>course_assignment_id).destroy_all
    Event.where(:id=>event_id).destroy_all
    redirect_to events_path
    flash[:success] = "Assignment has been deleted"
  end 
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: {msg: 'your event was saved.'}
    else
      render json: {msg: 'error: something go wrong.' }, status: 500
    end
  end

  def index
    permission = Faculty.where(:id=>session[:faculty_id]).select("permission").take.permission
    @course_assignments = CourseAssignment.all
    
    @timeslot = TimeSlot.all
    @building = Building.all
    @rooms = Room.where("building_id = ?", Building.first.id)
    if !@course_assignments.empty? and @course_assignments != nil
      @course_assignments.each do |c|
        course = Course.where(:id => c.course_id).select("course_name").take.course_name
        room = Room.where(:id=> c.room_id).select("room_name").take.room_name
        building_id = Room.where(:id=> c.room_id).select("building_id").take.building_id
        building = Building.where(:id=> building_id).select("building_name").take.building_name
        day_combination = DayCombination.where(:id=>c.day_combination_id).select("day_combination").take.day_combination
        start = TimeSlot.where(:id=>c.time_slot_id).select("start").take.start
        end_time = TimeSlot.where(:id=>c.time_slot_id).select("end_time").take.end_time
        
        
        
        
        puts course
        puts room
        puts building
        puts day_combination
        start = start.to_s(:time)
        end_time =  end_time.to_s(:time)
        title = course + " " + building + " " + room
        puts title
        days = Array.new
        days = getDay(day_combination)
        
        days.each do |day|
          start_at = day + " " + start + ":00.000000"
          end_at = day + " " + end_time + ":00.000000"
          puts start_at
          puts end_at
          #vent = Event.where(:title => title, :start_at => start_at, :end_at => end_at, :user_name => "Tyler").all
          
          if !Event.exists?(:title => title, :start_at => start_at, :end_at => end_at, :course_assignment_id => c.id)
            Event.create(:title => title, :start_at => start_at, :end_at => end_at, :course_assignment_id => c.id )
          else 
            puts "Already Exists"
          end 
          end 
        end 
        
        
        
        
    end 
   
    if permission == "User"
      courses = CourseAssignment.where(:faculty_id => session[:faculty_id], :semester_id => session[:semester_id]).pluck(:id)
      puts courses
       @events = Event.where(course_assignment_id: courses)
    elsif permission == "Admin"
      semester = CourseAssignment.where(:semester_id => session[:semester_id]).pluck(:id)
       @events = Event.where(course_assignment_id: semester)
    end 
  
    #@events = Event.all
    respond_to do |format| 
      format.html
      format.json { render :json => @events } 
    end
  end
  
  
  
  def prof_index 
    permission = Faculty.where(:id=>session[:faculty_id]).select("permission").take.permission
  
     
    @course_assignments = CourseAssignment.all
    
    @timeslot = TimeSlot.all
    @building = Building.all
    @rooms = Room.where("building_id = ?", Building.first.id)
    if !@course_assignments.empty? and @course_assignments != nil
      @course_assignments.each do |c|
        course = Course.where(:id => c.course_id).select("course_name").take.course_name
        room = Room.where(:id=> c.room_id).select("room_name").take.room_name
        building_id = Room.where(:id=> c.room_id).select("building_id").take.building_id
        building = Building.where(:id=> building_id).select("building_name").take.building_name
        day_combination = DayCombination.where(:id=>c.day_combination_id).select("day_combination").take.day_combination
        start = TimeSlot.where(:id=>c.time_slot_id).select("start").take.start
        end_time = TimeSlot.where(:id=>c.time_slot_id).select("end_time").take.end_time
        
        puts course
        puts room
        puts building
        puts day_combination
        start = start.to_s(:time)
        end_time =  end_time.to_s(:time)
        title = course + " " + building + " " + room
        puts title
        days = Array.new
        days = getDay(day_combination)
        
        days.each do |day|
          start_at = day + " " + start + ":00.000000"
          end_at = day + " " + end_time + ":00.000000"
          puts start_at
          puts end_at
          #vent = Event.where(:title => title, :start_at => start_at, :end_at => end_at, :user_name => "Tyler").all
          
          if !Event.exists?(:title => title, :start_at => start_at, :end_at => end_at, :course_assignment_id => c.id)
            Event.create(:title => title, :start_at => start_at, :end_at => end_at, :course_assignment_id => c.id )
          else 
            puts "Already Exists"
          end 
          end 
        end 
      
        
        
        
        
    end 
   
    if permission == "User"
      courses = CourseAssignment.where(:faculty_id => session[:faculty_id]).pluck(:id)
      puts courses
      @events = Event.where(course_assignment_id: courses)
    elsif permission == "Admin"
      @events = Event.all
    end 
  
    #@events = Event.all
    respond_to do |format| 
      format.html
      format.json { render :json => @events } 
    end
  end 
  
  
  
  

  def event_params
    params.permit(:title).merge start_at: params[:start].to_time, end_at: params[:end].to_time, user_name: params[:user_name]
  end



def getDay(day_combination)
  dateArray = Array.new
  if day_combination == "MW"
    dateArray << "2016-04-11"
    dateArray << "2016-04-13"
   elsif day_combination == "MWF"
    dateArray << "2016-04-11"
    dateArray << "2016-04-13"
    dateArray << "2016-04-15"
   elsif day_combination == "TR"
     dateArray << "2016-04-12"
     dateArray << "2016-04-14"
   elsif day_combination == "M"
     dateArray << "2016-04-11"
   elsif day_combination == "T"
     dateArray << "2016-04-12"
   elsif day_combination == "W"
     dateArray << "2016-04-13"
   elsif day_combination == "R"
     dateArray << "2016-04-14"
  end 
end 

 def editevent 
   @timeslot = TimeSlot.all
   @building = Building.all
   @rooms = Room.all
   	#if params[:class] != nil && params[:class][:CourseName] != ""
    		#Course.create!(:course_name => params[:class][:CourseName], :CourseTitle => params[:class][:CourseTitle], :course_size => params[:course_size][:course_size])
  	#end
  	
  #	{"utf8"=>"✓",
  #"title"=>"CSCE 601 HRBB 124",
  #"class"=>{"time_slot_id"=>"1",
  #"name"=>"1"},
  #"commit"=>"Submit"
  
  if params[:class] != nil && params[:class][:name] != ""
    temp = Event.where(:id=> params[:class][:name]).select("course_assignment_id").take.course_assignment_id
    course_id = CourseAssignment.where(:id=> temp).select("course_id").take.course_id
    course_size = Course.where(:id=>course_id).select("course_size").take.course_size
    @rooms = Room.where("building_id = ? and Capacity >= ?", params[:building_id], course_size)
    assignment = CourseAssignment.where(:id=>temp).select("time_slot_id").take.time_slot_id
    if assignment != params[:class][:time_slot_id]
      #Update the timeslot with the correct day combination in CourseAssignment
      ts = TimeSlot.where(:id=> params[:class][:time_slot_id]).select("id").take.id
      dayId = TimeSlot.where(:id=> params[:class][:time_slot_id]).select("day_combination_id").take.day_combination_id
      room_id = Room.where(:id=>params[:class][:room_id]).select("id").take.id
      building_id = Building.where(:id=>params[:class][:building_id]).select("id").take.id
      
      
      if !CourseAssignment.exists?(:time_slot_id => ts, :day_combination_id => dayId, :room_id => room_id)
        capacity = Room.where(:id=> room_id).select("Capacity").take.Capacity
        if course_size > capacity 
          flash[:error] = "Room is too small for this course"
        else 
          CourseAssignment.update(temp, :time_slot_id => ts, :day_combination_id => dayId, :room_id => room_id)
          Event.where(course_assignment_id: temp).destroy_all
        end 
      else 
        flash[:error] = "Course Conflict at this Time"
      end 
      
      redirect_to events_path
    end 
    
  end 
  	
  	
 end
 
def update_rooms
  course =  Event.where(:id=> params[:class][:name]).select("course_assignment_id").take.course_assignment_id
  course_id = CoruseAssignment.where(:id=> course).select("course_id").take.course_id
  course_size = Course.where(:id=>course_id).select("course_size").take.course_size
  @rooms = Room.where("building_id = ? and Capacity >= ?", params[:building_id], course_size)
  respond_to do |format|
    format.js 
  end
end


def show
  @room = Room.find_by("id = ?", params[:class][:room_id])
end
 
end 


