package vntopica_itlab4;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/add")
public class AddServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2691172932068829020L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int id1 = Integer.parseInt(req.getParameter("id"));
		String name1 = req.getParameter("name");
		String birthDay1 = req.getParameter("birthDay");
		String gender1 = req.getParameter("gender");
		String dateIn1 = req.getParameter("dateIn");
		try {
			Action.insertSt(Action.infor, id1, name1, birthDay1, gender1, dateIn1);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
