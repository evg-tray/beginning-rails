var show_seats_by_type = function () {
    $('.counts').hide();
    var type = $('#wagon_type').val();
    $('.' + type).show();
};
document.addEventListener("turbolinks:load", function() {
    $('#wagon_type').on('change', show_seats_by_type);
    show_seats_by_type();
});