package com.ms.spring.dao.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.ms.spring.dao.UserDao;
import com.ms.spring.model.LoginForm;
import com.ms.spring.model.User;
import com.ms.util.EncryptionUtil;

@Repository(value="userDao")
@Transactional
public class UserDaoImpl implements UserDao {
	//@Autowired
	//private SessionFactory sessionFactory;
	@PersistenceContext
	private EntityManager entityManager;
	@Override
	public boolean authenticate(LoginForm loginForm) {
		Session session = entityManager.unwrap(Session.class);
		Criteria query = session.createCriteria(User.class);
		query.add(Restrictions.eq("userName", loginForm.getUserId()));
		List<User> list = (List<User>) query.list();
		if(list !=null && list.size()>0) {
			User user = list.get(0);
			String saltStr = user.getSalt();
			String password = user.getPassword();
			byte[] salt;
			try {
				salt = EncryptionUtil.base64ToByte(saltStr);
				byte[] pwd = EncryptionUtil.base64ToByte(password);
				
				
				byte[] bLoginPwd = EncryptionUtil.getHash(loginForm.getPassword(), salt);
				return Arrays.equals(bLoginPwd, pwd);
			} catch (IOException e) {
				
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				
				e.printStackTrace();
			}
			
		}
		return false;
	}
	
	@Override
	public void addUser(User user) {
		encryptPwd(user);
		entityManager.merge(user);
		
	}

	private void encryptPwd(User user) {
		String password = user.getPassword();
		String saltStr = user.getSalt();
		if(saltStr==null || !StringUtils.hasText(saltStr)){
			
			try {
				SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
				// Salt generation 64 bits long
				byte[] bSalt = new byte[8];
				random.nextBytes(bSalt);
				String encpwd = EncryptionUtil.byteToBase64(EncryptionUtil.getHash(password, bSalt));
				user.setPassword(encpwd);
				user.setSalt(EncryptionUtil.byteToBase64(bSalt));
			} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public User findUserByUserName(String userId) {
		Session session = entityManager.unwrap(Session.class);
		Criteria query = session.createCriteria(User.class);
		query.add(Restrictions.eq("userName", userId));
		List<User> list = (List<User>) query.list();
		return list.get(0);
	}

}
