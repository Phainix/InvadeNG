$(document).ready(function() {
    var setUpAddressControls = function(value, container) {
        if(value == 'nigeria') {
            $(container+' #address-country-input').remove();
            $(container+' #address-country-container').after('<input type="hidden" name="country" value="nigeria" id="address-country-input">');

            $(container+' #address-state-input').remove();
            $(container+' #address-country-input').after('<div class="input-group flex47-5 flex100sm d-flex flex-column marg-t-0" id="address-state-input"> <label for="state">State</label> <select name="state" class="form-input"> <option default value="">Select state</option> <option value="lagos">Lagos</option> <option value="others">Others</option> </select></div>');

        } else {
            $(container+' #address-country-input').remove();
            $(container+' #address-country-container').after('<div class="input-group flex47-5 flex100sm d-flex flex-column marg-t-0" id="address-country-input"> <label for="country">Other Country</label> <input type="text" name="country" id="country" class="form-input" placeholder="Country" /> </div>');

            $(container+' #address-state-input').remove();
            $(container+' #address-country-input').after('<div class="input-group flex47-5 flex100sm d-flex flex-column marg-t-0" id="address-state-input"> <label for="state">State</label> <input name="state" class="form-input" placeholder="State"></div>');
        }
    }

    $('form').on('click', '.form-input.input-error', function() {
        var name = $(this).attr('name');
        $('#'+name+'-error').remove();
        $(this).removeClass('input-error');
    });
    var validate = function(form, item, data) {
        var valid = true;
        if($(form+' .form-input[name="'+item.name+'"]').hasClass('input-error')) return false;
        for(var i = 0; i < data.rules.length; i++) {
            var rule = data.rules[i];
            var message = '';
            if(rule == 'required') {
                if(item.value == '' || item.value == null) {
                    message = "can't be blank";
                    valid = false;
                }
            }
            if(rule == 'email') {
                var atposition = item.value.indexOf("@");  
                var dotposition = item.value.lastIndexOf(".");
                if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= item.value.length){  
                    message = "is invalid, please enter a valid e-mail address";
                    valid = false;
                }  
                if(item.value == '' || item.value == null) {
                    message = "can't be blank";
                    valid = false;
                }
            }
            if(rule == 'length') {
                if(item.value.length != data.extra.length) {
                    message = "must have a length of " + data.extra.length + " characters";
                    valid = false;
                }
            }
            if(rule == 'minlength') {
                if(item.value.length < data.extra.minlength) {
                    message = "must have a minimum length of " + data.extra.minlength + " characters";
                    valid = false;
                }
            }
            if(rule == 'maxlength') {
                if(item.value.length > data.extra.maxlength) {
                    message = "must have a maximum length of " + data.extra.maxlength + " characters";
                    valid = false;
                }
            }
            if(rule == 'digits') {
                var digitRGEX = /^\d+$/;;
                if(digitRGEX.test(item.value) == false) {
                    message = "must only contain digits";
                    valid = false;
                }
            }
            if(rule == 'digitsifpresent') {
                if(item.value.length > 0) {
                    var digitRGEX = /^\d+$/;;
                    if(digitRGEX.test(item.value) == false) {
                        message = "must only contain digits";
                        valid = false;
                    }
                }
            }
            if(rule == 'match') {
                if(item.value != data.extra.match.value) {
                    message = "does not match " + data.extra.match.name;
                    valid = false;
                }
            }
            if(valid == false) {
                $(form+' .form-input[name="'+item.name+'"]').addClass('input-error');
                $(form+' .form-input[name="'+item.name+'"]').after('<span class="error-message" id="'+item.name+'-error">'+data.name + ' ' + message + '</span>');
                break;
            }
        }
        return valid;
    };

    $('.register-form').submit(function(event) {
        var data = $(this).serializeArray();
        var validationData = {
            'register-name' : {
                rules: [
                    'required'
                ],
                name: 'Name'
            },
            'register-email' : {
                rules: [
                    'required',
                    'email'
                ],
                name: 'Email'
            },
            'register-number' : {
                rules: [
                    'required',
                    'digits',
                    'minlength'
                ],
                name: 'Phone Number',
                extra: {
                    minlength: 7
                }
            },
            'register-password' : {
                rules: [
                    'required',
                    'minlength'
                ],
                name: 'Password',
                extra: {
                    minlength: 6
                }
            }
        };
        var valid = true;
        for(var i = 0; i < data.length; i++) {
            var item = data[i];
            if(!(item.name in validationData)) continue;
            var itemvalid = validate('.register-form', item, validationData[item.name]);
            valid = valid && itemvalid;
        }
        if(valid == false) {
            event.preventDefault();
            return false;
        }
        return true;
    });

    $('.login-form').submit(function(event) {
        var data = $(this).serializeArray();
        var validationData = {
            'login-email' : {
                rules: [
                    'required',
                    'email'
                ],
                name: 'Email'
            },
            'login-password' : {
                rules: [
                    'required'
                ],
                name: 'Password'
            }
        };
        var valid = true;
        for(var i = 0; i < data.length; i++) {
            var item = data[i];
            if(!(item.name in validationData)) continue;
            var itemvalid = validate('.login-form', item, validationData[item.name]);
            valid = valid && itemvalid;
        }
        if(valid == false) {
            event.preventDefault();
            return false;
        }
        return true;
    });

    $('.measurement-form').submit(function(event) {
        var data = $(this).serializeArray();
        console.log(data);
        var valid = true;
        for(var i = 0; i < data.length; i++) {
            var item = data[i];
            var validationData = {
                rules: [
                    'digitsifpresent',
                ],
                name: item.name
            };
            if(!$('.measurement-form input[name="'+item.name+'"]').hasClass('measurement-input')) continue;
            var itemvalid = validate('.measurement-form', item, validationData);
            valid = valid && itemvalid;
        }
        if(valid == false) {
            event.preventDefault();
            return false;
        }
        return true;
    });

    $('.edit-details-form').submit(function(event) {
        var data = $(this).serializeArray();
        var validationData = {
            'edit-name' : {
                rules: [
                    'required'
                ],
                name: 'Name'
            },
            'edit-email' : {
                rules: [
                    'required',
                    'email'
                ],
                name: 'Email'
            },
            'edit-number' : {
                rules: [
                    'required',
                    'digits',
                    'minlength'
                ],
                name: 'Phone Number',
                extra: {
                    minlength: 7
                }
            }
        };
        var valid = true;
        for(var i = 0; i < data.length; i++) {
            var item = data[i];
            if(!(item.name in validationData)) continue;
            var itemvalid = validate('.edit-details-form', item, validationData[item.name]);
            valid = valid && itemvalid;
        }
        if(valid == false) {
            event.preventDefault();
            return false;
        }
        // event.preventDefault();
        // $.ajax({
        //     type: "POST",
        //     url: "/account/edit_details",
        //     cache:false,
        //     data: $(this).serialize(),
        //     success: function(response){
        //         response = JSON.parse(response);
        //         $('#js-alert').removeClass('hide');
        //         if(response.success) {
        //             $('#js-alert').text('Operation successful');
        //             $('#js-alert').addClass('success');
        //             setTimeout(function() {
        //                 window.location = '/account/dashboard';
        //             }, 3000);
        //         } else {
        //             $('#js-alert').text('Operation failed, please try again');
        //             $('#js-alert').addClass('danger');
        //         }
        //     },
        //     error: function(){
        //         // alert("Error");
        //     }
        // });
        return true;
    });

    $('.change-password-form').submit(function(event) {
        var data = $(this).serializeArray();
        var validationData = {
            'current-password' : {
                rules: [
                    'required'
                ],
                name: 'Current Password'
            },
            'new-password' : {
                rules: [
                    'required',
                    'minlength'
                ],
                name: 'New Password',
                extra: {
                    minlength: 7
                }
            },
            'confirm-password' : {
                rules: [
                    'required',
                    'minlength',
                    'match'
                ],
                name: 'Confirm Password',
                extra: {
                    minlength: 7,
                    match: {
                        name: 'New Password',
                        value: data[2].value
                    }
                }
            }
        };
        var valid = true;
        for(var i = 0; i < data.length; i++) {
            var item = data[i];
            if(!(item.name in validationData)) continue;
            var itemvalid = validate('.change-password-form', item, validationData[item.name]);
            valid = valid && itemvalid;
        }
        if(valid == false) {
            event.preventDefault();
            return false;
        }
        // event.preventDefault();
        // $.ajax({
        //     type: "POST",
        //     url: "/account/change_password",
        //     cache:false,
        //     data: $(this).serialize(),
        //     success: function(response){
        //         response = JSON.parse(response);
        //         $('#js-alert').removeClass('hide');
        //         if(response.success) {
        //             $('#js-alert').text('Operation successful');
        //             $('#js-alert').addClass('success');
        //             setTimeout(function() {
        //                 $('#js-alert').addClass('hide');
        //             }, 3000);
        //         } else {
        //             $('#js-alert').text('Operation failed, please try again');
        //             $('#js-alert').addClass('danger');
        //         }
        //     },
        //     error: function(){
        //         // alert("Error");
        //     }
        // });
        return true;
    });

    $('.address-form').submit(function(event) {
        var data = $(this).serializeArray();
        console.log(data);
        var valid = true;
        for(var i = 0; i < data.length; i++) {
            var item = data[i];
            var validationData = {
                rules: [
                    'required',
                ],
                name: 'Field'
            };
            if(!$('.address-form [name="'+item.name+'"]').hasClass('form-input')) continue;
            if(item.name == 'address-line2') continue;
            var itemvalid = validate('.address-form', item, validationData);
            valid = valid && itemvalid;
        }
        if(valid == false) {
            event.preventDefault();
            return false;
        }
        return true;
    });

    $('.address-form-edit').submit(function(event) {
        var data = $(this).serializeArray();
        console.log(data);
        var valid = true;
        for(var i = 0; i < data.length; i++) {
            var item = data[i];
            var validationData = {
                rules: [
                    'required',
                ],
                name: 'Field'
            };
            if(!$('.address-form-edit [name="'+item.name+'"]').hasClass('form-input')) continue;
            if(item.name == 'address-line2') continue;
            var itemvalid = validate('.address-form-edit', item, validationData);
            valid = valid && itemvalid;
        }
        if(valid == false) {
            event.preventDefault();
            return false;
        }
        return true;
    });

    $('.contact-form').submit(function(event) {
        var data = $(this).serializeArray();
        var validationData = {
            'contact-name' : {
                rules: [
                    'required'
                ],
                name: 'Name'
            },
            'contact-email' : {
                rules: [
                    'required',
                    'email'
                ],
                name: 'Email'
            },
            'contact-message' : {
                rules: [
                    'required'
                ],
                name: 'Message'
            }
        };
        var valid = true;
        for(var i = 0; i < data.length; i++) {
            var item = data[i];
            if(!(item.name in validationData)) continue;
            var itemvalid = validate('.contact-form', item, validationData[item.name]);
            valid = valid && itemvalid;
        }
        if(valid == false) {
            event.preventDefault();
            return false;
        }
        return true;
    });


    $('.address-modal .address-country').change(function(event) {
        var value = event.target.value;
        setUpAddressControls(value, '.address-modal');
    });

    $('.address-modal-edit .address-country').change(function(event) {
        var value = event.target.value;
        setUpAddressControls(value, '.address-modal-edit');
    });

    var setUpAddress = function (id) {
        var data = JSON.parse($('#address'+id).text());
        console.log(data);
        $('.address-modal-edit .form-input[name=address-fname]').val(data.fname);
        $('.address-modal-edit .form-input[name=address-lname]').val(data.lname);
        $('.address-modal-edit .form-input[name=address]').val(data.address);
        $('.address-modal-edit .form-input[name=address-line2]').val(data.address_line2);
        $('.address-modal-edit .form-input[name=address-city]').val(data.city);
        $('.address-modal-edit .form-input[name=address-number]').val(data.msisdn);
        $('.address-modal-edit .form-input[name=address-country]').val(data.country_type);

        setUpAddressControls(data.country_type, '.address-modal-edit');

        $('.address-modal-edit .form-input[name=country]').val(data.country);
        $('.address-modal-edit .form-input[name=state]').val(data.state);
        $('.address-modal-edit .form-input[name=address-postal]').val(data.postal_code);
        $('.address-modal-edit input[name=address-id]').val(data.id);
    };

    $('.address-edit').click(function () {
        var id = $(this).attr('data-id');
        setUpAddress(id);
    });

    $('#shipping-address').change(function () {
        var id = $(this).val();
        
        if(id != '' && id != null) {
            setUpAddress(id); 
            $('form.address-modal-edit.readonly .form-input').attr("disabled", true);
            $('#shipping-info-btn').attr("disabled", false);
            $('#shipping-info-btn').attr("href", "/cart/shipping");
        } else {
            setUpAddress(0); 
            $('form.address-modal-edit.readonly .form-input').attr("disabled", true);
            $('#shipping-info-btn').attr("disabled", true);
            $('#shipping-info-btn').attr("href", "javascript:void(0)");
            id = 0;
        }

        $.ajax({
            type: "GET",
            url: "/cart/shipping/set/"+id,
            cache:false,
            success: function(response){
                response = JSON.parse(response);
                if(!response.success) {
                    window.show_alert('Shipping address not set successfully', 'danger');
                    $('#shipping-info-btn').attr("disabled", true);
                    $('#shipping-info-btn').attr("href", "javascript:void(0)");
                } else {
                    $('#shipping-info-btn').attr("disabled", false);
                    $('#shipping-info-btn').attr("href", "/cart/shipping");
                }
            },
            error: function(){
                window.show_alert('Shipping address not set successfully', 'danger');
                $('#shipping-info-btn').attr("disabled", true);
                $('#shipping-info-btn').attr("href", "javascript:void(0)");
            }
        });
    });

    $('form.address-modal-edit.readonly .form-control').attr("disabled", true);

    $('input[name=shipping-method').change(function () {
        var price = $(this).val();
        $.ajax({
            type: "GET",
            url: "/cart/shipping/price/set/"+price,
            cache:false,
            success: function(response){
                response = JSON.parse(response);
                if(!response.success) {
                    window.show_alert('Shipping method not set successfully', 'danger');
                    $('#shipping-method-btn').attr("disabled", true);
                    $('#shipping-method-btn').attr("href", "javascript:void(0)");
                } else {
                    $('.cart-shipping-price').text('₦'+ (parseInt(response.cart.shipping_cost) +  parseInt(response.cart.express_charge)));
                    $('.cart-total-price').text('₦'+ (parseInt(response.cart.shipping_cost) +  parseInt(response.cart.total)));
                    $('#shipping-method-btn').attr("disabled", false);
                    $('#shipping-method-btn').attr("href", "/cart/payment");
                }
            },
            error: function(){
                window.show_alert('Shipping method not set successfully', 'danger');
                $('#shipping-method-btn').attr("disabled", true);
                $('#shipping-method-btn').attr("href", "javascript:void(0)");
            }
        });
    });
    var setBillingAddress = function (val) {
        $.ajax({
            type: "GET",
            url: "/cart/billing/set/"+val,
            cache:false,
            success: function(response){
                response = JSON.parse(response);
                if(!response.success) {
                    window.show_alert('Billing address not set successfully', 'danger');
                } else {
                    $('#payment-submit-btn').attr('billing-address', val);
                }
            },
            error: function(){
                window.show_alert('Billing address not set successfully', 'danger');
            }
        });
    };
    $('input[name=billing-address]').change(function() {
        var val = $(this).val();
        if(parseInt(val) > 0 ) {
            $('#billing-address').addClass('hide');
            setBillingAddress(val);
        } else {
            $('#billing-address').removeClass('hide');
            $('#payment-submit-btn').attr('billing-address', 0);
        }
    });
    $('select[name=billing-address]').change(function() {
        var val = $(this).val();
        setBillingAddress(val);
    });

    $('input[name=payment-method]').change(function() {
        var val = $(this).val();
        $.ajax({
            type: "GET",
            url: "/cart/payment/set/"+val,
            cache:false,
            success: function(response){
                response = JSON.parse(response);
                if(!response.success) {
                    window.show_alert('Payment method not set successfully', 'danger');
                } else {
                    $('#payment-submit-btn').attr('payment-method', val);
                    
                    $('.cart-payment-charge').text('₦'+response.cart.charge);
                    $('.cart-total-price').text('₦'+ (parseInt(response.cart.shipping_cost) +  parseInt(response.cart.total) +  parseInt(response.cart.charge)));
                }
            },
            error: function(){
                window.show_alert('Payment method not set successfully', 'danger');
            }
        });
    });

    $('#payment-submit-btn').click(function (event) {
        event.preventDefault();

        var method = $(this).attr('payment-method');
        var billing_address = $(this).attr('billing-address');

        if(method == '' || billing_address == 0) {
            window.show_alert('Select a billing address and payment method', 'danger');
            return;
        }

        var request_id = $(this).attr('payment-request-id');
        var order_ref = $(this).attr('payment-order-ref');

        if(request_id == '' || request_id == null || order_ref == '' || order_ref == null) {
            var self = this;
            $.ajax({
                type: "GET",
                url: "/cart/payment/process",
                cache:false,
                success: function(response){
                    response = JSON.parse(response);
                    if(!response.success) {
                        window.show_alert('Payment could not processed at this time, please try aiain later', 'danger');
                    } else {
                        $(self).attr('payment-request-id', response.request_id);
                        $(self).attr('payment-order-ref', response.order_ref);
                        $(self).attr('payment-email', response.email);
                        $(self).attr('payment-amount', response.amount);
                        window.payWithPaystack(response.request_id, response.order_ref, response.amount, response.email);
                    }
                },
                error: function(){
                    window.show_alert('Payment could not processed at this time, please try aiain later', 'danger');
                }
            });
        } else {
            var email = $(this).attr('payment-email');
            var amount = $(this).attr('payment-amount');
            window.payWithPaystack(request_id, order_ref, amount, email);
        }

    });

    $('input[name=express-shipping]').change(function() {
        var val = $(this).is(':checked') ? 1 : 0; 
        $.ajax({
            type: "GET",
            url: "/cart/shipping/express/"+val,
            cache:false,
            success: function(response){
                response = JSON.parse(response);
                if(!response.success) {
                    window.show_alert('Express shipping not set successfully', 'danger');
                } else {
                    $('.cart-total-price').text('₦'+ (parseInt(response.cart.shipping_cost) +  parseInt(response.cart.total) +  parseInt(response.cart.charge + parseInt(response.cart.express_charge))));
                    $('.cart-shipping-price').text('₦'+ (parseInt(response.cart.shipping_cost) +  parseInt(response.cart.express_charge)));
                }
            },
            error: function(){
                window.show_alert('Express shipping not set successfully', 'danger');
            }
        });
    });
});