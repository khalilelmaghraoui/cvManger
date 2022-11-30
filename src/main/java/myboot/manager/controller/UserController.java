package myboot.manager.controller;


import myboot.manager.model.Person;
import myboot.manager.model.PersonDTO;
import myboot.manager.security.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * L'API d'authentification
 */
@RestController
@RequestMapping("/secu-users")
@Profile("usejwt")
public class UserController {

	@Autowired
	private UserService userService;

	private ModelMapper modelMapper = new ModelMapper();

	/**
	 * Authentification et récupération d'un JWT
	 */
	@PostMapping("/login")
	public String login(//
			@RequestParam String username, //
			@RequestParam String password) {
		System.out.println(username);
		System.out.println(password);
		return userService.login(username, password);
	}

	/**
	 * Ajouter un utilisateur
	 */
	@PostMapping("/signup")
	public String signup(@RequestBody PersonDTO user) {
		return userService.signup(modelMapper.map(user, Person.class));
	}

	/**
	 * Supprimer un utilisateur
	 */
	@DeleteMapping("/{username}")
	@PreAuthorize("hasAuthority('ADMIN')")
	public String delete(@PathVariable String username) {
		System.out.println("delete " + username);
		userService.delete(username);
		return username;
	}

	/**
	 * Récupérer des informations sur un utilisateur
	 */
	@GetMapping("/{username}")
	@PreAuthorize("hasAuthority('ADMIN')")
	public PersonDTO search(@PathVariable String username) {
		return modelMapper.map(userService.search(username), PersonDTO.class);
	}

	/**
	 * Récupérer des informations sur l'utilisateur courant
	 */
	@GetMapping(value = "/me")
	@PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
	public PersonDTO whoami(HttpServletRequest req) {
		return modelMapper.map(userService.whoami(req), PersonDTO.class);
	}

	/**
	 * Récupérer un nouveau JWT
	 */
	@GetMapping("/refresh")
	@PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
	public String refresh(HttpServletRequest req) {
		return userService.refresh(req.getRemoteUser());
	}
	
	/**
	 * Logout
	 */
	@GetMapping("/logout")
	@PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
	public String logout(HttpServletRequest req) {
		return userService.logout(req);
	}

}
