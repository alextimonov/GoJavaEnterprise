package ua.goit.timonov.enterprise.module_9.service;

import org.springframework.transaction.annotation.Transactional;
import ua.goit.timonov.enterprise.module_6_2.dao.MenuDAO;
import ua.goit.timonov.enterprise.module_6_2.model.Menu;

import java.util.List;

/**
 * Created by Alex on 01.09.2016.
 */
public class MenuService {

    private MenuDAO menuDAO;

    public void setMenuDAO(MenuDAO menuDAO) {
        this.menuDAO = menuDAO;
    }

    public MenuDAO getMenuDAO() {
        return menuDAO;
    }

    @Transactional
    public List<Menu> getAllMenus() {
        return menuDAO.getAll();
    }

    @Transactional
    public Menu getMenuByName(String menuName) {
        return menuDAO.search(menuName);
    }
}
