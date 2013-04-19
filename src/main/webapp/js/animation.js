// call this function once before starting the animations
function prepareAnimation() {
    $("#animationDone").remove();
}

// call this function once after all animations have finished
function completeAnimation() {
    var div = $(document.createElement('div'));
    div.attr('id', 'animationDone');
    div.addClass('hide');
    $("body").append(div);
}

function get_pos(driver) {
    var pos = 0;
    if ( driver == "player" )
    {
        pos = "<%= gamebean.getPlayer_pos() %>";
    }
    else
    {
        pos = "<%= gamebean.getAi_pos() %>";
    }

    switch (pos) {
    case 0: 
	return "#start_road";
    case 1:
	return "#road_1";
    case 2:
	return "#road_2";
    case 3:
	return "#road_3";
    case 4:
	return "#road_4";
    case 5:
	return "#road_5";
    case 6:
	return "#finish_road";
    }
}

$("#die").click(function() {
    prepareAnimation();
    $("#player1").fadeOut(700, function() {
	var pos1 = get_pos("player");
	$("#player1").appendTo(pos1);
	$("#player1").fadeIn(700,completeAnimation);                    
    });
    return false;
});

$('#road').load(function() {
    var pos1 = get_pos("player");
    var player = '<span id="player1"><span class="accessibility"><em>Spieler 1</em></span></span>';
    $(player).appendTo(pos1);
});


