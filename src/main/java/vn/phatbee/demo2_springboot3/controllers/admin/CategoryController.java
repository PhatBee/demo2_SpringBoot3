package vn.phatbee.demo2_springboot3.controllers.admin;

import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import vn.phatbee.demo2_springboot3.entity.Category;
import vn.phatbee.demo2_springboot3.models.CategoryModel;
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
    public String add(Model model){
        CategoryModel category = new CategoryModel();
        category.setIsEdit(false);
        model.addAttribute("category", category);
        return "admin/category/add";
    }

    @PostMapping("/save")
    public ModelAndView saveOrUpdate(ModelMap model  , @Valid @ModelAttribute("category") CategoryModel cateModel, BindingResult result) {
        if(result.hasErrors()){
            return new ModelAndView("admin/category/add");
        }
        Category entity = new Category();

        // Copy từ model sang enity
        BeanUtils.copyProperties(cateModel, entity);

        // Gọi hàm save trong service
        categoryService.save(entity);

        // Đưa thông báo về cho message
        String message = "";
        if (cateModel.getIsEdit()) {
            message = "Category edited successfully";
        } else {
            message = "Category is saved successfully";
        }
        model.addAttribute("message", message);

        // Redirect về URL Controller
        return new ModelAndView("forward:/admin/categories", model);
    }

}
