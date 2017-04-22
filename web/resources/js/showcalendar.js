
        $(document).ready(function() {
            

    var date = new Date(),
             d = date.getDate(),
            m = date.getMonth(),
            y = date.getFullYear(),
            started,
            categoryClass;

     var calendar = $('#calendar').fullCalendar({
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          },
          selectable: true,
         height: 500,
          selectHelper: true,
          select: function(start, end, allDay) {
            $('#fc_create').click();

            started = start;
            ended = end;

            $(".antosubmit").on("click", function() {
              var title = $("#title").val();
              if (end) {
                ended = end;
              }

              categoryClass = $("#event_type").val();

              if (title) {
                calendar.fullCalendar('renderEvent', {
                    title: title,
                    start: started,
                    end: end,
                    allDay: allDay
                  },
                  true // make the event "stick"
                );
              }

              $('#title').val('');

              calendar.fullCalendar('unselect');

              $('.antoclose').click();

              return false;
            });
          },
          eventClick: function(calEvent, jsEvent, view) {
            $('#fc_edit').click();
            $('#title2').val(calEvent.title);

            categoryClass = $("#event_type").val();

            $(".antosubmit2").on("click", function() {
              calEvent.title = $("#title2").val();

              calendar.fullCalendar('updateEvent', calEvent);
              $('.antoclose2').click();
            });

            calendar.fullCalendar('unselect');
          },
          editable: true,
          events: [{
            title: 'Repara Vehiculo (4x)',
            start: new Date(y, m, 1)
          }, {
            title: 'Repara Vehiculo (5)',
            start: new Date(y, m, d - 5),
            end: new Date(y, m, d - 2)
          }, {
            title: 'Repara Vehiculo (3)',
            start: new Date(y, m, d, 10, 30),
            allDay: false
          }, {
            title: 'Repara Vehiculo (1)',
            start: new Date(y, m, d + 14, 12, 0),
            end: new Date(y, m, d, 14, 0),
            allDay: false
          }, {
            title: 'Reparar Nuevo vehiculo (2)',
            start: new Date(y, m, d + 1, 19, 0),
            end: new Date(y, m, d + 1, 22, 30),
            allDay: false
          }, {
            title: 'Ir a Google',
            start: new Date(y, m, 28),
            end: new Date(y, m, 29),
            url: 'http://google.com/'
          }]
        });
      });
     
   
/*editable: true,
weekMode: 'liquid',
url:'#',

aspectRatio: 3,
theme: true,
header: {
left: 'prev,next today',
center: 'title',
right: 'month,agendaWeek,agendaDay'
},
editable: true,
disableDragging: true,
firstDay: 1,
weekends: true,
defaultEventMinutes:30,
monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio','Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
monthNameShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun','Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
dayNames: ['Domingo', 'Lunes', 'Martes', 'Miercoles','Jueves', 'Viernes', 'Sabado'],
dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
buttonText: {
today: 'hoy',
month: 'mes',
week: 'semana',
day: 'dia'},
allDaySlot: false,
allDayText: 'Todo el dia',
axisFormat: 'H:mm',
events: "json-events.php",
timeFormat: 'H:mm{ - H:mm}',
        listYear:'lista',
listMonth:'lista',
listWeek:'lista',
listDay:'list',

navLinks:'true',*/
        
        /*Eventps*/
   
        

    
 