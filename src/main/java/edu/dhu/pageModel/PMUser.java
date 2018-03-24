package edu.dhu.pageModel;

public class PMUser implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	public PMUser() {
		super();
	}

	// user的基本属性和数据库中表的结果相同。用于ModelDriven（user) 模型驱动
	private Integer id;
	private String username;
	private String password;
	private String name;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
