package bean;

public class Uniform {

	//ユニフォームの種類
	 private String uniformType;

	 //ユニフォーム在庫数
	 private int stock;

	 //ユニフォーム価格
	 private int price;

	 public Uniform() {
		 //コンストラクタ
		 this.uniformType = null;
		 this.price = 0;
		 this.stock = 0;
	 }

	public String getUniformType() {
		return uniformType;
	}

	public void setUniformType(String uniformType) {
		this.uniformType = uniformType;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
