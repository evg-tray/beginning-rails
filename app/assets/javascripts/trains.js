document.addEventListener("turbolinks:load", function() {
    $('a.edit_train, a.cancel').click(function(e){
        e.preventDefault();

        var train_id = $(this).data('trainId');
        var title = $('#title_train_' + train_id);
        var form = $('#edit_train_' + train_id);
        form.toggle();
        title.toggle();
    });
});