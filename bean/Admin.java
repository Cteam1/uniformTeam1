package bean;

public class Admin {

	//管理者ID
	private String userid;

	//管理者ログイン用パスワード
	private String password;

	//コンストラクター
	public Admin(){
		this.userid = null;
		this.password = null;
	}


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}

