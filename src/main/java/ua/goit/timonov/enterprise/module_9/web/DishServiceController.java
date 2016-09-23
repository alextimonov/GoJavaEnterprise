package ua.goit.timonov.enterprise.module_9.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.goit.timonov.enterprise.module_6_2.exceptions.NoItemInDbException;
import ua.goit.timonov.enterprise.module_6_2.model.Dish;
import ua.goit.timonov.enterprise.module_9.service.DishService;
import ua.goit.timonov.enterprise.module_9.web.validate.DishValidate;

import javax.persistence.PersistenceException;
import java.util.Map;

/**
 * Spring MVC controller for mapping service pages for dishes
 */
@Controller
@RequestMapping("/service/dish")
public class DishServiceController {

    public static final String PATH_DISHES = "service/dish/dishes";
    public static final String PATH_EDIT = "service/dish/edit";
    public static final String PATH_ADD = "service/dish/add";
    public static final String PATH_ERROR = "service/errorMessage";
    public static final String ERROR_MESSAGE = "errorMessage";
    public static final String PATH_DELETE = "service/dish/delete";
    private DishService dishService;

    @Autowired
    public DishServiceController(DishService dishService) {
        this.dishService = dishService;
    }

    @RequestMapping(value = "/dishes", method = RequestMethod.GET)
    public String getAllDishes(Map<String, Object> model) {
        model.put("dishes", dishService.getAllDishes());
        return PATH_DISHES;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getDishToAdd(Map<String, Object> model) {
        model.put("dishValidate", new DishValidate());
        model.put("dishAttribute", new Dish());
        return PATH_ADD;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addDish(Map<String, Object> model, @ModelAttribute("dishAttribute") Dish dish,
                          @ModelAttribute("dishValidate") DishValidate dishValidate) {
        if (dishValidate.isValid(dish)) {
            if (checkForDishWithSameName(model, dish))
                return PATH_ERROR;
            dishService.add(dish);
            model.put("dishes", dishService.getAllDishes());
            return PATH_DISHES;
        }
        else {
            model.put("dishValidate", dishValidate);
            model.put("dishAttribute", dish);
            return PATH_ADD;
        }
    }

    private boolean checkForDishWithSameName(Map<String, Object> model, Dish newDish) {
        try {
            Dish foundDish = dishService.searchDishByName(newDish.getName());
            if (newDishHasDifferentId(newDish, foundDish)) {
                model.put(ERROR_MESSAGE, "There is dish with name \"" + newDish.getName() + "\" already in database");
                return true;
            }
            else
                return false;
        }
        catch (NoItemInDbException e) {
            return false;
        }
    }

    private boolean newDishHasDifferentId(Dish newDish, Dish foundDish) {
        return newDish.getId() != foundDish.getId();
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String askForDeleteDishById(Map<String, Object> model, @RequestParam(value="id", required=true) Integer id) {
        try {
            Dish dish = dishService.searchDishById(id);
            model.put("dishToDelete", dish);
            return PATH_DELETE;
        }
        catch (NoItemInDbException e) {
            model.put(ERROR_MESSAGE, e.getMessage());
            return PATH_ERROR;
        }
    }

    @RequestMapping(value = "/deleteByName", method = RequestMethod.GET)
    public String askForDeleteDishByName(Map<String, Object> model, @RequestParam(value="name", required=true) String dishName) {
        try {
            Dish dish = dishService.searchDishByName(dishName);
            model.put("dishToDelete", dish);
            return PATH_DELETE;
        }
        catch (NoItemInDbException e) {
            model.put(ERROR_MESSAGE, e.getMessage());
            return PATH_ERROR;
        }
    }

    @RequestMapping(value = "/deleteConfirmed", method = RequestMethod.POST)
    public String deleteDish(Map<String, Object> model, @RequestParam(value="id", required=true) Integer id) {
        try {
            dishService.delete(id);
            model.put("dishes", dishService.getAllDishes());
            return PATH_DISHES;
        }
        catch (PersistenceException e) {
            model.put(ERROR_MESSAGE, "Dish with id=" + id + " can not be deleted due to using in another tables");
            model.put("additionalMessage", e.getMessage());
            return PATH_ERROR;
        }
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editDishById(Map<String, Object> model, @RequestParam(value="id", required=true) Integer id) {
        try {
            Dish dish = dishService.searchDishById(id);
            model.put("dishExisting", dish);
            model.put("dishValidate", new DishValidate());
            return PATH_EDIT;
        }
        catch (NoItemInDbException e) {
            model.put(ERROR_MESSAGE, e.getMessage());
            return PATH_ERROR;
        }
    }

    @RequestMapping(value = "/editByName", method = RequestMethod.GET)
    public String editDishByName(Map<String, Object> model, @RequestParam(value="name", required=true) String name) {
        try {
            Dish dish = dishService.searchDishByName(name);
            model.put("dishExisting", dish);
            model.put("dishValidate", new DishValidate());
            return PATH_EDIT;
        }
        catch (NoItemInDbException e) {
            model.put(ERROR_MESSAGE, e.getMessage());
            return PATH_ERROR;
        }
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String saveEditDish(Map<String, Object> model,
                               @RequestParam(value="id", required=true) int id,
                               @ModelAttribute("dishExisting") Dish dish,
                               @ModelAttribute("dishValidate") DishValidate dishValidate) {
        dish.setId(id);
        if (dishValidate.isValid(dish)) {
            if (checkForDishWithSameName(model, dish))
                return PATH_ERROR;
            dishService.update(dish);
            model.put("dishes", dishService.getAllDishes());
            return PATH_DISHES;
        }
        else {
            model.put("dishExisting", dish);
            model.put("dishValidate", dishValidate);
            return PATH_EDIT;
        }
    }
}