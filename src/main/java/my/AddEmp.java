package my;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class AddEmp extends HttpServlet {
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shelly");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("AddEmp.html").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out=resp.getWriter();
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String age = req.getParameter("age");
        String email = req.getParameter("email");
        String salary = req.getParameter("salary");
        String department = req.getParameter("department");
        
        if (id.isEmpty() || name.isEmpty() || age.isEmpty() || email.isEmpty() || salary.isEmpty() || department.isEmpty() ) {
        	out.print("<b>Please fill all fields</b>");
        	req.getRequestDispatcher("AddEmp.html").include(req, resp);
        	return;
        }
        
        et.begin();
        Employees emp=new Employees();
        emp.setId(id);
        emp.setName(name);
        emp.setAge(age);
        emp.setEmail(email);
        emp.setSalary(salary);
        emp.setDepartment(department);

        em.persist(emp);
        et.commit();
        req.getRequestDispatcher("Welcome.html").include(req, resp);
	}
}
