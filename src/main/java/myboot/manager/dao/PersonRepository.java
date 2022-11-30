package myboot.manager.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import myboot.manager.model.Person;





@Repository
@Transactional
public interface PersonRepository  extends JpaRepository<Person, Long> {

	@Query(value = "SELECT * FROM Person p WHERE p.firstname = ?1", nativeQuery = true)
	List<Person> findByFirstName(String name);

	@Query(
			value = "SELECT * FROM Person p WHERE p.firstname = ?1",
			nativeQuery = true)
	List<Person> findByNameLike( @Param("part") String part);

	Person findByUserName(String username);
	boolean existsByUserName(String username);

	@Transactional
	void deleteByUserName(String username);

}