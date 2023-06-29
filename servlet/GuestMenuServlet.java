package servlet;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import bean.*;

public class GuestMenuServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<MultiBuy> multiBuys = new ArrayList<MultiBuy>();

		// セッションの作成
		HttpSession session = request.getSession();
		session.setAttribute("multiBuyList", multiBuys);

		// 購入者メニューへ遷移
		request.getRequestDispatcher("/view/guestMenu.jsp").forward(request, response);

	}

}
