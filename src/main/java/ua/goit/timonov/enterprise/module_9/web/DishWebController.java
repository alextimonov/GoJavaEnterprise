package ua.goit.timonov.enterprise.module_9.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ua.goit.timonov.enterprise.module_9.service.DishService;
import ua.goit.timonov.enterprise.module_9.service.EmployeeService;

import java.util.Map;

/**
 * Created by Alex on 01.09.2016.
 */

@Controller
public class DishWebController {

    private DishService dishService;

    @Autowired
    public void setDishService(DishService dishService) {
        this.dishService = dishService;
    }

    @RequestMapping(value = "/dishes", method = RequestMethod.GET)
    public String dishes(Map<String, Object> model) {
        model.put("dishes", dishService.getAllDishes());
        return "dishes";
    }



    @RequestMapping(value = "/dish/{dishName}", method = RequestMethod.GET)
    public ModelAndView employees(@PathVariable("dishName") String dishName) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("dish", dishService.getDishByName(dishName));
        modelAndView.setViewName("dish");
        return modelAndView;
    }
}
