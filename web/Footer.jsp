<script src="JS/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="JS/bootstrap.min.js" type="text/javascript"></script>
<script src="JS/semantic.min.js" type="text/javascript"></script>
<script src="JS/toastr.js" type="text/javascript"></script>
<script src="JS/datepicker.js" type="text/javascript"></script>
<script>
    $('.ui.sidebar').sidebar({
        context: $('.contentbody')
    }).sidebar('attach events', '.togglebar');
</script>
<script>
    $('.btnlogin').click(function() {
        $('.login').modal('show');
    });
    $('.btnsignup').click(function() {
        $('.signitup').modal('show');
    });

</script>
<script src="JS/custom.js" type="text/javascript"></script>