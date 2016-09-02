package ua.goit.timonov.enterprise.module_9.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ua.goit.timonov.enterprise.module_9.service.MenuService;

import java.util.Map;

/**
 * Created by Alex on 01.09.2016.
 */

@Controller
public class MenuWebController {

    private MenuService menuService;

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @RequestMapping(value = "/menus", method = RequestMethod.GET)
    public String menus(Map<String, Object> model) {
        model.put("menus", menuService.getAllMenus());
        return "menus";
    }

    @RequestMapping(value = "/menu/{menuName}", method = RequestMethod.GET)
    public ModelAndView menu(@PathVariable("menuName") String menuName) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("menu", menuService.getMenuByName(menuName));
        modelAndView.setViewName("menu");
        return modelAndView;
    }

}
