package myboot.manager.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import myboot.manager.dao.PersonRepository;
import myboot.manager.model.Person;


@Service
@Transactional
public class PersonManager {

	 @Autowired
	 PersonRepository pr;

    public void createPerson(Person p) {
        pr.save(p);
    }

    public Person getPersonByFirstName(String firstName) {
        List<Person> persons = pr.findByFirstName(firstName);
        return persons.get(0);
    }

    public List<Person> showAllPersons() {
        List<Person> persons = pr.findAll();
        return persons;
    }

    public void deleteSinglePerson(Long id) {
        pr.deleteById(id);
    }

    public void updateSinglePerson(Long id, Person person) {
        person.setId(id);
        pr.save(person);
    }


    public Person readSinglePerson(Long id) {
        return pr.findById(id).orElseThrow(() -> new RuntimeException("can't find person with id " + id));
    }


    public List<Person> findPersonByPart(String part) {
        List<Person> persons =  pr.findByNameLike(part);
        return persons;
    }
}



