package managementSystem.service;

import java.util.List;
import java.util.Optional;

import managementSystem.entity.UserEntity;
import managementSystem.model.UserModel;

public interface UserService {

//	---------------- SAVE USER ----------------

	Optional<UserEntity> saveUser(UserModel user);

//	---------------- LOGIN USER ----------------

	Optional<UserEntity> fetchByUserNameAndPassword(

			String userName,

			String password);

//	---------------- FETCH ALL USER ----------------

	List<UserEntity> fetchAll();

//	---------------- FETCH ALL USER BY FIELD ----------------

	List<UserEntity> fetchAll(String field);

//	---------------- FETCH USER BY ID ----------------

	Optional<UserEntity> fetchById(Integer id);

//	---------------- UPDATE USER ----------------

	Optional<UserEntity> updateUser(

			Integer id,

			UserModel user);

//	---------------- SAVE UPDATED USER ----------------

	UserEntity saveUpdatedUser(UserEntity user);

//	---------------- DELETE USER ----------------

	Optional<UserEntity> deleteUser(Integer id);

}