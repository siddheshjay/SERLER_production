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

});
