package myboot.manager.test;


import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import myboot.manager.dao.PersonRepository;
import myboot.manager.model.Cv;
import myboot.manager.model.Nature;
import myboot.manager.model.Person;


@SpringBootTest
public class TestManagerRepository {

	@Autowired
	PersonRepository pr;
	

	
	@Test
	public void testSavePerson() {
		Person p = new Person();
	    p.setFirstName("super");
	    p.setLastName("mario");
		p.setPassword("mario");
	    p.setEmail("mario@gmail.com");
	    
		Person p2 = pr.save(p);
		Optional<Person> p3 = pr.findById(p.getId());
		assertEquals(p3.get().getFirstName(), "super");
	}
	
	@Test
	public void testDeletePerson() {
		Person p = new Person();
	    p.setFirstName("super");
	    p.setLastName("luigi");
		p.setPassword("mario");
	    p.setEmail("liugi@gmail.com");
	    
		Person p2 = pr.save(p);
		pr.delete(p);
		Optional<Person> p3 = pr.findById(p.getId());
		assertEquals(p3, Optional.empty());
	}
	
	@Test
	public void testReplacePerson() {
		Person p = new Person();
	    p.setFirstName("super");
	    p.setLastName("luigi");
		p.setPassword("mario");
	    p.setEmail("liugi@gmail.com");
	    
		Person p2 = pr.save(p);
		Optional<Person> p3 = pr.findById(p.getId());
		
		Person p4 = p3.get();
		p4.setFirstName("black");
		
		Person p5 = pr.save(p4);
		Optional<Person> p6 = pr.findById(p.getId());
		assertEquals(p6.get().getFirstName(), "black");
	}

	
//	@Test
//	public void testSaveCv() {
//		Cv c = new Cv();
//	    c.setDescription("test");
//		c.setTitle("test");
//	    c.setNature(Nature.professional);
//	    c.setYear(2022L);
//
//		Cv c2 = cr.save(c);
//		Optional<Cv> c3 = cr.findById(c.getId());
//		assertEquals(c3.get().getDescription(), "test");
//	}
//
//	@Test
//	public void testDeleteCv() {
//		Cv c = new Cv();
//	    c.setDescription("test");
//		c.setTitle("test");
//	    c.setNature(Nature.professional);
//	    c.setYear(2022L);
//
//		Cv c2 = cr.save(c);
//		cr.delete(c);
//		Optional<Cv> c3 = cr.findById(c.getId());
//		assertEquals(c3, Optional.empty());
//	}
//
//	@Test
//	public void testReplaceCv() {
//		Cv c = new Cv();
//	    c.setDescription("test");
//		c.setTitle("test");
//	    c.setNature(Nature.professional);
//	    c.setYear(2022L);
//
//		Cv c2 = cr.save(c);
//		Optional<Cv> c3 = cr.findById(c.getId());
//
//		Cv c4 = c3.get();
//		c4.getYear();
//
//		Cv c5 = cr.save(c4);
//		Optional<Cv> c6 = cr.findById(c.getId());
//		assertEquals(c6.get().getYear(), 2022);
//	}

//	@Test
//	public void testShowPersonsByPart(){
//		List<Person> p = pr.findByNameLike("mar");
//		assertEquals(true , p.get(0).getFirstName().contains("mar") );
//	}

	   
}
