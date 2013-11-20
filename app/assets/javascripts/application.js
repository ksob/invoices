// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.validate
//= require bootstrap
//= require turbolinks
//= require_tree .

jQuery(document).on("ready page:change", function() { 
	$.validator.addMethod(
        "regex",
        function (value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "Please check your input."
    );

	$('#new_invoice, .edit_invoice').validate({
	     rules: {
	         "invoice[invoice_number]": {
	             required: true,
	             number: false,
	             regex: /^\d\d\d\d\/\d\d\/\d\d\/[A-Z]{2}\/[a-z]{3}\d$/
	         }
	     },
	     messages: {
	         "invoice[invoice_number]": {
	             required: "This field is required!",
	             regex: "The format should be: yyyy/mm/dd/XX/xxxd  (for example: 2013/11/19/CA/wrh7)"
	         },
	     },  

	     showErrors: function (errorMap, errorList) {

	         $.each(this.successList, function (index, value) {
	             $('#'+value.id+'').popover('destroy');
	         });


	         $.each(errorList, function (index, value) {

	             $('#'+value.element.id+'').attr('data-content',value.message).popover({
	                 placement: 'top',
	                 trigger: 'manual'
	             }).popover('show');

	         });

	     }

	});

})



