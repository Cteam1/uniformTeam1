package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.MultiBuy;
import bean.Order;
import bean.Uniform;
import dao.OrderDAO;
import dao.UniformDAO;

public class OrderFormServlet extends HttpServlet {
	public void  doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{

		String error = "";

		try {
			HttpSession session = request.getSession();

			//セッションからカート情報を取得(入力値は仮
			ArrayList<Order> order_list = new ArrayList<Order>();

			//リクエストスコープからユニフォームの注文情報を取得
			ArrayList<Uniform> uniform_list = (ArrayList<Uniform>)request.getAttribute("uniform_list");

			//セッションスコープから、注文個数の情報を取得
			ArrayList<MultiBuy> multiBuys = (ArrayList<MultiBuy>)session.getAttribute("multiBuyList");

			UniformDAO uniformDAO = new UniformDAO();
			OrderDAO orderDAO = new OrderDAO();


			//リクエストスコープから購入者情報を取得
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String telNumber = request.getParameter("telNumber");
			String message = request.getParameter("message");

			//注文情報を元に行う各種処理の実行
			for (int i = 0; i < uniform_list.size();i++) {

				//購入に伴う在庫の増減処理
				//i番目のユニフォーム情報を取得
				Uniform uniform = uniformDAO.selectByUniformid(uniform_list.get(i).getUniformid());
				int afterStock = ((uniform.getStock()) - (multiBuys.get(i).getQuantity()));

				//購入後の在庫数をセット
				uniform.setStock(afterStock);
				uniform_list.add(uniform);


				//以下は注文情報を処理
				Order order = new Order();
				order.setUniformid(uniform_list.get(i).getUniformid());
				order.setUniformType(uniform_list.get(i).getUniformType());
				order.setPrice((uniform_list.get(i).getPrice()));

				//フォームから受け取った情報
				order.setName(name);
				order.setEmail(email);
				order.setAddress(address);
				order.setTelNumber(telNumber);
				order.setMessage(message);
				order.setPayment("入金待ち");
				order.setSend("未発送");

				//取得した注文情報を一覧表示画面に追加
				orderDAO.insert(order);
				order_list.add(order);
			}

			//在庫更新後のユニフォーム情報をセット
			request.setAttribute("uniform_list",uniform_list);

			//カート情報を初期化
			session.setAttribute("multiBuyList", null);


		}catch (Exception e) {


		}finally {
			if(error.equals("")) {
				request.getRequestDispatcher("/view/thankYou.jsp").forward(request, response);

			}else {
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
	}
}
