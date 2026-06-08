package managementSystem.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import managementSystem.dao.UserDao;
import managementSystem.entity.UserEntity;
import managementSystem.model.UserModel;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserDao dao;

	@Autowired
	private BCryptPasswordEncoder encoder;

//	---------------- SAVE USER ----------------

	@Override
	public Optional<UserEntity> saveUser(UserModel user) {

		System.out.println("User Name -> " + user.getName());

//		PASSWORD ENCODE

		String pass = encoder.encode(user.getPassword());

//		COPY MODEL TO ENTITY

		UserEntity entity = new UserEntity();

		BeanUtils.copyProperties(user, entity);

//		SET ENCODED PASSWORD

		entity.setPassword(pass);

//		DEFAULT ROLE

		entity.setRole("USER");

//		SAVE USER

		return dao.saveUser(entity);
	}

//	---------------- LOGIN USER ----------------

	@Override
	public Optional<UserEntity> fetchByUserNameAndPassword(

			String userName,

			String password) {

//		CREATE OBJECT

		UserEntity user = new UserEntity();

		user.setUserName(userName);

//		CREATE EXAMPLE

		Example<UserEntity> example = Example.of(user);

//		FIND USER

		Optional<UserEntity> optional = dao.findOne(example);

//		CHECK PASSWORD

		if (optional.isPresent()) {

			UserEntity dbUser = optional.get();

			if (encoder.matches(

					password,

					dbUser.getPassword())) {

				return Optional.of(dbUser);
			}
		}

		return Optional.empty();
	}

//	---------------- FETCH ALL USER ----------------

	@Override
	public List<UserEntity> fetchAll() {

		return dao.fetchAll();
	}

//	---------------- FETCH ALL USER BY FIELD ----------------

	@Override
	public List<UserEntity> fetchAll(String field) {

		return dao.fetchAll(field);
	}

//	---------------- FETCH USER BY ID ----------------

	@Override
	public Optional<UserEntity> fetchById(Integer id) {

		return dao.fetchById(id);
	}

//	---------------- UPDATE USER ----------------

	@Override
	public Optional<UserEntity> updateUser(

			Integer id,

			UserModel user) {

		UserEntity entity = new UserEntity();

		BeanUtils.copyProperties(user, entity);

//		ENCODE PASSWORD

		entity.setPassword(encoder.encode(user.getPassword()));

		return dao.updateUser(id, entity);
	}

//	---------------- SAVE UPDATED USER ----------------

	@Override
	public UserEntity saveUpdatedUser(

			UserEntity user) {

		return dao.saveUser(user).get();
	}

//	---------------- DELETE USER ----------------

	@Override
	public Optional<UserEntity> deleteUser(Integer id) {

		return dao.deleteUser(id);
	}
}