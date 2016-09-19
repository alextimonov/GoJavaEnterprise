package ua.goit.timonov.enterprise.module_6_2.dao.jdbc;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;
import ua.goit.timonov.enterprise.module_6_2.dao.OrderDAO;
import ua.goit.timonov.enterprise.module_6_2.model.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * JDBC implementation of OrderDAO
 */
public class JdbcOrderDAO implements OrderDAO {

    private JdbcTemplate template;
    private JdbcDishDAO jdbcDishDAO;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.template = jdbcTemplate;
    }

    public void setJdbcDishDAO(JdbcDishDAO jdbcDishDAO) {
        this.jdbcDishDAO = jdbcDishDAO;
    }

    /**
     * adds new order to DB
     * @param order      given order
     */
    @Override
    @Transactional
    public void add(Order order) {
        String sql = "INSERT INTO Orders VALUES ((SELECT max(Orders.id) FROM Orders) + 1, ?, ?, ?, false)";
        template.update(sql,
                order.getWaiter(),
                order.getTableNumber(),
                order.getDate());
    }

    /**
     * searches order in DB by its ID
     * @param orderId        order's ID to find
     * @return          found order
     * throws           EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional
    public Order search(Integer orderId) {
        String sql = "SELECT * FROM Orders WHERE id = ?";
        Map<String, Object> map = template.queryForMap(sql, orderId);
        return getOrderFromMap(map);
    }

    /**
     * deletes order from DB by its ID
     * @param orderId           order's ID to delete
     * throws                   EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional
    public void delete(int orderId) {
        if (orderIsOpen(orderId)) {
            deleteOrder(orderId);
        }
        else {
            throw new IllegalArgumentException("Order is not open");
        }

    }

    // returns true if order (given by its ID) is open
    @Transactional
    private boolean orderIsOpen(int orderId) {
        String sql = "SELECT closed FROM Orders WHERE id = ?";
        Map<String, Object> map = template.queryForMap(sql, orderId);
        boolean closed = (Boolean) map.get("closed");
        return !closed;
    }

    // deletes order from auxiliary table
    @Transactional
    private void deleteOrder(int orderId) {
        String sql = "DELETE FROM Dish_to_orders WHERE order_id = ?; " +
                "DELETE FROM Orders WHERE id = ?;";
        template.update(sql, orderId, orderId);
    }

    /**
     * adds dish to order by order's ID
     * @param orderId       order's ID
     * @param dish          dish to be added
     * throws               EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional
    public void addDish(int orderId, Dish dish) {
        if (orderIsOpen(orderId)) {
            String sql = "INSERT INTO Dish_to_orders VALUES (?, ?)";
            template.update(sql, orderId, dish.getId());
        }
        else {
            throw new IllegalArgumentException("Order is not open");
        }
    }

    /**
     * deletes dish from order
     * @param orderId       order's ID
     * @param dish          dish to be deleted
     * throws               EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional
    public void deleteDish(int orderId, Dish dish) {
        if (orderIsOpen(orderId)) {
            String sql = "DELETE FROM Dish_to_orders WHERE (order_id = ? AND dish_id =?)";
            template.update(sql, orderId, dish.getId());
        }
        else {
            throw new IllegalArgumentException("Order is not open");
        }
    }

    /**
     * sets order to closed
     * @param orderId
     */
    @Override
    @Transactional
    public void setClosed(int orderId) {
        if (orderIsOpen(orderId)) {
            String sql = "UPDATE Orders SET closed = 'TRUE' WHERE id = ?";
            template.update(sql, orderId);
        }
        else {
            throw new IllegalArgumentException("Order is not open");
        }
    }

    /**
     * finds list of all open orders in DB
     * @return          list of open orders
     * throws           EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional
    public List<Order> getOpenOrders() {
        String sql = "SELECT * FROM Orders WHERE closed = 'FALSE'";
        return getOrdersWithSql(sql);
    }

    // returns orders from DB with given SQL
    private List<Order> getOrdersWithSql(String sql) {
        List<Map<String, Object>> mapList = template.queryForList(sql);
        return mapList.stream()
                .map(row -> getOrderFromMap(row))
                .collect(Collectors.toList());
    }

    /**
     * finds list of all closed orders in DB
     * @return          list of closed orders
     * throws           EmptyResultDataAccessException, DataAccessException
     */
    @Override
    @Transactional
    public List<Order> getClosedOrders() {
        String sql = "SELECT * FROM Orders WHERE closed = 'TRUE'";
        return getOrdersWithSql(sql);
    }

    @Override
    @Transactional
    public List<Order> getAllOrders() {
        String sql = "SELECT * FROM Orders";
        return getOrdersWithSql(sql);
    }

    @Override
    @Transactional
    public List<Order> getOrdersByTableNumber(int tableNumber) {
        String sql = "SELECT * FROM Orders WHERE table_number = ?";
        List<Map<String, Object>> mapList = template.queryForList(sql, tableNumber);
        return mapList.stream()
                .map(row -> getOrderFromMap(row))
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public List<Order> getOrdersByWaiter(Employee waiter) {
        String sql = "SELECT * FROM Orders WHERE employee_id = ?";
        List<Map<String, Object>> mapList = template.queryForList(sql, waiter.getId());
        return mapList.stream()
                .map(row -> getOrderFromMap(row))
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public List<Order> getOrdersByDate(Date date) {
        String sql = "SELECT * FROM Orders WHERE date = ?";
        List<Map<String, Object>> mapList = template.queryForList(sql, date);
        return mapList.stream()
                .map(row -> getOrderFromMap(row))
                .collect(Collectors.toList());
    }

    private Order getOrderFromMap(Map<String, Object> map) {
        Order order = new Order();
        order.setId((Integer) map.get("id"));
        order.setWaiter((Employee) map.get("employee_id"));
        order.setTableNumber((Integer) map.get("table_number"));
        order.setDate((Date) map.get("date"));
        order.setClosed((Boolean) map.get("closed"));
        List<Dish> dishes = findDishesByOrderId(order.getId());
        order.setDishes(dishes);
        return order;
    }

    @Transactional
    private List<Dish> findDishesByOrderId(int orderId) {
        String sql = "SELECT Dish.id, Dish.name, Dish.description, Dish.cost, Dish.weight\n" +
                "FROM (Dish_to_orders INNER JOIN Dish ON Dish_to_orders.dish_id = Dish.id) \n" +
                "WHERE Dish_to_orders.order_id = ?";
        List<Map<String, Object>> mapList = template.queryForList(sql, orderId);

        List<Dish> result = new ArrayList<>();
        return mapList.stream()
                .map(row -> jdbcDishDAO.getDishFromMap(row))
                .collect(Collectors.toList());
        return mapList.stream()
                .map(row -> jdbcDishDAO.getDishFromMap(row))
                .collect(Collectors.toList());
    }
}
