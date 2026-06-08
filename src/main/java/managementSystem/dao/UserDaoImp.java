package managementSystem.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import managementSystem.entity.UserEntity;
import managementSystem.repository.UserRepository;

@Repository
public class UserDaoImp implements UserDao {

	@Autowired
	private UserRepository repository;

//	---------------- SAVE USER ----------------

	@Override
	public Optional<UserEntity> saveUser(UserEntity user) {

		UserEntity saveUser = repository.save(user);

		return Optional.ofNullable(saveUser);
	}

//	---------------- LOGIN USER ----------------

	@Override
	public Optional<UserEntity> findOne(Example<UserEntity> example) {

		return repository.findOne(example);
	}

//	---------------- FETCH ALL USER ----------------

	@Override
	public List<UserEntity> fetchAll() {

		return repository.findAll();
	}

//	---------------- FETCH ALL USER BY FIELD ----------------

	@Override
	public List<UserEntity> fetchAll(String field) {

		return repository.findAll(Sort.by(field));
	}

//	---------------- FETCH USER BY ID ----------------

	@Override
	public Optional<UserEntity> fetchById(Integer id) {

		return repository.findById(id);
	}

//	---------------- UPDATE USER ----------------

	@Override
	public Optional<UserEntity> updateUser(Integer id, UserEntity user) {

		Optional<UserEntity> optional = repository.findById(id);

		if (optional.isPresent()) {

			UserEntity dbUser = optional.get();

			dbUser.setName(user.getName());

			dbUser.setAge(user.getAge());

			dbUser.setEmail(user.getEmail());

			dbUser.setUserName(user.getUserName());

			dbUser.setPhone(user.getPhone());

			dbUser.setAddress(user.getAddress());

			UserEntity updated = repository.save(dbUser);

			return Optional.of(updated);
		}

		return Optional.empty();
	}

//	---------------- DELETE USER ----------------

	@Override
	public Optional<UserEntity> deleteUser(Integer id) {

		Optional<UserEntity> optional = repository.findById(id);

		if (optional.isPresent()) {

			repository.deleteById(id);

			return optional;
		}

		return Optional.empty();
	}

}