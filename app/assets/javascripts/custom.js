document.addEventListener("turbolinks:load", function() {
  $(document).ready(function() {
    $('.sidebar-dropdown > a').click(function(e) {
      e.stopPropagation()
      $(".sidebar-submenu").slideUp(500);
      // console.log($(this).parent());
      if ($(this).parent().hasClass("active")) {
        $(".sidebar-dropdown").removeClass("active");
        $(this).parent().removeClass("active");
      } else {
        $(".sidebar-dropdown").removeClass("active");
        $(this).next(".sidebar-submenu").slideDown(500);
        $(this).parent().addClass("active");
      }
    });

    $("#close-sidebar").click(function() {
      $(".page-wrapper").removeClass("toggled");
    });

    $("#show-sidebar").click(function() {
      $(".page-wrapper").addClass("toggled");
    });

    $(".monthPicker").datepicker({
        dateFormat: 'MM yy',
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,

        onClose: function(dateText, inst) {
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).val($.datepicker.formatDate('MM yy', new Date(year, month, 1)));
        }
    });

    $(".monthPicker").focus(function () {
        $(".ui-datepicker-calendar").hide();
        $("#ui-datepicker-div").position({
            my: "center top",
            at: "center bottom",
            of: $(this)
        });
    });
  });
});
