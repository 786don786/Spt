import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateDb extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con;
         Statement smt;
         String user=request.getParameter("t1");
         String pswd=request.getParameter("t2");
         String add=request.getParameter("t3");
         String city=request.getParameter("t4");
         String ge=request.getParameter("t5");
         String mob=request.getParameter("t6");
         String email=request.getParameter("t7");
         String hob=request.getParameter("t8");;
         String sques=request.getParameter("ques");
         String sqans=request.getParameter("t9");
        try{ 
      Class.forName("com.mysql.jdbc.Driver");
      con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/lucknowkabab","root","root");
      smt=(Statement)con.createStatement();
      String q1="update table1 set Password='"+pswd+"' and Address='"+add+"' and city='"+city+"' and Gender='"+ge+"' and MobileNo='"+mob+"' and Email='"+email+"' and Hobbies='"+hob+"' and SecuQues='"+sques+"' and Answer='"+sqans+"' where UserName='"+user+"'";
      if(smt.executeUpdate(q1)>0)
      {
      out.println("Update Succesfull");
      }
      else{
      out.println("Update Unsuccessfull");
      }
      
        }
        catch(Exception e)
        {
        out.print(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
