package managementSystem.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;

import managementSystem.entity.UserEntity;

public interface UserDao {

	
	
	
//	---------------- SAVE USER ----------------

	Optional<UserEntity> saveUser(
			UserEntity user);

	
	
	
//	---------------- LOGIN USER ----------------

	Optional<UserEntity> findOne(
			Example<UserEntity> example);

	
	
	
//	---------------- FETCH ALL USER ----------------

	List<UserEntity> fetchAll();

	
	
	
//	---------------- FETCH ALL USER BY FIELD ----------------

	List<UserEntity> fetchAll(
			String field);

	
	
	
//	---------------- FETCH USER BY ID ----------------

	Optional<UserEntity> fetchById(
			Integer id);

	
	
	
//	---------------- UPDATE USER ----------------

	Optional<UserEntity> updateUser(
			Integer id,
			UserEntity user);

	
	
	
//	---------------- DELETE USER ----------------

	Optional<UserEntity> deleteUser(
			Integer id);

}