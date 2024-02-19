package controller;

import entities.Person;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import util.JPAUtil;


/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String op = request.getParameter("op");
                Query q = null;
                List people = null;
                List movies = null;
		
		// Singleton
		EntityManager em = (EntityManager) session.getAttribute("em");
		if (em==null) {
                    // Create the EntityManager
                        em = JPAUtil.getEntityManagerFactory().createEntityManager();
			session.setAttribute("em", em);
		}
		
		switch (op) {
		case "inicio": {
                        q = em.createQuery("select p from Person p");
                        people = q.getResultList();
                        session.setAttribute("people", people);
                        
			request.getRequestDispatcher("home.jsp").forward(request, response);
			break;
		}
                case "menu": {
                    String quieren = request.getParameter("quieren");
                    
                    if (quieren.equals("person")) {
                        q = em.createQuery("select p from Person p");
                        people = q.getResultList();
                        session.setAttribute("people", people);
                        session.removeAttribute("movies");
                    }else {
                        q = em.createQuery("select m from Movie m");
                        movies = q.getResultList();
                        session.setAttribute("movies", movies);
                        session.removeAttribute("people");
                    }
                    
                    request.getRequestDispatcher("home.jsp").forward(request, response);
			break;
                }
                case "filmografia": {
                    String idperson = request.getParameter("person");
                    Person person = em.find(Person.class, Integer.parseInt("idperson"));
                        
                    request.getRequestDispatcher("movies.jsp").forward(request, response);
                    break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + op);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
