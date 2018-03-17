import com.mysql.jdbc.*;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FormDb extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         Connection con;
         Statement smt;
         PrintWriter out = response.getWriter();
         String user=request.getParameter("t1");
         String pswd=request.getParameter("t2");
         String add=request.getParameter("ta");
         String city=request.getParameter("city");
         String ge=request.getParameter("r1");
         String mob=request.getParameter("txtmob");
         String email=request.getParameter("txtemail");
         String hob1=request.getParameter("c1");
         String hob2=request.getParameter("c2");
         String hob3=request.getParameter("c3");
         String hob;
         String sques=request.getParameter("sq");
         String sqans=request.getParameter("sqa");
        hob = " ";
         if("on".equals(hob1))
                 {
                     hob=hob+"Sleeping";
         }
         if("on".equals(hob2))
                 {
                     hob=hob+" Music";
         }
         if("on".equals(hob3))
                 {
                     hob=hob+" Reading";
         }
         
         try{
      Class.forName("com.mysql.jdbc.Driver");
      con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/lucknowkabab","root","root");
      smt=(Statement)con.createStatement();
      String q1="insert into table1 values('"+user+"','"+pswd+"','"+add+"','"+city+"','"+ge+"','"+mob+"','"+email+"','"+hob+"','"+sques+"','"+sqans+"')";
      if(smt.executeUpdate(q1)>0)
      {
      out.println("Succesfull");
      }
      else{
      out.println("Unsuccessfull");
      }
      
        }
         catch(Exception e)
         {
         out.println(e);
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
