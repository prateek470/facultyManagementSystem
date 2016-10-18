 var updateEvent;

$(document).ready(function() {



$('.edit').hide();



/*
                
$("#buildingId").change(function(){
  alert("Suh dude");
  var x = $("#buildingId").val();
  $('#room_select').show();
  alert(x);
  $.ajax({
    url: "events/update_rooms",
    type: "GET",
    data:{
      building_id: $("#buildingId").val()
    },
    success: function(resposne){
      alert("Success!");
      alert(response);
    }
    });
  }); 
              
*/

  $('#calendar').fullCalendar({
    editable: false,
    slotEventOverlap: true,
    columnFormat: {
      month: 'dddd',
      week: 'dddd',
      day: 'ddd'
    },
    buttonText: {
      today: 'Today',
      month: 'month',
      week: 'week',
      day: 'day'
    },
    minTime: "08:00:00",
    maxTime: "23:00:00",
    header: {
      left: '',
      center: "Course Schedule",
      right: ''
    },
    weekends: false, 
    defaultDate: moment('2016-04-11'),
    //this section is triggered when the event cell it's clicked
    selectable: false,
    selectHelper: true,
         eventClick: function (calEvent, jsEvent, view) {
           
            $("#dialog").dialog({
                autoOpen: false,

            }

            );
            
            

            $("#title").val(calEvent.title);
            
            $("#start").val(calEvent.start);
            
            $("#end").val(calEvent.end);
            
            $("#name").val(calEvent.id);
            console.log(calEvent.id);

            $('#dialog').dialog('open');
            
             if(calEvent.url){
              return false;
            }
            

    
            
            
            
        },
    select: function(start, end) {
      var user_name;
      user_name = prompt("User name: ");
      var eventData;
      //this validates that the user must insert a name in the input
      
        console.log(start.toDate)
        console.log(end.toDate)
        eventData = {
          title: "Reserved",
          start: start.format(),
          end: end.format(),
          user_name: user_name
        };
        
       
        
        console.log(eventData)
        //if everything it's ok, then the event is saved in database with ajax
        $.ajax({
          url: "events/create",
          type: "POST",
          data: eventData,
          dataType: 'json',
          success: function(json) {
            alert(json.msg);
             $("#calendar").fullCalendar("renderEvent", eventData, true); 
            $("#calendar").fullCalendar("refetchEvents");
          }
        });
        
        
      
      $("#calendar").fullCalendar("unselect");
    },  
    defaultView: 'agendaWeek',
    allDaySlot: false,
    height: 700,
    slotMinutes: 30,
    eventSources: [
      {
        url: '/events'
      }
    ],
    timeFormat: 'h:mm',
    dragOpacity: "0.5"
  });
  
  
  
   $('#prof_calendar').fullCalendar({
    editable: false,
    slotEventOverlap: true,
    columnFormat: {
      month: 'dddd',
      week: 'dddd',
      day: 'ddd'
    },
    buttonText: {
      today: 'Today',
      month: 'month',
      week: 'week',
      day: 'day'
    },
    minTime: "08:00:00",
    maxTime: "23:00:00",
    header: {
      left: '',
      center: "Course Schedule",
      right: ''
    },
    weekends: false, 
    defaultDate: moment('2016-04-11'),
    //this section is triggered when the event cell it's clicked
    selectable: false,
    selectHelper: true,
    editable: false, 
    eventClick: function (calEvent, jsEvent, view) {
           
             if(calEvent.url){
              return false;
            }
        },
    select: function(start, end) {
      var user_name;
      user_name = prompt("User name: ");
      var eventData;
      //this validates that the user must insert a name in the input
      
        console.log(start.toDate)
        console.log(end.toDate)
        eventData = {
          title: "Reserved",
          start: start.format(),
          end: end.format(),
          user_name: user_name
        };
        
       
        
        console.log(eventData)
        //if everything it's ok, then the event is saved in database with ajax
        $.ajax({
          url: "events/create",
          type: "POST",
          data: eventData,
          dataType: 'json',
          success: function(json) {
            alert(json.msg);
             $("#calendar").fullCalendar("renderEvent", eventData, true); 
            $("#calendar").fullCalendar("refetchEvents");
          }
        });
        
        
      
      $("#calendar").fullCalendar("unselect");
    },  
    defaultView: 'agendaWeek',
    allDaySlot: false,
    height: 700,
    slotMinutes: 30,
    eventSources: [
      {
        url: '/events'
      }
    ],
    timeFormat: 'h:mm',
    dragOpacity: "0.5"
  });
  
  
  
  
});
    
    
