package servlet;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import bean.MultiBuy;
import bean.Uniform;
import dao.UniformDAO;

public class InsertCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {

		// sessionオブジェクトの作成
		HttpSession session = request.getSession();

		// セッションからカート情報（multiBuy）を取得
		ArrayList<MultiBuy> multiBuyList = (ArrayList<MultiBuy>)session.getAttribute("multiBuyList");

		// エラーメッセージとエラーコマンドの変数を定義
		String error = "";
		String cmd = "";

		try {
			if (multiBuyList == null) {
				// セッション切れならerror.jspへフォワード
				error = "セッション切れの為、カートに入れることができませんでした。";
				cmd = "logout";
				return;
			}

			ArrayList<MultiBuy> tempList = (ArrayList<MultiBuy>)session.getAttribute("multiBuyList");

			Uniform uniform = new Uniform();
			MultiBuy multiBuy = new MultiBuy();
			UniformDAO uniformDao = new UniformDAO();

			// ユニフォームの種類とその注文数を取得
			String uniform_idA = request.getParameter("uniformA_id"); // ユニフォームAのuniform_id
			Uniform uniformA = uniformDao.selectByUniformid(uniform_idA);
			int quantityA = Integer.parseInt(request.getParameter("quantityA")); // ユニフォームAの数量

			String uniform_idB = request.getParameter("uniformB_id");
			Uniform uniformB = uniformDao.selectByUniformid(uniform_idB);
			int quantityB = Integer.parseInt(request.getParameter("quantityB"));

			String uniform_idC = request.getParameter("uniformC_id");
			Uniform uniformC = uniformDao.selectByUniformid(uniform_idC);
			int quantityC = Integer.parseInt(request.getParameter("quantityC"));

			// 在庫数超過の確認
			if (uniformA.getStock() < quantityA) {
				error = "ユニフォームAが在庫数を超過してカートに入れています!";
				cmd = "uniformlist";
				return;
			}
			multiBuy.setUniformid(uniform_idA);
			multiBuy.setQuantity(quantityA);
			tempList.add(multiBuy);
			addCart(multiBuy, multiBuyList);

			if (uniformB.getStock() < quantityB) {
				error = "ユニフォームBが在庫数を超過してカートに入れています!";
				cmd = "uniformlist";
				return;
			}
			multiBuy.setOrderid(uniform_idB);
			multiBuy.setQuantity(quantityB);
			tempList.add(multiBuy);
			addCart(multiBuy, multiBuyList);

			if (uniformC.getStock() < quantityC) {
				error = "ユニフォームCが在庫数を超過してカートに入れています!";
				cmd = "uniformlist";
				return;
			}
			multiBuy.setOrderid(uniform_idC);
			multiBuy.setQuantity(quantityC);
			tempList.add(multiBuy);
			addCart(multiBuy, multiBuyList);

			request.setAttribute("tempList", tempList);
			session.setAttribute("multiBuyList", multiBuyList);


		} catch (IllegalStateException e) {
			error = "DB接続エラーのため選択された商品をカートに入れることができませんでした。";
			cmd = "login";
			return;

		} finally {
			if (cmd.equals("")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/insertCart.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("message", error);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
	}

	public static void addCart(MultiBuy multiBuy, ArrayList<MultiBuy> multiBuyList) {
		if (!(multiBuyList.isEmpty())) {
			// list内に今回購入しようとしている本(ISBN)がないかチェック
			for (int i = 0; i < multiBuyList.size(); i++) {
				if (multiBuyList.get(i).getUniformid().equals(multiBuy.getUniformid())) {

					// ある場合は購入数のみリストに加算
					multiBuyList.get(i).setQuantity(multiBuyList.get(i).getQuantity() + multiBuy.getQuantity());
					break;
				}
				if (i == multiBuyList.size() - 1) {

					// ない場合はOrderオブジェクトをList配列に追加
					multiBuyList.add(multiBuy);
					i++;
				}
			}
		} else {
			multiBuyList.add(multiBuy);
		}
	}
}
