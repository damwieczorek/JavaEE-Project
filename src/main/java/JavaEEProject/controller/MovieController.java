package JavaEEProject.controller;

import JavaEEProject.model.*;
import JavaEEProject.service.CategoryService;
import JavaEEProject.service.CommentsService;
import JavaEEProject.service.MovieService;
import JavaEEProject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class MovieController {
    private long movieID;
    @Autowired
    private MovieService movieService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CommentsService commentsService;
    @Autowired
    private UserService userService;
    @RequestMapping("/admin/movie")
    public ModelAndView movie(){
        ModelAndView mv = new ModelAndView("movie/index");
        List<Movie> movie = movieService.findAll();
        mv.addObject("movie", movie);
        return mv;
    }

    @GetMapping("/admin/movie/add")
    public ModelAndView movieAdd(Model model){
        ModelAndView mv = new ModelAndView("movie/add");
        List<Category> categories = categoryService.findAll();
        mv.addObject("categories", categories);
        Movie movie = new Movie();
        model.addAttribute("movieForm", movie);
        return mv;
    }

    @PostMapping("/admin/movie/add")
    public ModelAndView movieAdd(@ModelAttribute("movieForm") Movie movie, BindingResult bindingResult){
        movieService.save(movie);
        return new ModelAndView("redirect:/admin/movie");
    }

    @GetMapping("/admin/movie/{id}/delete")
    public ModelAndView movieDelete(@PathVariable(value="id") long id){
        movieService.delete(movieService.findById(id));
        return new ModelAndView("redirect:/admin/movie");
    }
    @GetMapping("/admin/movie/{id}/edit")
    public ModelAndView movieEdit(@PathVariable(value="id") long id, Model model){
        ModelAndView mv = new ModelAndView("movie/edit");
        List<Category> categories = categoryService.findAll();
        mv.addObject("categories", categories);
        Movie movie = movieService.findById(id);
        model.addAttribute("movieForm", movie);
        return mv;
    }

    @PostMapping("/admin/movie/edit")
    public ModelAndView movieEdit(@ModelAttribute("movie") Movie movie, BindingResult bindingResult){
        movieService.save(movie);
        return new ModelAndView("redirect:/admin/movie");
    }

    @GetMapping("/movie/{id}/details")
    public ModelAndView movieDetails(@PathVariable(value="id") long id,Model model){
        ModelAndView mv = new ModelAndView("movie/details");
        movieID=id;
        List<Category> categories = categoryService.findAll();
        mv.addObject("categories", categories);
        List<Comments> comments = commentsService.findAll().stream().filter(com -> com.getMovie().getId() == id).collect(Collectors.toList());
        mv.addObject("comments", comments);
        Movie movie = movieService.findById(id);
        mv.addObject("movie", movie);
        Comments comment=new Comments();
        RentHistory rentHistory=new RentHistory();
        Rating rating = new Rating();

        model.addAttribute("commentsForm", comment);
        model.addAttribute("ratingForm", rating);
        model.addAttribute("rentHistoryForm", rentHistory);
        return mv;
    }


    @PostMapping("/movie/details")
    public ModelAndView movieAddComment(@ModelAttribute("commentsForm")Comments comments, BindingResult bindingResult, Principal principal){
        User user = userService.findByUsername(principal.getName());
        comments.setUser(user);
        commentsService.save(comments);

        return new ModelAndView("redirect:/movie/"+movieID+"/details");
    }



}
