package egovframework.project.repository;

import org.springframework.stereotype.Repository;

import egovframework.project.model.entity.User;

import org.springframework.data.jpa.repository.JpaRepository;
@Repository
public interface UserRepository extends JpaRepository<User, Long>{

}
