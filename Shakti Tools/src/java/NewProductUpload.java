
import com.utility.RandomIdGenerator;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
public class NewProductUpload extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String conlink = getServletContext().getInitParameter("conlink");
        String dbuser = getServletContext().getInitParameter("dbuser");
        String dbpass = getServletContext().getInitParameter("dbpass");
        String user = request.getParameter("user");
        String proname = request.getParameter("proname");
        String procat = request.getParameter("procat");
        String probrand = request.getParameter("probrand");
        String proprice = request.getParameter("proprice");
        Connection con;
        Statement smt;
        HttpSession session;
        String r;
        
        //Image Handling Code
        
        ServletContext sc = getServletContext();
		String path = sc.getRealPath("/");

		System.out.println(path);
		String newpath = path + user;
		File f = new File(newpath);
		if (!f.exists()) {

			f.mkdir();
		}
		System.out.println("directorycreated");
		final Part filePart = request.getPart("proimage");        
		final String fileName = getFileName(filePart);
                
                //Product Id Generator
                RandomIdGenerator rid=new RandomIdGenerator();
                String proid=rid.randomProIdGenerator();
                
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(conlink, dbuser, dbpass);
            smt = con.createStatement();
            String q = "insert into prodetail values('" + proname + "','" + procat + "','" + probrand + "','" + proprice + "','" + user + "','Pending','"+ fileName +"','"+proid+"')";
            if (smt.executeUpdate(q) > 0) {
                session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("proid", proid);
            response.sendRedirect("proUploadInfo.jsp");

            } else {
                r = "Unsuccessful";
                session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("result", r);
            response.sendRedirect("ProductUpload.jsp");
            }
            
        } catch (Exception e) {
            out.println(e);
        }
        OutputStream outS = null;
		InputStream filecontent = null;
		final PrintWriter writer = response.getWriter();

		try {
			outS = new FileOutputStream(new File(newpath + File.separator + fileName));
			filecontent = filePart.getInputStream();

			int read = 0;
			final byte[] bytes = new byte[1024];

			while ((read = filecontent.read(bytes)) != -1) {
				outS.write(bytes, 0, read);
			}
			//writer.println("New file " + fileName + " created at " + newpath);

		} catch (FileNotFoundException fne) {

			writer.println("<br/> ERROR: " + fne.getMessage());

		} finally {
			if (out != null) {
				out.close();
			}
			if (filecontent != null) {
				filecontent.close();
			}
			if (writer != null) {
				writer.close();
			}
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
    private String getFileName(final Part part) {

		final String partHeader = part.getHeader("content-disposition");

		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
