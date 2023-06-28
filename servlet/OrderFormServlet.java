package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

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

import util.SendMail;

public class OrderFormServlet extends HttpServlet {
	public void  doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{

		String error = "";

		try {

			UniformDAO uniformDAO = new UniformDAO();
			OrderDAO orderDAO = new OrderDAO();
			Calendar calendar = Calendar.getInstance();

			HttpSession session = request.getSession();

			//セッションからカート情報を取得(入力値は仮
			ArrayList<Order> order_list = new ArrayList<Order>();

			//リクエストスコープからユニフォームの注文情報を取得
			ArrayList<Uniform> uniform_list = uniformDAO.selectAll();
			//セッションスコープから、注文個数の情報を取得
			ArrayList<MultiBuy> multiBuys = (ArrayList<MultiBuy>)session.getAttribute("multiBuyList");


			//リクエストスコープから購入者情報を取得
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String telNumber = request.getParameter("telNumber");
			String message = request.getParameter("message");

			//合計金額用
			int total = 0;

			//注文情報を元に行う各種処理の実行
			for (int i = 0; i < uniform_list.size();i++) {

				//個数を取得
				int quantity = multiBuys.get(i).getQuantity();

				//購入に伴う在庫の増減処理
				//i番目のユニフォーム情報を取得
				Uniform uniform = uniformDAO.selectByUniformid(uniform_list.get(i).getUniformid());
				int afterStock = ((uniform.getStock()) - (multiBuys.get(i).getQuantity()));

				//購入後の在庫数をセット
				uniform.setStock(afterStock);
				uniform_list.set(i, uniform);


				//以下は注文情報を処理
				Order order = new Order();
				order.setUniformid(uniform_list.get(i).getUniformid());
				order.setUniformType(uniform_list.get(i).getUniformType());
				order.setPrice((uniform_list.get(i).getPrice()));
				order.setQuantity(quantity);

				//フォームから受け取った情報
				order.setOrderid(0);
				order.setName(name);
				order.setEmail(email);
				order.setAddress(address);
				order.setTelNumber(telNumber);
				order.setMessage(message);
				order.setPayment("入金待ち");
				order.setSend("未発送");
				order.setDate("");
				order.setOrderTime("");

				total += order.getPrice() * quantity;

				//在庫更新
				uniformDAO.updateStock(uniform_list.get(i).getUniformid(), afterStock);

				//取得した注文情報を一覧表示画面に追加
				orderDAO.insert(order);
				order_list.add(order);
			}

			SendMail sendMail = new SendMail(order_list, total);

			//在庫更新後のユニフォーム情報をセット
			//request.setAttribute("uniform_list",uniform_list);

			//カート情報を初期化
			session.setAttribute("multiBuyList", null);


		}catch (Exception e) {


		}finally {
			if(error.equals("")) {
				request.getRequestDispatcher("/view/thankyou.jsp").forward(request, response);

			}else {
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
	}
}
