package ag83;

import ag83.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class f0Servlet extends HttpSerlvet {

    public void doPost( HttpSerlvetRequest request,
			HttpSerlvetResponse response)
	throws IOEXception, ServletException {
	
	HttpSession session = request.getSession(true);
	String title = "Formel 0";
	String heading;
	if (session.isNew()) {
	    heading = "hey newbie ;)";
	}
	else
	{
	    heading = "wb!";
	}

	out.println(ServletUtilities.headWithTitle(title) + 
		    "<body>\n" + 
		    "<h1>" + heading + "</h1>" +
		    "</body></html>");
		    
		    

    }


}