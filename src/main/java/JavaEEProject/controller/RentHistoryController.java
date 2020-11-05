package JavaEEProject.controller;

import JavaEEProject.model.Category;
import JavaEEProject.model.Movie;
import JavaEEProject.model.RentHistory;
import JavaEEProject.model.User;
import JavaEEProject.service.CategoryService;
import JavaEEProject.service.RentHistoryService;
import JavaEEProject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class RentHistoryController {
    @Autowired
    private RentHistoryService rentHistoryService;
    @Autowired
    private UserService userService;


    private SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
   private Date date = new Date();


    @RequestMapping("/movie/rentSuccessful/{id}")
    public ModelAndView rentAdd(@PathVariable("id") long id){
        ModelAndView mv = new ModelAndView("movie/rentSuccessful");
        RentHistory rentHistories = rentHistoryService.findById(id);
        String dateToChange = rentHistories.getRentDate();
        Calendar c = Calendar.getInstance();
        try{
            //Setting the date to the given date
            c.setTime(formatter.parse(dateToChange));
        }catch(ParseException e){
            e.printStackTrace();
        }

        //Number of Days to add
        c.add(Calendar.DAY_OF_MONTH, rentHistories.getRentTime());
        //Date after adding the days to the given date
        String newDate = formatter.format(c.getTime());
    float sumPrice = (rentHistories.getMovie().getMovieRentPrice() * rentHistories.getRentTime());
        DecimalFormat df = new DecimalFormat("###.##");
        String nsumPrice = df.format(sumPrice);
        mv.addObject("rentHistory", rentHistories);
        mv.addObject("addedDaysToRentDate", newDate);
        mv.addObject("sumPrice", nsumPrice);
        return mv;
    }

    @GetMapping("/rentHistory/add")
    public ModelAndView rentAdd(Model model){
        ModelAndView mv = new ModelAndView("/movie/rentSuccessful");
        RentHistory rentHistory = new RentHistory();
        model.addAttribute("rentHistoryForm", rentHistory);
        return mv;
    }

    @PostMapping("/rentHistory/add")
    public ModelAndView rentAdd(@ModelAttribute("rentHistoryForm") RentHistory rentHistory, BindingResult bindingResult, Principal principal){

        User user = userService.findByUsername(principal.getName());
        rentHistory.setUser(user);
        rentHistory.setRentDate(formatter.format(date));

        rentHistoryService.save(rentHistory);
        return new ModelAndView("redirect:/movie/rentSuccessful/"+rentHistory.getId());
    }
//
//    @GetMapping("/admin/category/{id}/delete")
//    public ModelAndView categoryDelete(@PathVariable(value="id") long id){
//        rentHistoryService.delete(rentHistoryService.findById(id));
//        return new ModelAndView("redirect:/admin/category");
//    }
//    @GetMapping("/admin/category/{id}/edit")
//    public ModelAndView categoryEdit(@PathVariable(value="id") long id, Model model){
//        ModelAndView mv = new ModelAndView("category/edit");
//        RentHistory rentHistory = rentHistoryService.findById(id);
//        model.addAttribute("rentHistoryForm", rentHistory);
//        return mv;
//    }
//
//    @PostMapping("/admin/category/edit")
//    public ModelAndView bicycleEdit(@ModelAttribute("category") RentHistory rentHistory, BindingResult bindingResult){
//        rentHistoryService.save(rentHistory);
//        return new ModelAndView("redirect:/admin/category");
//    }
}
