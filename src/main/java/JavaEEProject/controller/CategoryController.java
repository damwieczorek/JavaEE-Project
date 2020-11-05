package JavaEEProject.controller;

import JavaEEProject.model.Category;
import JavaEEProject.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/admin/category")
    public ModelAndView category(){
        ModelAndView mv = new ModelAndView("category/index");
        List<Category> category = categoryService.findAll();
        mv.addObject("categories", category);
        return mv;
    }

    @GetMapping("/admin/category/add")
    public ModelAndView categoryAdd(Model model){
        ModelAndView mv = new ModelAndView("category/add");
        Category category = new Category();
        model.addAttribute("categoryForm", category);
        return mv;
    }

    @PostMapping("/admin/category/add")
    public ModelAndView categoryAdd(@ModelAttribute("categoryForm") Category category, BindingResult bindingResult){
        categoryService.save(category);
        return new ModelAndView("redirect:/admin/category");
    }

    @GetMapping("/admin/category/{id}/delete")
    public ModelAndView categoryDelete(@PathVariable(value="id") long id){
        categoryService.delete(categoryService.findById(id));
        return new ModelAndView("redirect:/admin/category");
    }
    @GetMapping("/admin/category/{id}/edit")
    public ModelAndView categoryEdit(@PathVariable(value="id") long id, Model model){
        ModelAndView mv = new ModelAndView("category/edit");
        Category category = categoryService.findById(id);
        model.addAttribute("categoryForm", category);
        return mv;
    }

    @PostMapping("/admin/category/edit")
    public ModelAndView bicycleEdit(@ModelAttribute("category") Category category, BindingResult bindingResult){
        categoryService.save(category);
        return new ModelAndView("redirect:/admin/category");
    }
}
