var minimumDateTime = moment();
var currentHour = moment().hour();
var currentMinutes = moment().minutes();

var tempHour;
var tempMinHour;

var tempMin;
var tempMax;



if( currentMinutes <= 30 ) {
    currentMinutes = 0;
    currentHour += 1;
} else {    
    currentMinutes = 0;
    currentHour += 2;
}


minimumDateTime = moment().hour(currentHour);
minimumDateTime = moment(minimumDateTime).minutes(currentMinutes);




$(function () {
    $('#startdate').datetimepicker({
        minDate: minimumDateTime,
        stepping: 60
    });


    $('#enddate').datetimepicker({
        useCurrent: false,            
        minDate: moment(minimumDateTime).hour(currentHour+1),
        maxDate: moment(minimumDateTime).hour(23),
        stepping: 60            
    });

    

    $("#startdate").on("dp.change", function (e) {
        if( !e.date  ) {
            $('#enddate').data("DateTimePicker").clear();
            $('#enddate').data("DateTimePicker").disable();
        } else {
            if( e.date.hour() == 23 ) {
                tempHour = 24;
            } else {
                tempHour = 23;
            }
            tempMinHour = e.date.hour() + 1;

            tempMin = moment(e.date).hour(tempMinHour);
            tempMin = moment(tempMin).minutes(0);

            tempMax = moment(e.date).hour(tempHour);
            tempMax = moment(tempMax).minutes(0);

            $('#enddate').data("DateTimePicker").clear();
            $('#enddate').data("DateTimePicker").minDate(moment("2017-01-01"));
            $('#enddate').data("DateTimePicker").maxDate(moment("2150-01-01"));
            $('#enddate').data("DateTimePicker").minDate(tempMin);
            $('#enddate').data("DateTimePicker").maxDate(tempMax);                
            $('#enddate').data("DateTimePicker").date(tempMin);                
            $('#enddate').data("DateTimePicker").enable();   
            return;             
        }
        return;
    });


});