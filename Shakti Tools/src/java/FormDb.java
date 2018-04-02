
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FormDb extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String conlink = getServletContext().getInitParameter("conlink");
        String dbuser = getServletContext().getInitParameter("dbuser");
        String dbpass = getServletContext().getInitParameter("dbpass");
        Connection con;
        Statement smt;
        String user = request.getParameter("t1");
        String pass = request.getParameter("t2");
        String address = request.getParameter("ta");
        String city = request.getParameter("city");
        String gender = request.getParameter("r1");
        String mobile = request.getParameter("mob");
        String email = request.getParameter("email");
        String hob = "";
        String secque=request.getParameter("secque");
        String answer = request.getParameter("sqa");
        if ("on".equals(request.getParameter("c1"))) {
            hob = hob + "Sleeping";
        }
        if ("on".equals(request.getParameter("c2"))) {
            hob = hob + " Music";
        }
        if ("on".equals(request.getParameter("c3"))) {
            hob = hob + " Reading";
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (com.mysql.jdbc.Connection) DriverManager.getConnection(conlink, dbuser, dbpass);
            smt = con.createStatement();
            String q= "insert into regis values('"+user+"','"+pass+"','"+address+"','"+city+"','"+gender+"','"+mobile+"','"+email+"','"+hob+"','"+answer+"','"+secque+"')";
            if (smt.executeUpdate(q) > 0) {
                out.println("Succesfull");
                out.println("<a href=\"Login.jsp\">Login</a>");
            } else {
                out.println("Unsuccessfull");
            }
        } catch (Exception e) {
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
