package formel0;

import formel0.*;
import beans.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.net.*;

public class f0Servlet extends HttpServlet {

    private UUID id = UUID.randomUUID();
    private static int i = 0;
    private Calendar cal = Calendar.getInstance();
    
    public void doGet( HttpServletRequest request,
			HttpServletResponse response)
	throws IOException, ServletException {
	

	// set up writer and session
	PrintWriter out = response.getWriter();
	HttpSession session = request.getSession(true);

	// check parameter
	String action = request.getParameter("action");
	out.println(action);

	// get or create gamebean
	GameBean gamebean = (GameBean) request.getSession().getAttribute("gamebean");
	if(gamebean == null)
	{
	    gamebean = new GameBean();
	    gamebean.setPlayer_die(0);
	    gamebean.setPlayer_pos(0);
	    gamebean.setAi_pos(0);
	    session.setAttribute("gamebean", gamebean);
	}
	Random rand = new Random();


	gamebean.setTime(System.currentTimeMillis() - session.getCreationTime());
	if (action != null && action.equals("die"))
	{
	    if(gamebean.getWinner() == 0) {
		//request.setAttribute("action", null);
		int die1 = rand.nextInt(3) + 1;
		int die2 = rand.nextInt(3) + 1;
		gamebean.setPlayer_die(die1);
		int player_pos_old = gamebean.getPlayer_pos();
		gamebean.setPlayer_pos_old(player_pos_old);
		int player_pos =  player_pos_old + die1;
		gamebean.setPlayer_pos(player_pos);
		
		if (player_pos >= gamebean.getRoad_len()) {
		    gamebean.setWinner(1);
		}
		else {
		    gamebean.setAi_die(die2);
		    int ai_pos_old = gamebean.getAi_pos();
		    gamebean.setAi_pos_old(ai_pos_old);
		    int ai_pos = ai_pos_old + die2;
		    gamebean.setAi_pos(ai_pos);
		    gamebean.setRound(gamebean.getRound() + 1);
		    if (ai_pos >= gamebean.getRoad_len()){
			gamebean.setWinner(2);
		    }
		}
	    }
	    /*	    RequestDispatcher dispatcher = 
		getServletContext().getRequestDispatcher("/process.jsp");
		dispatcher.forward(request, response);*/
	    response.sendRedirect("register.jsp");
	    return;
	}
	else if (action != null && action.equals("killsession"))
	{
	    session.invalidate();
	    response.sendRedirect("register.jsp");
	}
	else
	{
	    out.println("no params set\n");
	    response.sendRedirect("register.jsp");
	}

/*
	String title = "Formel 0";
	String heading;
	if (session.isNew()) {
	    heading = "hey newbie ;)";
	    id = UUID.randomUUID();
	    session.setAttribute("id", id.toString());
	}
	else
	{
	    heading = "wb!";
	}

	
	out.println("<head><title>" + title +
		    "</title></head>" +
		    "<body>\n" + 
		    "<h1>" + heading + "</h1>" +
		    "<p>id is " + id + "</p>");
	
	for(String cur: Collections.list(session.getAttributeNames()))
	    out.println(cur);

	out.println("</body></html>");
		    
	response.sendRedirect("index.jsp");*/
    }


}