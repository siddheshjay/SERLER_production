/**
 * Created by chandler on 2016. 9. 10..
 */


$(document).on('nested:fieldAdded', function(event){
    // this field was just inserted into your form
    var field = event.field;
});

$(document).on('nested:fieldRemoved', function(event){
    // this field was just inserted into your form
    var field = event.field;
    // it's a jQuery object already! Now you can find date input
    event.target.remove();

});

// A $( document ).ready() block.
$( document ).ready(function() {

    var datetime_mode = {
        viewMode: 'days',
        format: 'YYYY-MM-DD'
    };

    $('#fromdate').datetimepicker(datetime_mode);
    $('#todate').datetimepicker(datetime_mode);


});

function validateForm() {
    var ret_val = true;

    var search_option_list = $(".search_field_option");
    var search_operation_list = $(".search_operation");

    for ( i = 0; i < search_option_list.length; i++) {
        var search_option_val = $(search_option_list[i]).val();
        var search_operation_val = $(search_operation_list[i]).val();
        if("credibility_rate"== search_option_val) {
            if( "ILIKE" == search_operation_val || "NOT ILIKE" == search_operation_val ) {
                ret_val = false;
                break;
            }
        }
    }
    return ret_val;
}