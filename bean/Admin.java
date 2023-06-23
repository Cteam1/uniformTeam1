package bean;

public class Admin {

	//管理者ID
	private String adminid;

	//管理者ログイン用パスワード
	private String password;

	//コンストラクター
	public Admin(){
		this.adminid = null;
		this.password = null;
	}


	public String getUserid() {
		return adminid;
	}

	public void setUserid(String userid) {
		this.adminid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}

