package edu.dhu.dao.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import edu.dhu.dao.UserDaoI;
import edu.dhu.model.Users;
import edu.dhu.pageModel.PMUser;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<Users> implements UserDaoI {

}
