package ua.goit.timonov.enterprise.module_6_2.dao.jdbc;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ua.goit.timonov.enterprise.module_6_2.model.Dish;
import ua.goit.timonov.enterprise.module_6_2.dao.DishDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Alex on 31.07.2016.
 */
public class JdbcDishDAO implements DishDAO {

    private JdbcTemplate template;

//    private static Logger LOGGER = LoggerFactory.getLogger(JdbcEmployeeDAO.class);

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.template = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void add(Dish dish) {
        String sql = "INSERT INTO dish VALUES ((SELECT max(dish.id) FROM dish) + 1, ?, ?, ?, ?)";
        template.update(sql,
                dish.getName(),
                dish.getDescription(),
                dish.getCost(),
                dish.getWeight());
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void delete(int id) {
        search(id);
        String sql = "DELETE FROM dish WHERE id = ?";
        template.update(sql, id);
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void delete(String name) {
        search(name);
        String sql = "DELETE FROM dish WHERE name = ?";
        template.update(sql, name);
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public Dish search(String nameToFind) {
        String sql = "SELECT * FROM dish WHERE name = ?";
        Map<String, Object> map = template.queryForMap(sql, nameToFind);
        return getDishFromMap(map);
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public Dish search(int id) {
        String sql = "SELECT * FROM dish WHERE id = ?";
        Map<String, Object> map = template.queryForMap(sql, id);
        return getDishFromMap(map);
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public List<Dish> getAll() {
        List<Dish> result = new ArrayList<>();
        String sql = "SELECT * FROM dish";
        List<Map<String, Object>> mapList = template.queryForList(sql);
        for (Map<String, Object> row : mapList) {
            Dish dish = getDishFromMap(row);
            result.add(dish);
        }
        return result;
    }

    @Transactional(propagation = Propagation.MANDATORY)
    Dish getDishFromMap(Map<String, Object> map) {
        Dish dish = new Dish();
        dish.setId((Integer) map.get("id"));
        dish.setName((String) map.get("name"));
        dish.setDescription((String) map.get("description"));
        dish.setCost((Float) map.get("cost"));
        dish.setWeight((Integer) map.get("weight"));
        return dish;
    }
}
