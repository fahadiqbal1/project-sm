
$(document).on('turbolinks:load', function() {

    $("#user_phone_number,#confirmation_phone_number").intlTelInput({
        formatOnInit: true,
        separateDialCode: true,
        preferredCountries: ["us","gb","af","sy"]
    });
    
    $("#user_phone_number,#confirmation_phone_number").on("countrychange", function(e, countryData) {
      $("#user_phone_dial_code,#confirmation_phone_dial_code").val(countryData.dialCode)
    });

});