import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginDb extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String user=request.getParameter("l1");
        String pswd=request.getParameter("l2");
        Connection con;
        Statement smt;
        ResultSet rs;
        HttpSession session=request.getSession();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/lucknowkabab","root","root");
            smt=(Statement)con.createStatement();
            String q1="select * from table1 where UserName='"+user+"' and Password='"+pswd+"'";
            rs = smt.executeQuery(q1);
            if(rs.next())
            {
            session.setAttribute("usr",user);
            response.sendRedirect("UserProfile.jsp");
            }
            else
            {
            out.println("Login Unsuccessful");
            out.println("Username or password is incorrect");
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}
