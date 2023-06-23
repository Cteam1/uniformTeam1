package bean;

public class Order {

	//購入者氏名
	private String name;

	//購入者Email
	private String email;

	//購入者住所
	private String address;

	//購入者電話番号
	private String telNumber;

	//購入金額合計
	private int price;

	//備考欄
	private String messase;

	//支払状況ステータス
	private String payment;

	//発送状況ステータス
	private String send;

	//注文日
	private String date;


	public Order() {
		//コンストラクタ
		this.name = null;
		this.email = null;
		this.address = null;
		this.telNumber = null;
		this.price = 0;
		this.messase = null;
		this.payment = null;
		this.send = null;
		this.date = null;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelNumber() {
		return telNumber;
	}

	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMessase() {
		return messase;
	}

	public void setMessase(String messase) {
		this.messase = messase;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getSend() {
		return send;
	}

	public void setSend(String send) {
		this.send = send;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}



}
