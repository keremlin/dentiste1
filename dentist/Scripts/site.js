
var x=9;//time start
var y=15;//time end
z=(y-x)*6;
// function convert real date to date base on 6
function convertDate(dat)
{
    date=new Date(dat);
    var cal=(date.getHours()-x)*6;
    var round=Math.round(date.getMinutes()/10);
    cal=cal+round
    return cal; 
}
// change date of header to show
function changeDate (date, min) {
    var tmpDate = new Date(date);

    tmpDate.setMinutes(tmpDate.getMinutes() + min*10)
    var gh="";
    var gm=""
    
    if(tmpDate.getHours()<10)
        gh="0"+tmpDate.getHours();
    else
        gh=tmpDate.getHours();
    if(tmpDate.getMinutes()<10)
        gm="0"+tmpDate.getMinutes();
    else
        gm=tmpDate.getMinutes();
    
    return (gh+":"+gm);
};

// start of all script after load page completed
$(document).ready(function() {
//load by ajax daydate
//put date in arra
var ho=[];
$.getJSON("testData/daydate.json",function(json){
           
                for(var w=0;w<json.length;w++)
                {
                    ho.push(new Date(json[w].dayDate));
                }
                ho.push(new Date());
            });// end of get daydate
//show the calendar and load banned dates
$('#date1').MdPersianDateTimePicker({
            targetTextSelector: '#inputDate1',
            //targetDateSelector: '#inputDate1-1',
            dateFormat: 'yyyy-MM-dd',
            textFormat: 'yy-MM-dd',
            isGregorian: false,
            enableTimePicker: true,
            inLine: true,
            holiDays:ho,
            disabledDates:ho
        });// end of datepicker

// on change textbox of date the table of time will be 
//change by ajax
$('#inputDate1').on('change', function () {
    console.log($(this).val());
        // array of banned dates        
    var ho=new Array();
    $.getJSON("testData/times.json", function(json) {
    var tr;
    var tr2;
    
       

    tr2=$('<tr/>');
    tr = $('<tr/>');
    th = $('<tr/>');

    tr.append("<td style=\"background-color:#2184be\" data-dtime=\"unit01\" align=\"center\">"+  "یونیت1" +"</td>");
    tr2.append("<td style=\"background-color:#2184be\" data-dtime=\"unit02\" align=\"center\">"+  "یونیت2" +"</td>");
    th.append("<th>زمان</th>");
    
    var p=0;
    var flag=0;
    var temp1="-";
    sampleDate="2018-12-01T09:00:00";
    for (var i = 0; i < z; i++) {
        
      for(var b =0; b<json.length;b++)
        {
            if(convertDate(json[b])==i)
            {
                flag=1;
                break;
            }
        }
        if(flag==1)
        {
            
            temp1="<i class=\"fa fa-lock\" style=\"border: 0px;color:black;\"></i>";
        }
        else
        {
            temp1="<i class=\"fa fa-check\"  style=\"border: 0px;font-size:30px;\"></i>";
        }
        flag=0;
        
            tr.append("<td data-dtime=\"" + changeDate(sampleDate,i) + ":00\" align=\"center\">"+  temp1 +"</td>");
            tr2.append("<td data-dtime=\"" + changeDate(sampleDate,i) + ":00\" align=\"center\">"+  temp1 +"</td>");
            th.append("<th>"+changeDate(sampleDate,i)+"</th>");
        temp1="-";

    }
    // first remove all rows
    $("#ttable tr").remove();
    // then attach new rows and header of table
    $('#ttable').append(th);
    $('#ttable').append(tr);
    $('#ttable').append(tr2);
    
    
    
  });// end of json read 
    
});// end of on change testbox


/* Get all rows from your 'table' but not the first one
     * that includes headers. */
    var rows = $("#ttable").find("td");

    /* Create 'click' event handler for rows */
    //rows.on('click', function(e) {
    $("#ttable").delegate("td","click",function(e){
        /* Get current row */
        var row = $(this);
        var rowss = $("#ttable").find(".highlight");
        /* Check if 'Ctrl', 'cmd' or 'Shift' keyboard key was pressed
         * 'Ctrl' => is represented by 'e.ctrlKey' or 'e.metaKey'
         * 'Shift' => is represented by 'e.shiftKey' */
        if ((e.ctrlKey || e.metaKey) || e.shiftKey) {
            /* If pressed highlight the other row that was clicked */
            row.addClass('highlight');
        } else {
            /* Otherwise just highlight one row and clean others */
            rows.removeClass('highlight');
            rowss.removeClass('highlight');
            row.addClass('highlight');
            $("#ite").text("زمان مراجعه : "+row.data("dtime"));
            $("#iteUnit").text(" شماره یونیت : "+row.parent().parent().children().index(row.parent()));
            $("#iteDate").text(" تاریخ مراجعه : "+$("#inputDate1").val());
            
        }

    });//end of on click

    /* This 'event' is used just to avoid that the table text
     * gets selected (just for styling).
     * For example, when pressing 'Shift' keyboard key and clicking
     * (without this 'event') the text of the 'table' will be selected.
     * You can remove it if you want, I just tested this in
     * Chrome v30.0.1599.69 */
    $(document).bind('selectstart dragstart', function(e) {
        e.preventDefault(); return false;
    });// end of drag start
}); // end of doucument ready