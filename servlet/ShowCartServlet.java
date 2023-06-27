package servlet;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import bean.*;
import dao.*;

public class ShowCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 文字エンコーディングの指定
		request.setCharacterEncoding("UTF-8");

		// エラーメッセージ格納用変数
		String error = "";

		// エラーコマンド格納用変数
		String cmd = "";

		// パラメータの取得
		String delno = request.getParameter("delno");

		try {
			// sessionオブジェクトの作成
			HttpSession session = request.getSession();

			// セッションからカート情報（multiBuy）を取得
			ArrayList<MultiBuy> multiBuyList = (ArrayList<MultiBuy>)session.getAttribute("multiBuyList");

			// DAOオブジェクト宣言
			UniformDAO uniformDao = new UniformDAO();

			// ユニフォーム情報を取得
			ArrayList<Uniform> uniform_list = uniformDao.selectAll();

			if (multiBuyList == null) {// セッション切れの場合

				error = "セッションが切れました。";
				cmd = "guestMenu";
				return;

			}

			if (delno != null) {// delnoがnullでない場合

				// カートから該当の書籍情報を削除
				multiBuyList.remove(Integer.parseInt(delno));

			}

			// カート情報とユニフォーム情報をリクエストスコープに登録
			request.setAttribute("uniform_list", uniform_list);
			request.setAttribute("multiBuyList", multiBuyList);

		} catch (IllegalStateException e) {// DBエラーが起きた場合

			error = "エラーが起こった為、カート一覧は表示できませんでした。";
			cmd = "guestMenu";

		} finally {

			if (error.equals("")) {// エラーがない場合

				// orderList.jspに遷移
				request.getRequestDispatcher("/view/showCart.jsp").forward(request, response);

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