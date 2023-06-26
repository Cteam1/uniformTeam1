package bean;

/**
- -
-
-
 *
 */
public class Order {


	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDate(String datetime) {
		this.datetime = datetime;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	//購入日
	private String datetime;

	//ユーザーid
	private String userid;

	//ISBN
	private String isbn;

	//注文番号
	private int orderno;

	//数量
	private int quantity;

	//コンストラクタ
	public Order() {
		this.userid = null;
		this.orderno=0;
		this.datetime=null;
		this.isbn=null;
		this.quantity=0;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}}


