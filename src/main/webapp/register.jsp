<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="de" xml:lang="de">
    <head>
        <title xml:lang="de">Formel 0 - Spielen</title>
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
        <link rel="stylesheet" type="text/css" href="styles/screen.css" />
        <script src="js/jquery.js" type="text/javascript"></script>
    </head>
    <body>
      <jsp:useBean id="gamebean" class="beans.GameBean" scope="session" />
      <jsp:setProperty name="gamebean" property="*" />
        <div id="container">
            <div id="bordercontainer">
                <div id="header">
                    <div id="header_left"><h1 class="accessibility">Formel 0</h1></div>
                    <div id="header_right"></div>
                </div>
                <div id="navigation">
                    <h2 class="accessibility">Navigation</h2>
                    <ul title="Navigation">
                        <li><a id="startNewGame" href="process.jsp?action=killsession" tabindex="1">Neues Spiel</a></li>
                        <li><a href="#" tabindex="2">Ausloggen</a></li>
                    </ul>
                </div>
                <div id="main-area">
                    <div class="info">
                        <h2>Spielinformationen</h2>
                        <table summary="Diese Tabelle zeigt Informationen zum aktuellen Spiel">
                            <tr><th id="leaderLabel" class="label">F&uuml;hrender</th><td id="leader" class="data"><%= gamebean.getLeader() %></td></tr>
                            <tr><th id="roundLabel" class="label">Runde</th><td id="round" class="data"><%= gamebean.getRound() %></td></tr>
                            <tr><th id="timeLabel" class="label">Zeit</th><td id="time" class="data"><%= gamebean.getTime_h() %></td></tr>
                            <tr><th id="computerScoreLabel" class="label">W&uuml;rfelergebnis <em><%= gamebean.getAi() %></em></th><td id="computerScore" class="data"><%= gamebean.getAi_die() %></td></tr>
                        </table>  
                        <h2>Spieler</h2>
                        <table summary="Diese Tabelle listet die Namen der Spieler auf">
                            <tr><th id="player1NameLabel" class="label">Spieler 1</th><td id="player1Name" class="data"><%= gamebean.getPlayer() %></td></tr>
                            <tr><th id="player2NameLabel" class="label">Spieler 2</th><td id="player2Name" class="data"><%= gamebean.getAi() %></td></tr>
                        </table>    	  
                        <h2>GameBean</h2>
                        <table>
                            <tr><th class="label">Player Pos</th><td class="data"><%= gamebean.getPlayer_pos() %></td></tr>
                            <tr><th class="label">Die</th><td class="data"><%= gamebean.getPlayer_die() %></td></tr>
			    <tr><th class="label">role die</th><td class="data"><a href="#" id="die">role..</a></td></tr>
			    <tr><th class="label">kill session</th><td class="data"><a href="process.jsp?action=killsession" id="die">now</a></td></tr>
			    <tr><th class="label">load car</th><td class="data"><a href="#" id="load">now</a></td></tr>
                        </table>    	  
                    </div>
                    <div class="field">
                        <h2 class="accessibility">Spielbereich</h2>
                        <ol id="road">
                            <li id="start_road">
                                <span class="accessibility">Startfeld</span>
                            </li>
                            <li class="empty_road" id="road_1">
                                <span class="accessibility">Feld 2</span>
                            </li>
                            <li class="oil_road" id="road_2">
                                <span class="accessibility">Feld 3</span>
                            </li>
                            <li class="empty_road" id="road_3">
                                <span class="accessibility">Feld 4</span>
                            </li>
                            <li class="empty_road" id="road_4">
                                <span class="accessibility">Feld 5</span>
                            </li>
                            <li class="oil_road" id="road_5">
                                <span class="accessibility">Feld 6</span>
                            </li>
                            <li id="finish_road">
                                <span class="accessibility">Zielfeld</span>
                            </li>
                        </ol>
                    </div>
                    <div class="player">
                        <h2 class="accessibility">W&uuml;rfelbereich</h2>
                        <span class="accessibility">An der Reihe ist</span><div id="currentPlayerName"><%= gamebean.getActive() %></div>
                        <a id="dice" href="process.jsp?action=die" tabindex="4">
                            <img id="diceImage" src="img/wuerfel<%= gamebean.getPlayer_die() %>.png" alt="W&uuml;rfel mit einer Eins" />	
                        </a>
                    </div>
                </div>
            </div>
            <div id="footer">
                &copy; 2013 Formel 0
            </div>
        </div>

        <script type="text/javascript">
            //<![CDATA[
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

function get_pos(driver, round) {
    var pos = 0;
    if ( driver == "player" )
    {
        if ( round == "cur")
           pos = <%= gamebean.getPlayer_pos() %>;
        else if ( round == "old" )
           pos = <%= gamebean.getPlayer_pos_old() %>;
    }
    else if ( driver == "ai" )
    {
        if ( round == "cur")
           pos = <%= gamebean.getAi_pos() %>;
        else if ( round == "old" )
           pos = <%= gamebean.getAi_pos_old() %>;
    }
    else
    {
        pos = -1;
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

function animate(input) {
    var car;
    var driver;
    if (input == "player") {
       car = "#player1";
       driver = "player";
    }
    else if (input == "ai") {
       car = "#player2";
       driver = "ai";
    }    

    prepareAnimation();
    $(car).fadeOut(700, function() {
	var pos1 = get_pos(driver, "cur");
	$(car).appendTo(pos1);
	$(car).fadeIn(700,completeAnimation);                    
    });
    return false;
}

$(document).ready(function() {
    var pos1 = get_pos("player", "cur");
    var pos2 = get_pos("ai", "cur");
    var pos1_old = get_pos("player", "old");
    var pos2_old= get_pos("ai", "old");
    var player = '<span id="player1"><span class="accessibility"><em>Spieler 1</em></span></span>';
    var ai = '<span id="player2"><span class="accessibility"><em>Spieler 2</em></span></span>';
    $(player).appendTo(pos1_old);
    $(ai).appendTo(pos2_old);
    animate("player");
    var wait = setInterval(function() {
       if ($("#player1:not(animated)")) {
             clearInterval(wait);
             animate("ai");
            }
       }, 2000);
});

$('#load').click(function() {
    var pos1 = get_pos("player");
    var player = '<span id="player1"><span class="accessibility"><em>Spieler 1</em></span></span>';
    $(player).appendTo(pos1);
});

          //]]>
        </script>

    </body>
</html>
