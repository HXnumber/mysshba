package edu.dhu.pageModel;

/**
 * sessionInfo模型
 * 
 */
public class SessionInfo implements java.io.Serializable {

	private static final long serialVersionUID = -4396043396019134319L;

	private Integer userId;// 用户ID
	private String loginName;// 用户登录名称
	private String loginPassword;// 登录密码

	// users Fields
	private String chineseName;




	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
}
