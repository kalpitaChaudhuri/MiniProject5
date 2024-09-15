package my;

import java.io.IOException;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Delete")
public class Delete extends HttpServlet {
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shelly");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idStr = req.getParameter("id");
        
        et.begin();
        Employees emp = em.find(Employees.class, idStr);
        if (emp != null) {
            em.remove(emp);
            et.commit();
        }
        EntityManager em2 = emf.createEntityManager();
        Query query = em2.createQuery("FROM Employees", Employees.class);
        List<Employees> employeeList = query.getResultList();

        req.setAttribute("employeeList", employeeList);
        req.getRequestDispatcher("View.jsp").forward(req, resp);
        resp.sendRedirect("View.jsp");
	}
}
