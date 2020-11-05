package JavaEEProject.controller;

import JavaEEProject.model.*;
import JavaEEProject.repository.CategoryRepository;
import JavaEEProject.service.*;
import JavaEEProject.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private MovieService movieService;
    @Autowired
    private RentHistoryService rentHistoryService;

    @RequestMapping(value = "/admin")
    public String admin(Model model) {

        return "admin";
    }
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        return "redirect:/index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public ModelAndView welcome(Model model) {
        ModelAndView mv = new ModelAndView("index");
        List<Category> category = categoryService.findAll();
        List<Movie> movie = movieService.findAll();

        mv.addObject("categories", category);
        mv.addObject("movies", movie);
        return mv;

    }
    @RequestMapping("/manage")
    public ModelAndView manage(){
        ModelAndView mv = new ModelAndView("user/manage");
        List<Movie> movie = movieService.findAll();
        mv.addObject("movie", movie);
        List<RentHistory> rentHistories = rentHistoryService.findAll();

        mv.addObject("rentHistory", rentHistories);

        return mv;
    }
}
