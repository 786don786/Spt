
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProDb extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection con;
         Statement smt;
        PrintWriter out = response.getWriter();
        String proid=request.getParameter("proid");
        String procat=request.getParameter("procat");
        String proname=request.getParameter("proname");
        String probrand=request.getParameter("probrand");
        String proprice=request.getParameter("proprice");
        String user=request.getParameter("user");
        try {
             Class.forName("com.mysql.jdbc.Driver");
      con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/lucknowkabab","root","root");
      smt=(Statement)con.createStatement();
      String q1="insert into prodata values('"+proid+"','"+procat+"','"+proname+"','"+probrand+"','"+proprice+"','"+user+"','Pending')";
      if(smt.executeUpdate(q1)>0)
      {
      out.println("Succesfull");
      }
      else{
      out.println("Unsuccessfull");
      }
            
        } catch (Exception e) {
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
