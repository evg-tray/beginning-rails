$(document).ready(function(){
    $('a.edit_route, a.cancel').click(function(e){
        e.preventDefault();

        var route_id = $(this).data('routeId');
        var title = $('#title_route_' + route_id);
        var form = $('#edit_route_' + route_id);
        form.toggle();
        title.toggle();
    });
});