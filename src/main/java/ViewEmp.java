import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

@WebServlet("/view")
public class ViewEmp extends HttpServlet {
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("shelly");
	EntityManager em=emf.createEntityManager();
}
