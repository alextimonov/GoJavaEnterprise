package ua.goit.timonov.enterprise.module_9.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ua.goit.timonov.enterprise.module_6_2.model.Dish;
import ua.goit.timonov.enterprise.module_6_2.model.Menu;
import ua.goit.timonov.enterprise.module_9.service.DishService;
import ua.goit.timonov.enterprise.module_9.service.MenuService;

import java.util.Map;

/**
 * Created by Alex on 14.09.2016.
 */
@Controller
@RequestMapping("/service/menu")
public class MenuServiceController {

    private MenuService menuService;
    private DishService dishService;

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @Autowired
    public void setDishService(DishService dishService) {
        this.dishService = dishService;
    }

    @RequestMapping(value = "/menus", method = RequestMethod.GET)
    public String serviceMenus(Map<String, Object> model) {
        model.put("menus", menuService.getAllMenus());
        return "service/menu/menus";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getMenuToAdd(Map<String, Object> model) {
        model.put("menuAttribute", new Menu());
        return "service/menu/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addDish(Map<String, Object> model, @ModelAttribute("menuAttribute") Menu menu) {
        menuService.add(menu);
        model.put("menus", menuService.getAllMenus());
        return "service/menu/menus";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteDishById(Map<String, Object> model, @RequestParam(value="id", required=true) Integer menuId) {
        menuService.delete(menuId);
        model.put("menus", menuService.getAllMenus());
        return "service/menu/menus";
    }

    @RequestMapping(value = "/deleteByName", method = RequestMethod.GET)
    public String deleteDishByName(Map<String, Object> model, @RequestParam(value="name", required=true) String menuName) {
        menuService.delete(menuName);
        model.put("menus", menuService.getAllMenus());
        return "service/menu/menus";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editDishById(Map<String, Object> model, @RequestParam(value="id", required=true) Integer id) {
        Menu menu = menuService.searchMenuById(id);
        model.put("menuExisting", menu);
        return "service/menu/edit";
    }

    @RequestMapping(value = "/editByName", method = RequestMethod.GET)
    public String editDishByName(Map<String, Object> model, @RequestParam(value="name", required=true) String name) {
        Menu menu = menuService.searchMenuByName(name);
        model.put("menuExisting", menu);
        return "service/menu/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String saveEditDish(Map<String, Object> model, @ModelAttribute("menuExisting") Menu menu) {
        menuService.update(menu);
        model.put("menus", menuService.getAllMenus());
        return "service/menu/menus";
    }

    @RequestMapping(value = "/{menuId}/addDish", method = RequestMethod.GET)
    public String addDishToMenu(Map<String, Object> model, @PathVariable Integer menuId,
                                @RequestParam(value = "id", required = true) Integer id) {
        Menu menu = menuService.searchMenuById(menuId);
        Dish dishFound = dishService.searchDishById(id);
        menuService.addDish(menu, dishFound);
        model.put("menuExisting", menu);
        return "service/menu/edit";
    }

    @RequestMapping(value = "/{menuId}/addDishByName", method = RequestMethod.GET)
    public String addDishToMenuByName(Map<String, Object> model, @PathVariable Integer menuId,
                                @RequestParam(value = "name", required = true) String name) {
        Menu menu = menuService.searchMenuById(menuId);
        Dish dish = dishService.searchDishByName(name);
        menuService.addDish(menu, dish);
        model.put("menuExisting", menu);
        return "service/menu/edit";
    }

    @RequestMapping(value = "/{menuId}/deleteDish", method = RequestMethod.GET)
    public String deleteDishFromMenu(Map<String, Object> model, @PathVariable Integer menuId,
                                @RequestParam(value = "id", required = true) Integer id) {
        Menu menu = menuService.searchMenuById(menuId);
        Dish dish = dishService.searchDishById(id);
        menuService.deleteDish(menu, dish);
        model.put("menuExisting", menu);
        return "service/menu/edit";
    }

    @RequestMapping(value = "/{menuId}/deleteDishByName", method = RequestMethod.GET)
    public String deleteDishByNameFromMenu(Map<String, Object> model, @PathVariable Integer menuId,
                                      @RequestParam(value = "name", required = true) String name) {
        Menu menu = menuService.searchMenuById(menuId);
        Dish dish = dishService.searchDishByName(name);
        menuService.deleteDish(menu, dish);
        model.put("menuExisting", menu);
        return "service/menu/edit";
    }

}
