
 
    var ready = function(){
         $('#calendar').fullCalendar({
            defaultView: 'agendaWeek',
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            slotDuration: '00:05:00',
            businessHours:
            {
                start: '8:00', // a start time (10am in this example)
                end: '20:00', // an end time (6pm in this example)

                dow: [ 1, 2, 3, 4, 5 ]
                // days of week. an array of zero-based day of week integers (0=Sunday)
                // (Monday-Thursday in this example)
            },
            weekdays:true,
            weekends:false,
            minTime: "08:00:00",
            maxTime: "21:00:00",
            events: [
            {
                 title  : 'CSCE470 HRBB 124',
                 start  : '2016-04-13T08:00:00',
                 end    : '2016-04-13T08:50:00'
            },
            {
                 title: 'CSCE 431 HRBB 113',
                 start : '2016-04-13T08:00:00',
                 end   : '2016-04-13T08:50:00'
                
            },
            {
                 title: '<%= @course %>',
                 start : '<%= @start %>',
                 end   : '<%= @end %>'
                
            },
            
            
            ],
        });
    }
    
    $(document).on("page:load ready", ready);
    
    
