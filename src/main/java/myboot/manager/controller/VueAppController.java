package myboot.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller()
public class VueAppController {

    @RequestMapping(value = "/home")
    private ModelAndView home() {
        return new ModelAndView("home");
    }

    @RequestMapping(value = "/auth")
    private ModelAndView auth() {
        return new ModelAndView("auth");
    }
    @RequestMapping(value = "/app")
    private ModelAndView app() {
        return new ModelAndView("app");
    }

    @RequestMapping(value = "/register")
    private ModelAndView register() {
        return new ModelAndView("register");
    }

    @RequestMapping(value = "/routage")
    private ModelAndView routage() {
        return new ModelAndView("routage");
    }

}