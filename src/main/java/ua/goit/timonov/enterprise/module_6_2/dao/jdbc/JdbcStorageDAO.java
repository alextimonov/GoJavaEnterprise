package ua.goit.timonov.enterprise.module_6_2.dao.jdbc;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ua.goit.timonov.enterprise.module_6_2.model.Ingredient;
import ua.goit.timonov.enterprise.module_6_2.dao.StorageDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * JDBC implementation of StorageDAO
 */
public class JdbcStorageDAO implements StorageDAO {

    private JdbcTemplate template;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.template = jdbcTemplate;
    }

    /**
     * finds list of all ingredients in DB
     * @return              list of ingredients
     * throws               EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public List<Ingredient> getAll() {
        List<Ingredient> result = new ArrayList<>();
        String sql = "SELECT * FROM ingredient";
        List<Map<String, Object>> mapList = template.queryForList(sql);
        for (Map<String, Object> row : mapList) {
            Ingredient ingredient = getIngredientFromMap(row);
            result.add(ingredient);
        }
        return result;
    }

    /**
     * adds new ingredient to DB
     * @param ingredient      given ingredient
     */
    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void add(Ingredient ingredient) {
        String sql = "INSERT INTO ingredient VALUES ((SELECT max(id) FROM ingredient) + 1, ?, ?)";
        template.update(sql, ingredient.getName(), ingredient.getAmount());
    }

    /**
     * searches ingredient in DB by its ID
     * @param id        ingredient's ID to find
     * @return          found ingredient
     * throws           EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public Ingredient search(int id) {
        String sql = "SELECT * FROM ingredient WHERE id = ?";
        Map<String, Object> map = template.queryForMap(sql, id);
        Ingredient ingredient = getIngredientFromMap(map);
        return ingredient;
    }

    /**
     * searches ingredient in DB by name
     * @param name       name of ingredient to find
     * @return           found ingredient
     * throws            EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public Ingredient search(String name) {
        String sql = "SELECT * FROM ingredient WHERE ingredient.name = ?";
        Map<String, Object> map = template.queryForMap(sql, name);
        Ingredient ingredient = getIngredientFromMap(map);
        return ingredient;
    }

    /**
     * deletes ingredient from DB by its ID
     * @param id            ingredient's ID to delete
     * throws               EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void delete(int id) {
        search(id);
        String sql = "DELETE FROM ingredient WHERE id = ?";
        template.update(sql, id);
    }

    /**
     * deletes ingredient from DB by its name
     * @param name           name of ingredient to delete
     * throws                EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void delete(String name) {
        search(name);
        String sql = "DELETE FROM ingredient WHERE name = ?";
        template.update(sql, name);
    }

    /**
     * changes amount of ingredient
     * @param name        ingredient's name
     * @param difference            difference to be added to current amount
     * throws                       EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void changeAmount(String name, int difference) {
        String sql = "UPDATE ingredient SET amount = (SELECT amount FROM ingredient WHERE name = ?) + ? WHERE name = ?";
        template.update(sql, name, difference, name);
    }

    // gets ingredient from SQL query's map
    @Transactional(propagation = Propagation.MANDATORY)
    private Ingredient getIngredientFromMap(Map<String, Object> map) {
        Ingredient ingredient = new Ingredient();
        ingredient.setId((Integer) map.get("id"));
        ingredient.setName((String) map.get("name"));
        ingredient.setAmount((Integer) map.get("amount"));
        return ingredient;
    }

    /**
     * finds list of terminating ingredients with amount less than given limit
     * @param limit                 limit to chose an ingredient
     * @return                      list of ingredient
     */
    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public List<Ingredient> getTerminatingIngredients(int limit) {
        List<Ingredient> result = new ArrayList<>();
        String sql = "SELECT * FROM ingredient WHERE amount <= ?";
        List<Map<String, Object>> mapList = template.queryForList(sql, limit);
        for (Map<String, Object> row : mapList) {
            Ingredient ingredient = getIngredientFromMap(row);
            result.add(ingredient);
        }
        return result;
    }
}
