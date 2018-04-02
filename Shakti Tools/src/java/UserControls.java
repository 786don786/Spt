import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserControls extends HttpServlet{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String unpd = request.getParameter("unpd");
        String upd = request.getParameter("upd");
        out.println(request.getParameter("unpd"));
        out.println(request.getParameter("upd"));
        String mp = request.getParameter("mp");
        out.println(request.getParameter("mp"));
           try {
            if ("Upload new product details".equals(unpd)) {
                RequestDispatcher rs = request.getRequestDispatcher("/ProductUpload.jsp");
                rs.forward(request, response);
            } else if ("Update profile details".equals(upd)) {
                RequestDispatcher rs = request.getRequestDispatcher("/ProfileUpdate.jsp");
                rs.forward(request, response);
            } else if ("My Products".equals(mp)) {
                RequestDispatcher rs = request.getRequestDispatcher("/UserProducts.jsp");
                rs.forward(request, response);
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
