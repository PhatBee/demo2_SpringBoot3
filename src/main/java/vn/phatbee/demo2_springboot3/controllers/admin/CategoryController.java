package vn.phatbee.demo2_springboot3.controllers.admin;

import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import vn.phatbee.demo2_springboot3.entity.Category;
import vn.phatbee.demo2_springboot3.models.CategoryModel;
import vn.phatbee.demo2_springboot3.services.CategoryService;

import java.util.List;
import java.util.Optional;

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

    @GetMapping("/edit/{id}")
    public ModelAndView edit(ModelMap model, @PathVariable("id") Long categoryId){
        Optional<Category> optCategory = categoryService.findById(categoryId);
        CategoryModel cateModel = new CategoryModel();

        // Kiểm tra sự tồn tại của category
        if(optCategory.isPresent()){
            Category entity = optCategory.get();

            // Copy từ entity sang Model
            BeanUtils.copyProperties(entity, cateModel);
            cateModel.setIsEdit(true);

            // Đẩy dữ liệu ra view
            model.addAttribute("category", cateModel);

            return new ModelAndView("admin/category/add", model);
        }
        model.addAttribute("message", "Category not found");
        return new ModelAndView("forward:/admin/categories", model);
    }

    @GetMapping("/delete/{id}")
    public ModelAndView delete(ModelMap model,  @PathVariable("id") Long categoryId){
        categoryService.deleteById(categoryId);
        model.addAttribute("message", "Category deleted successfully");
        return new ModelAndView("forward:/admin/categories");
    }

}
