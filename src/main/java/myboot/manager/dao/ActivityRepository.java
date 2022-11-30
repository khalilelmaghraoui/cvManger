package myboot.manager.dao;

import myboot.manager.model.Activity;
import myboot.manager.model.Cv;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
@Transactional
public interface ActivityRepository extends JpaRepository<Activity, Long> {
    List<Activity> findByPersonId(Long postId);
}