package bean;

public class MultiBuy {

	//購入数
	private int quantity;

	//注文ID
	private String orderid;

	//ユニフォームID
	private String uniformid;

	public MultiBuy() {
		//コンストラクタ
		this.quantity= 0;
		this.orderid = null;
		this.uniformid = null;
	}


	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getUniformid() {
		return uniformid;
	}

	public void setUniformid(String uniformid) {
		this.uniformid = uniformid;
	}



	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
