package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.StoryBean;
import beans.UserBean;
import database.SQLcon;

/**
 * Servlet implementation class DeleteStoryController
 */
@WebServlet("/DeleteStoryController")
public class DeleteStoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Check if there is an user in session.
				if (request.getSession().getAttribute("user") != null) {

					// Get the session
					HttpSession session = request.getSession();

					// get the user data
					UserBean bean = (UserBean) session.getAttribute("user");
					// and clear it
					bean.resetUserBean();

					// remove the user
					session.removeAttribute("User");
					// turn off the session
					session.invalidate();
					// goto index
					response.sendRedirect("index.jsp");

				}else {
					// this should only happen if you try to goto "/Logout" manually 
								response.sendRedirect("index.jsp");
				}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hashTag = request.getParameter("hashTag");
			
			
		HttpSession session = request.getSession();
		UserBean userbean = (UserBean)session.getAttribute("user");
		
		SQLcon.deleteStoryFromSql(hashTag);
		
		StoryBean storyBean = new StoryBean(SQLcon.getStoryFromSql());

		
		request.setAttribute("user", userbean);
		request.setAttribute("storyBean", storyBean);
		
		RequestDispatcher rd = request.getRequestDispatcher("storyPage.jsp");
		rd.forward(request, response);
	}

}
