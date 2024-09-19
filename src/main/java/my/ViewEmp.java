package my;
import java.io.IOException;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/View")
public class ViewEmp extends HttpServlet {
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shelly");
	EntityManager em=emf.createEntityManager();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Query query = em.createQuery("FROM Employees", Employees.class);
		List<Employees> employees = query.getResultList();

		req.setAttribute("employeeList", employees);
		em.close();
		req.getRequestDispatcher("View.jsp").forward(req, resp);
	}
}
