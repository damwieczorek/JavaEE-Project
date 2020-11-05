package JavaEEProject.controller;

import JavaEEProject.model.Category;
import JavaEEProject.model.Comments;
import JavaEEProject.service.CategoryService;
import JavaEEProject.service.CommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CommentsController {
    @Autowired
    private CommentsService commentsService;

    @RequestMapping("/admin/comments")
    public ModelAndView comments(){
        ModelAndView mv = new ModelAndView("comments/index");
        List<Comments> comments = commentsService.findAll();
        mv.addObject("comments", comments);
        return mv;
    }
    @GetMapping("/admin/comments/add")
    public ModelAndView categoryAdd(Model model){
        ModelAndView mv = new ModelAndView("comments/index");
        Comments comments = new Comments();
        model.addAttribute("commentsForm", comments);
        return mv;
    }
    @PostMapping("/admin/comments/add")
    public ModelAndView commentsAdd(@ModelAttribute("commentsForm") Comments comments, BindingResult bindingResult){
        commentsService.save(comments);
        return new ModelAndView("redirect:/admin/comments");
    }

    @GetMapping("/admin/comments/{id}/delete")
    public ModelAndView commentsDelete(@PathVariable(value="id") long id){
        commentsService.delete(commentsService.findById(id));
        return new ModelAndView("redirect:/admin/comments");
    }



}
