package isd.controller;

import isd.model.User;
import isd.model.dao.DBManager;
import isd.model.dao.UserManager;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserController extends HttpServlet {

    private UserManager um = new UserManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opr = req.getParameter("opr");
        String fname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        if (null != opr) {
            doPost(req, resp);
        } else {
            try {
                search(fname, phone, req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opr = req.getParameter("opr");
        String id = req.getParameter("id");

        try {
            if ("activate".equals(opr)) {
                String name = req.getParameter("name");
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                String email = req.getParameter("email");
                String phone = req.getParameter("phone");
                String dob = req.getParameter("dob");
                String address = req.getParameter("address");
                Boolean staff = Boolean.parseBoolean(req.getParameter("staff"));
                int activated = Integer.parseInt(req.getParameter("activated"));
                User au = new User(id, email, name, password, dob, username, address, staff, activated, phone);

                um.activateUser(au);
            } else if ("deactivate".equals(opr)) {
                String name = req.getParameter("name");
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                String email = req.getParameter("email");
                String phone = req.getParameter("phone");
                String dob = req.getParameter("dob");
                String address = req.getParameter("address");
                Boolean staff = Boolean.parseBoolean(req.getParameter("staff"));
                int activated = Integer.parseInt(req.getParameter("activated"));
                User au = new User(id, email, name, password, dob, username, address, staff, activated, phone);

                um.deactivateUser(au);
            } else if ("delete".equals(opr)) {
                String name = req.getParameter("name");
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                String email = req.getParameter("email");
                String phone = req.getParameter("phone");
                String dob = req.getParameter("dob");
                String address = req.getParameter("address");
                Boolean staff = Boolean.parseBoolean(req.getParameter("staff"));
                int activated = Integer.parseInt(req.getParameter("activated"));
                User au = new User(id, email, name, password, dob, username, address, staff, activated, phone);

                um.deleteUser(au);
            } else if ("add".equals(opr)) {
                String name = req.getParameter("name");
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                String email = req.getParameter("email");
                String phone = req.getParameter("phone");
                String dob = req.getParameter("dob");
                String address = req.getParameter("address");
                Boolean staff = Boolean.parseBoolean(req.getParameter("staff"));
                int activated = Integer.parseInt(req.getParameter("activated"));
                User au = new User(id, email, name, password, dob, username, address, staff, activated, phone);
                um.addUser(au);
                req.getRequestDispatcher("UserController1?opr=search").forward(req, resp);
            } else if ("search".equals(opr)) {
                String fname = req.getParameter("fullname");
                String phone = req.getParameter("phone");
                search(fname, phone, req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void search(String fname, String phone, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        User u = new User();
        if (null != fname && !"".equals(fname)) {
            u.setName(fname);
        }
        if (null != phone && !"".equals(phone)) {
            u.setPhone(phone);
        }
        List<User> list = um.allUser(u);
        req.setAttribute("list", list);
        req.getRequestDispatcher("userlist.jsp").forward(req, resp);
    }
}
