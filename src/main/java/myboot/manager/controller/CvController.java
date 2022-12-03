package myboot.manager.controller;



import com.fasterxml.jackson.annotation.JsonView;
import myboot.manager.model.*;
import myboot.manager.services.ActivityManager;
import myboot.manager.services.PersonManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/api")

public class CvController {

    @Autowired
    private ActivityManager activityManager;

    @Autowired
    private PersonManager personManager;


    @PostMapping ("person/{personId}/cv")
    public ResponseEntity createCV(@PathVariable(value = "personId") Long personId, @RequestBody Activity activity) {
        List<Activity> activities = new ArrayList<Activity>();
        activities.add(activity);
        activityManager.createPersonCv(personId, activities);
       return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @GetMapping("/person/{personId}/cv")
    public ResponseEntity< List<Activity> > showPersonCv(@PathVariable(value = "personId") Long personId) {
        Cv cv = activityManager.findCvByPersonId(personId);
        List<Activity> activities = cv.getActivities();
        return new ResponseEntity<>(activities, HttpStatus.OK);
    }

    @GetMapping("/cvs")
    public ResponseEntity<List<Cv>> showAllCv() {
        List<Person> persons = personManager.showAllPersons();
        List<Cv> cvs = new ArrayList<Cv>();
        persons.forEach(person -> {
           Cv cv =  activityManager.findCvByPersonId(person.getId());
            cvs.add(cv);
        });
        return new ResponseEntity<>(cvs, HttpStatus.OK);
    }

    @PostMapping("/person/cv/{activityId}")
    public ResponseEntity<Cv> updatePersonCv(@PathVariable(value = "activityId") Long activityId, @RequestBody Activity activity) {
        activityManager.updatePersonActivity(activityId, activity);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @DeleteMapping ("/person/{personId}/cv")
    public ResponseEntity deletePersonCv(@PathVariable(value = "personId") Long personId) {
        activityManager.deletePersonCv(personId);
        return new ResponseEntity(HttpStatus.OK);
    }
    @DeleteMapping ("/activity/{id}")
    public ResponseEntity deletePersonActivity(@PathVariable(value = "id") Long id) {
        activityManager.deletePersonActivity(id);
        return new ResponseEntity(HttpStatus.OK);
    }


    @PostConstruct
    public void init() {

        //create Person
        Set<String> roles = new HashSet<String>();
        roles.add(String.valueOf(AppUserRole.ROLE_ADMIN));

        Person p = new Person(1L, "mario", "super", "1999", "web", "test", "test", "test", roles );
        personManager.createPerson(p);



        //create Activities
        Activity activity = new Activity(1L, "199", Nature.professional, "SQLI", "test test test", "web test", p);
        Activity activity2 = new Activity(2L, "1999", Nature.professional, "SQLI11111", "test test test", "web test", p);
        List<Activity> activities = new ArrayList<Activity>();
        activities.add(activity);
        activities.add(activity2);
        activityManager.savePersonCv(activities);

        Person p2 = new Person(2L, "mario2", "super2", "19992", "web", "test2", "test2", "test2", roles );

        personManager.createPerson(p2);

        //create Activities
        activity.setId(3L);
        activity.setPerson(p2);
        List<Activity> activities2 = new ArrayList<Activity>();
        activities2.add(activity);
        activityManager.savePersonCv(activities);


    }

    @PatchMapping("/cvs")
    public void populate() {
        init();
    }
}
