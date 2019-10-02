$(document).ready(function(){
    var show_alert = function(message, type) {
        $('#js-alert').removeClass('hide');
        $('#js-alert').text(message);
        $('#js-alert').addClass(type);
        setTimeout(function() {
            $('#js-alert').addClass('hide');
            $('#js-alert').text('');
            $('#js-alert').removeClass(type);
        }, 8000);
    };
    window.show_alert = show_alert;
    var process_cart = function(cart) {
        $('.cart-drop-down-item').remove();
        $('.cart-view-item.cart-display').remove();
        
        for (var index = 0; index < cart.items.length; index++) {
            var item = cart.items[index];
            $('.cart-drop-down-items').prepend('<div class="cart-drop-down-item"> <img class="product-img-thumbnail" src="' + item.design_picture + '" alt=""> <div class="product-desc"> <div>' + item.design_name + '</div> <div>' + item.material_name + '</div> <div>' + (parseInt(item.design_price) + parseInt(item.material_price)) + '</div> </div> <div class="product-actions"> <a href="javascript:void(0)" class="remove-from-cart" data-cart-id="' + index + '"><i class="fa fa-trash"></i></a> </div> </div> ');
            $('#cart-view-item-heading').after('<div class="cart-view-item cart-display"> <div class="cart-product"> <img class="cart-view-img" src="' + item.design_picture + '" alt=""> <div class="cart-view-desc"> <div><b>' + item.design_name + '</b></div> <div>Material: ' + item.material_name + '</div> <button class="btn fill sm remove-from-cart" data-cart-id="' + index + '">remove</button> </div> </div> <div class="cart-price">₦' + parseInt(item.design_price) + '</div> <div class="cart-material">₦' + parseInt(item.material_price) + '</div> <div class="cart-total">₦' + (parseInt(item.design_price) + parseInt(item.material_price)) + '</div> </div>');
    
        }
        $('.cart-size').text(cart.items.length);
        $('.cart-total').text(cart.total);
        if(cart.items.length == 0) {
            $('#cart-total-container').addClass('hide');
            $('#cart-checkout').addClass('hide');
            $('.cart-empty').removeClass('hide');
        } else {
            $('#cart-total-container').removeClass('hide');
            $('#cart-checkout').removeClass('hide');
            $('.cart-empty').addClass('hide');
        }
        
    };
    $("#search-toggle").click(function() {
        $(".action-search").toggleClass("show");
        $(this).toggleClass("show");
    });
    $('#sort').change(function(event) {
        window.location = window.location.pathname + $('#querySort').text() + 'sort='+event.target.value;
    })
    $('.add-to-cart').click(function() {
        var id = $(this).attr('data-product-id');
        var data = $('#product-desc-'+id).text();
        data = JSON.parse(data);
        
        $('#add-to-cart-material').text('No material selected');
        $('#add-to-cart-trigger').attr('data-design-id', id);
        $('#add-to-cart-trigger').attr('data-material-id', '');

        $('#add-to-cart-title').text(data.name);
        $('#add-to-cart-image').attr('src', data.picture);
        $('#add-to-cart-price').text(data.sale_price == 0 ? '₦' + data.price : '₦' + data.sale_price);
        $('#add-to-cart-old-price').text(data.sale_price == 0 ? '' : '₦' + data.price);
        $('#add-to-cart-discount').empty();
        data.sale_price != 0 ? $('#add-to-cart-discount').append('<span>- ' + (((data.price-data.sale_price)/data.price)*100) + ' %'+'</span>') : '';
        $('#add-to-cart-desc').text(data.description);
        $('#add-to-cart-category').text(data.category);
        var thumbnails = JSON.parse(data.other_pictures);
        $('#add-to-cart-thumbnail').empty();
        $('#add-to-cart-thumbnail').append('<img class="quickview-product-thumbnail" alt="Img Desc" src="'+data.picture+'"/>');
        for (var index = 0; index < thumbnails.length; index++) {
            var thumbnail = thumbnails[index];
            $('#add-to-cart-thumbnail').append('<img class="quickview-product-thumbnail" alt="Img Desc" src="'+thumbnail+'"/>');
        }
    });
    $('.quickview-product-thumbnails').on('click', '.quickview-product-thumbnail', function() {
        var src = $(this).attr('src');
        $('#add-to-cart-image').attr('src', src);
    });
    $('.material-item').click(function() {
        var id = $(this).attr('data-id');
        var name = $(this).attr('data-name');
        $('#add-to-cart-material').text(name);
        $('#add-to-cart-trigger').attr('data-material-id', id);
        $('#material').modal('hide');
    });
    $('#add-to-cart-trigger').click(function () {
        var design = $(this).attr('data-design-id');
        var material = $(this).attr('data-material-id');
        design = parseInt(design);
        material = parseInt(material);
        if(design < 1 || material < 1 || isNaN(design) || isNaN(material)) {
            show_alert('Please select material and design before adding to cart', 'danger');
            return;
        }
        $(this).attr('disabled', true);
        var self = this;
        $.ajax({
            type: "GET",
            url: "/cart/add/"+material+"/"+design,
            cache:false,
            success: function(response){
                response = JSON.parse(response);
                if(response.success) {
                    show_alert('Design successfully added to cart', 'success');
                    process_cart(response.cart);
                    $('#add-to-cart').modal('hide')
                } else {
                    show_alert('Design could not be added to cart', 'danger');
                }
                $(self).prop('disabled', false);
            },
            error: function(){
                show_alert('Design could not be added to cart', 'danger');
                $(self).prop('disabled', false);
            }
        });
    });
    $('.cart-list').on('click', '.remove-from-cart', function () {
        var id = $(this).attr('data-cart-id');
        $.ajax({
            type: "GET",
            url: "/cart/remove/"+id,
            cache:false,
            success: function(response){
                response = JSON.parse(response);
                if(response.success) {
                    show_alert('Item removed fron cart', 'success');
                    process_cart(response.cart);
                } else {
                    show_alert('Item could not be removed from cart', 'danger');
                }
            },
            error: function(){
                show_alert('Item could not be removed from cart', 'danger');
            }
        });
    });
    $('#cart-clear').click(function () {
        $.ajax({
            type: "GET",
            url: "/cart/clear",
            cache:false,
            success: function(response){
                response = JSON.parse(response);
                if(response.success) {
                    show_alert('Cart cleared successfully', 'success');
                    process_cart(response.cart);
                } else {
                    show_alert('Cart could not be cleared', 'danger');
                }
            },
            error: function(){
                show_alert('Cart could not be cleared', 'danger');
            }
        });
    });
}); 