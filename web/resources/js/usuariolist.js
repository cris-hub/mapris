  $(function () {

            $('body').on('click', '.list-group .list-group-item', function () {
                $(this).toggleClass('active');
            });
            $('.list-arrows button').click(function () {
                var $button = $(this), actives = '';
                if ($button.hasClass('move-left')) {
                    actives = $('.list-right ul li.active');
                    actives.clone().appendTo('.list-left ul');
                    actives.remove();
                } else if ($button.hasClass('move-right')) {
                    actives = $('.list-left ul li.active');
                    actives.clone().appendTo('.list-right ul');
                    actives.remove();
                }
            });
            $('.dual-list .selector').click(function () {
                var $checkBox = $(this);
                if (!$checkBox.hasClass('selected')) {
                    $checkBox.addClass('selected').closest('.well').find('ul li:not(.active)').addClass('active');
                    $checkBox.children('i').removeClass('glyphicon-unchecked').addClass('glyphicon-check');
                } else {
                    $checkBox.removeClass('selected').closest('.well').find('ul li.active').removeClass('active');
                    $checkBox.children('i').removeClass('glyphicon-check').addClass('glyphicon-unchecked');
                }
            });
            $('[name="SearchDualList"]').keyup(function (e) {
                var code = e.keyCode || e.which;
                if (code == '9') return;
                if (code == '27') $(this).val(null);
                var $rows = $(this).closest('.dual-list').find('.list-group li');
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });

        });

/*Calendario*/
$(function () {
	$('[data-toggle="calendar"] > .row > .calendar-day > .events > .event').popover({
		container: 'body',
		content: 'Hello World',
		html: true,
		placement: 'bottom',
		template: '<div class="popover calendar-event-popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
	});

	$('[data-toggle="calendar"] > .row > .calendar-day > .events > .event').on('show.bs.popover', function () {
		var attending = parseInt($(this).find('div.progress>.progress-bar').attr('aria-valuenow')),
			total = parseInt($(this).find('div.progress>.progress-bar').attr('aria-valuemax')),
			remaining = total - attending,
			displayAttending = attending - $(this).find('div.attending').children().length,
			html = [
				'<button type="button" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>',
				'<h4>'+$(this).find('h4').text()+'</h4>',
				'<div class="desc">'+$(this).find('div.desc').html()+'</div>',
				'<div class="location">'+$(this).find('div.location').html()+'</div>',
				'<div class="datetime">'+$(this).find('div.datetime').html()+'</div>',
				'<div class="space"><span class="pull-right"></span></div>',
				'<div class="attending">',
					$(this).find('div.attending').html(),
	
				'</div>',
				
			].join('\n');

		$(this).attr('title', $(this).find('h4').text());
		$(this).attr('data-content', html);
	});

	$('[data-toggle="calendar"] > .row > .calendar-day > .events > .event').on('shown.bs.popover', function () {
		var $popup = $(this);
		$('.popover:last-child').find('.close').on('click', function(event) {
			$popup.popover('hide');
		});
	});
});
/*Calendario*/