package myboot.manager.services;

import myboot.manager.dao.ActivityRepository;
import myboot.manager.model.Activity;
import myboot.manager.model.Cv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import myboot.manager.model.Person;

import java.util.List;
import java.util.Optional;


@Service
@Transactional
public class ActivityManager {


	@Autowired
	PersonManager personManager;

	@Autowired
	ActivityRepository activityRepository;


	@Transactional
	public Cv findCvByPersonId(Long personId) {
		List<Activity> activities = activityRepository.findByPersonId(personId);
		Cv cv = new Cv();
		cv.setActivities(activities);
		cv.setPerson(personManager.readSinglePerson(personId));
		return cv;
	}

	@Transactional
	public void savePersonCv(List<Activity> activities) {
		activityRepository.saveAll(activities);
	}

	public void createPersonCv(Long personId, List<Activity> activities) {
		Person person =  personManager.readSinglePerson(personId);
		activities.forEach(activity -> activity.setPerson(person));
		this.savePersonCv(activities);
	}



	public void updatePersonActivity(Long activityId, Activity activity) {
		Activity a = activityRepository.findById(activityId).orElseThrow(() -> new RuntimeException("activity " + activityId + "not found"));;
		activity.setId(activityId);
		activity.setPerson(a.getPerson());
		activityRepository.save(activity);
	}

	public void deletePersonCv(Long personId) {
		List<Activity> activities = activityRepository.findByPersonId(personId);
		activityRepository.deleteAll(activities);
	}
}

