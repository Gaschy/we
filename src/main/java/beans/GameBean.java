package beans;

import java.io.*;
import java.util.*;

public class GameBean implements Serializable {

    private String player = "Trick0ry Rider";
    private String ai = "Lawrd of Fail";

    private Integer player_pos = 0;
    private Integer ai_pos = 0;

    private Integer player_pos_old = 0;
    private Integer ai_pos_old = 0;

    private Integer player_die = 0;
    private Integer ai_die = 0;
    private Integer round = 0;
    private Integer leader = 0;
    private Integer active = 1;
    private String session_id = "0";;
    private Integer road_len = 6;
    private Integer winner = 0;
    private long time = 0;
    private String time_h = "00:00";
    private ArrayList<Integer> oil_fields = new ArrayList<Integer>(Arrays.asList(2,5));

    public void setPlayer( String value )
	{
	    player = value;
	}

    public void setAi( String value )
	{
	    ai = value;
	}
    public void setPlayer_pos( Integer value )
	{
	    if (value < road_len)
		player_pos = value;
	    else
		player_pos = road_len;
	}
    public void setAi_pos( Integer value )
	{
	    if (value < road_len)
		ai_pos = value;
	    else
		ai_pos = road_len;
	}
    public void setPlayer_pos_old( Integer value )
	{
	    if (value < road_len)
		player_pos_old = value;
	    else
		player_pos_old = road_len;
	}
    public void setAi_pos_old( Integer value )
	{
	    if (value < road_len)
		ai_pos_old = value;
	    else
		ai_pos_old = road_len;
	}
    public void setPlayer_die( Integer value )
	{
	    player_die = value;
	}

    public void setAi_die( Integer value )
	{
	    ai_die = value;
	}

    public void setRound( Integer value )
	{
	    round = value;
	}
    public void setActive( String value )
	{
	    if (value.equals("switch")) {
		if (active == 1)
		    active = 2;
		else if (active == 2)
		    active = 1;
	    }
	    else 
		active = 0;
	}
    public void setLeader( Integer value )
	{
	    leader = value;
	}

    public void setWinner( Integer value )
	{
	    winner = value;
	}

    public void setSession_id( String value )
	{
	    session_id = value;
	}

    public void setRoad_len( Integer value )
	{
	    road_len = value;
	}

    public void setOil_fields( ArrayList<Integer> value )
	{
	    oil_fields = value;
	}

    public void setTime( long value )
	{
	    time = value;
	    Integer minutes = (int) ((time / (1000*60)) % 60);
	    Integer secs = (int) (time / 1000) % 60;
	    //time_h = minutes.toString() + ":" + secs.toString();
	    
	    time_h = String.format("%2d:%2d", minutes, secs).replace(' ','0');;
	}

    public String getPlayer() { return player; }
    public String getAi() { return ai; }
    public Integer getPlayer_pos() { return player_pos; }
    public Integer getAi_pos() { return ai_pos; }
    public Integer getPlayer_pos_old() { return player_pos_old; }
    public Integer getAi_pos_old() { return ai_pos_old; }
    public Integer getRound() { return round; }
    public Integer getPlayer_die() { return player_die; }
    public Integer getAi_die() { return ai_die; }
    public String getSession_id() { return session_id; }
    public Integer getRoad_len() { return road_len; }
    public Integer getWinner() { return winner; }
    public long getTime() { return time; }
    public String getTime_h() { return time_h; }
    public ArrayList<Integer> getOil_fields() { return oil_fields; }

    public String getActive() { 
	if (active == 1)
	    return player; 
	else if (active == 2)
	    return ai;
	else
	    return "error in active player";
    }


    public String getLeader() { 
	if (player_pos > ai_pos)
	    leader = 1;
	else if (ai_pos > player_pos)
	    leader = 2;
	else
	    leader = 0;

	if (leader == 0)
	    return "nip and tuck";
	else if (leader == 1)
	    return player;
	else if (leader == 2)
	    return ai;
	else
	    return "error in leader position";
    }
}
