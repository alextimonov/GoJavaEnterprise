package ua.goit.timonov.enterprise.module_9.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.goit.timonov.enterprise.module_6_2.model.Ingredient;
import ua.goit.timonov.enterprise.module_9.service.StorageService;

import java.util.Map;

/**
 * Created by Alex on 17.09.2016.
 */

@Controller
@RequestMapping("/service/storage")
public class StorageServiceController {

    public static final String PATH_INGREDIENTS = "service/storage/ingredients";
    public static final String PATH_ADD = "service/storage/add";
    public static final String ITEMS = "ingredients";
    public static final String ONE_ITEM = "ingredient";
    public static final String PATH_EDIT = "service/storage/edit";

    private StorageService storageService;

    @Autowired
    public void setStorageService(StorageService storageService) {
        this.storageService = storageService;
    }

    @RequestMapping(value = "/ingredients", method = RequestMethod.GET)
    public String getAllIngredients(Map<String, Object> model) {
        model.put(ITEMS, storageService.getAllIngredients());
        return PATH_INGREDIENTS;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getIngredientToAdd(Map<String, Object> model) {
        model.put(ONE_ITEM, new Ingredient());
        return PATH_ADD;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addIngredient(Map<String, Object> model, @ModelAttribute(ONE_ITEM) Ingredient ingredient) {
        storageService.add(ingredient);
        model.put(ITEMS, storageService.getAllIngredients());
        return PATH_INGREDIENTS;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteIngredientById(Map<String, Object> model, @RequestParam(value="id", required=true) Integer id) {
        storageService.delete(id);
        model.put(ITEMS, storageService.getAllIngredients());
        return PATH_INGREDIENTS;
    }

    @RequestMapping(value = "/deleteByName", method = RequestMethod.GET)
    public String deleteIngerdientByName(Map<String, Object> model, @RequestParam(value="name", required=true) String name) {
        storageService.delete(name);
        model.put(ITEMS, storageService.getAllIngredients());
        return PATH_INGREDIENTS;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editIngredientById(Map<String, Object> model, @RequestParam(value="id", required=true) Integer id) {
        Ingredient item = storageService.searchById(id);
        model.put(ONE_ITEM, item);
        return PATH_EDIT;
    }

    @RequestMapping(value = "/editByName", method = RequestMethod.GET)
    public String editDishByName(Map<String, Object> model, @RequestParam(value="name", required=true) String name) {
        Ingredient item = storageService.searchByName(name);
        model.put(ONE_ITEM, item);
        return PATH_EDIT;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String saveEditIngredient(Map<String, Object> model, @ModelAttribute(ONE_ITEM) Ingredient item) {
        storageService.update(item);
        model.put(ITEMS, storageService.getAllIngredients());
        return PATH_INGREDIENTS;
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public String filterByName(Map<String, Object> model, @RequestParam(value="name", required=true) String startChars) {
        model.put(ITEMS, storageService.filterWithStartChars(startChars));
        return PATH_INGREDIENTS;
    }
}
