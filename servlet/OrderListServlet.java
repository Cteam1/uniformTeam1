package servlet;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import bean.*;
import dao.*;

public class OrderListServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// エラーメッセージ格納用変数
		String error = "";

		// エラーコマンド格納用変数
		String cmd = "";

		try {

			// DAOオブジェクト宣言
			OrderDAO orderDao = new OrderDAO();

			// 受注一覧格納用配列
			ArrayList<Order> order_list = new ArrayList<Order>();
			ArrayList<Order> order_list_group = new ArrayList<Order>();

			// セッション取得
			HttpSession session = request.getSession();
			Admin admin = (Admin) session.getAttribute("admin");

			if (admin == null) {// セッション切れの場合

				error = "セッションが切れました。";
				cmd = "logout";
				return;

			}

			// 受注一覧を取得
			order_list = orderDao.selectAll();
			order_list_group = orderDao.selectAllGroup();

			// 受注一覧をリクエストスコープに登録
			request.setAttribute("order_list", order_list);
			request.setAttribute("order_list_group", order_list_group);

		} catch (IllegalStateException e) {// DBエラーが起きた場合

			error = "エラーが起こった為、受注一覧は表示できませんでした。";
			cmd = "logout";

		} finally {

			if (error.equals("")) {// エラーがない場合

				// orderList.jspに遷移
				request.getRequestDispatcher("/view/orderList.jsp").forward(request, response);

			} else {// エラーがある場合

				// エラーメッセージをリクエストスコープに登録
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);

				// error.jspに遷移
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);

			}

		}

	}

}