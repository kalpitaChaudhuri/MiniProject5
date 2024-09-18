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

@WebServlet("/det")
public class Delete extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("shelly");
		 
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		System.out.println(emf);
		String idStr = req.getParameter("employeeId");
		System.out.println(idStr);
        
        et.begin();
        Employees emp = em.find(Employees.class, idStr);
        if (emp != null) {
            em.remove(emp);
        }
        et.commit();
        //Query query = em.createQuery("FROM Employees", Employees.class);
        //List<Employees> employeeList = query.getResultList();

        //req.setAttribute("employeeList", employeeList);
        //req.getRequestDispatcher("View.jsp").forward(req, resp);
        resp.sendRedirect("View");
	}
}
