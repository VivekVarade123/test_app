function attach_on_add(){
                var $total = 0;
                $('.product').each(function(){
                    var quantity = parseInt($(this).find($('.quantity')).val()||0);
                    var price = parseInt($(this).find($('.product_price')).val()||0);

                    sub_total = quantity * price;
                    $total = $total + sub_total;
                    $(this).find($('.sub-total')).html(sub_total);
                });
                $('.amount_field').val($total);
                $('.remove_nested_fields').on("click",function(){$(this).parent().parent().parent().remove();attach_on_add()});

}

function fetch_price(){
        var current_select = $(this);
        $.ajax({
            url: '/products/'+current_select.val()+'.json',
            success: function(data,textStatus,xhr){
                current_select.parent().find('.product_price').val(data.min_cost);
            }
        })
}

$(document).ready(function() {
    $('.datetime_select').datetimepicker({
        dateFormat: 'yy-mm-dd',
    timeFormat: 'hh:mm tt z'
    });

    $('#transaction_contact_id').chosen();

    $('.search-c').searchbox({
        url: '/lead_search.html',
        param: 'q',
        dom_id: '#search-data',
        delay: 100,
    });

    $('.contact_type').change(function() {
        if ($('.contact_type').val() == 1)
    {
        $('.existing_contact').fadeIn('hide').removeClass('hide');
        $('.new_contact').fadeOut('hide').addClass('hide');
        $fields = $('.contact_fields').clone();
        $('.contact_fields').remove();
    }
        else
        if ($('.contact_type').val() == 2)
    {
        if($('.contact_fields').length == 0)
    {
        $('.contact').append($fields);
        $('.existing_contact').fadeOut('hide').addClass('hide');
        $('.new_contact').fadeIn('hide').removeClass('hide');
    }
        else
    {
        $('.existing_contact').fadeOut('hide').addClass('hide');
        $('.new_contact').fadeIn('hide').removeClass('hide');
    }
    }
    });

    $('#transaction_transaction_type').change(function() {
        if($('#transaction_transaction_type').val() == "Cheque")
    {
        $('.micr_code').fadeIn();
    }
    if($('#transaction_transaction_type').val() == "Cash")
    {
        $('.micr_code').fadeOut();
    }
    });

    //------------------------------------------Transaction total script

    $('.amount_field').focus(function(){attach_on_add()});
    $('.quantity').focus(function(){attach_on_add()});
    $('.product_price').focus(function(){attach_on_add()});
    $('.remove_nested_fields').on("click",function(){$(this).parent().parent().parent().remove();attach_on_add()});
    $('select').change(fetch_price);

    $('.add').on("click",function(){
        setTimeout(function(){$('.quantity').focus(function(){attach_on_add()})},300);
        setTimeout(function(){$('.product_price').focus(function(){attach_on_add()})},300);
        setTimeout(function(){$('select').change(fetch_price)},300);
    })
});
