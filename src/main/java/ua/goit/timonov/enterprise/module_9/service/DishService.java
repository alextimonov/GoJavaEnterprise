package ua.goit.timonov.enterprise.module_9.service;

import org.springframework.transaction.annotation.Transactional;
import ua.goit.timonov.enterprise.module_6_2.dao.DishDAO;
import ua.goit.timonov.enterprise.module_6_2.model.Dish;

import java.util.List;

/**
 * Created by Alex on 01.09.2016.
 */
public class DishService {

    private DishDAO dishDAO;

    public void setDishDAO(DishDAO dishDAO) {
        this.dishDAO = dishDAO;
    }

    public DishDAO getDishDAO() {
        return dishDAO;
    }

    @Transactional
    public List<Dish> getAllDishes() {
        return dishDAO.getAll();
    }

    @Transactional
    public Dish getDishByName(String dishName) {
        return dishDAO.search(dishName);
    }
}
