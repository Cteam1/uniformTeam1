package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Admin;
import dao.AdminDAO;

public class LoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String error = "";

		try {

			//管理者情報DTOをオブジェクト化
			Admin admin  =new Admin();

			//セッション情報を取得
			HttpSession session = request.getSession();

			//リクエストスコープからユーザーidとpassの情報を取得
			String adminid = request.getParameter("admin");
			String pass = request.getParameter("pass");

			//管理者情報DAOをオブジェクト化
			AdminDAO  adminDao  = new AdminDAO();

			//メソッドを呼び出して管理者情報を取得し、データベースに該当する管理者があるか確認
			admin = adminDao.selectByUserid(adminid, pass);
			if(admin.getAdminid() != null || admin.getPassword() != null) {
				//該当する管理者がいた場合は、管理者情報をフォワード
				session.setAttribute(adminid, pass);

			}else {
				error = "入力データが間違っています。";
			}

		} catch (Exception e) {
			error = "DB接続エラーのため、ログインできません。";
		}finally {

			if (error.equals("")) {
				//エラーが発生しなかった際は受注一覧画面に遷移
				request.getRequestDispatcher("/view/orderDetail.jsp").forward(request, response);
			} else {
				request.setAttribute("message", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
	}
}
