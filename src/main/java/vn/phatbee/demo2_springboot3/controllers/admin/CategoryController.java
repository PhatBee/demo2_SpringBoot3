package vn.phatbee.demo2_springboot3.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.phatbee.demo2_springboot3.entity.Category;
import vn.phatbee.demo2_springboot3.services.CategoryService;

import java.util.List;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {
    @Autowired
    CategoryService categoryService;

    @RequestMapping("")
    public String all(Model model){
        List<Category> list = categoryService.findAll();
        model.addAttribute("list", list);
        return "admin/category/list";
    }

    @GetMapping("/add")
    public String add(){

        return "admin/category/add";
    }
}
