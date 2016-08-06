package ua.goit.timonov.enterprise.module_6_2.dao.jdbc;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ua.goit.timonov.enterprise.module_6_2.model.Employee;
import ua.goit.timonov.enterprise.module_6_2.dao.EmployeeDAO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Alex on 31.07.2016.
 */
public class JdbcEmployeeDAO implements EmployeeDAO {

    private JdbcTemplate template;

//    private static Logger LOGGER = LoggerFactory.getLogger(JdbcEmployeeDAO.class);

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.template = jdbcTemplate;
    }

    /**
     * @param employee
     * throws IllegalArgumentException
     */
    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void add(Employee employee) {
        if (isValidPosition(employee.getPosition())) {
            String sql = "INSERT INTO employee VALUES ((SELECT max(EMPLOYEE.id) FROM EMPLOYEE) + 1, ?, ?, ?, " +
                    "(SELECT jobs.id FROM JOBS WHERE jobs.position = ?), ?)";
            template.update(sql,
                    employee.getSurname(),
                    employee.getName(),
                    employee.getBirthday(),
                    employee.getPosition(),
                    employee.getSalary());
        }
        else
            throw new IllegalArgumentException("UNSUCCESSFUL! Unable to add employee. Such position don't exist:");
    }

    @Transactional(propagation = Propagation.MANDATORY)
    private boolean isValidPosition(String position) {
        String sql = "SELECT * FROM jobs WHERE position = ?";
        List<Map<String, Object>> listMap= template.queryForList(sql, position);
        return !listMap.isEmpty();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void delete(int id) {
            search(id);
            String sql = "DELETE FROM employee WHERE id = ?";
            template.update(sql, id);
    }

    private boolean isValidId(int id) {
        String sql = "SELECT * FROM employee WHERE id = ?";
        List<Map<String, Object>> listMap= template.queryForList(sql, id);
        return !listMap.isEmpty();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void delete(String surname, String name) {
            search(surname, name);
            String sql = "DELETE FROM employee WHERE surname = ? AND name = ?";
            template.update(sql, surname, name);
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public Employee search(String surnameToSearch, String nameToSearch) {
        String sql = "SELECT employee.id, employee.surname, employee.name, JOBS.position, employee.birthday, employee.salary " +
                "FROM EMPLOYEE INNER JOIN JOBS ON EMPLOYEE.position_id = JOBS.id WHERE employee.surname = ? AND employee.name = ?";
        Map<String, Object> map = template.queryForMap(sql, surnameToSearch, nameToSearch);
        Employee employee = getEmployeeFromMap(map);
        return employee;
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public Employee search(int id) {
        String sql = "SELECT employee.id, employee.surname, employee.name, JOBS.position, employee.birthday, employee.salary " +
                "FROM EMPLOYEE INNER JOIN JOBS ON EMPLOYEE.position_id = JOBS.id WHERE employee.id = ?";
        Map<String, Object> map = template.queryForMap(sql, id);
        Employee employee = getEmployeeFromMap(map);
        return employee;
    }

    @Transactional(propagation = Propagation.MANDATORY)
    private Employee getEmployeeFromMap(Map<String, Object> map) {
        Employee employee = new Employee();
        employee.setId((Integer) map.get("id"));
        employee.setSurname((String) map.get("surname"));
        employee.setName((String) map.get("name"));
        employee.setPosition((String) map.get("position"));
        employee.setBirthday((Date) map.get("birthday"));
        employee.setSalary((Float) map.get("salary"));
        return employee;
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public List<Employee> getAll() {
        List<Employee> result = new ArrayList<>();
        String sql = "SELECT EMPLOYEE.id, EMPLOYEE.surname, EMPLOYEE.name, JOBS.position, EMPLOYEE.birthday, EMPLOYEE.salary\n" +
                "FROM EMPLOYEE INNER JOIN JOBS ON EMPLOYEE.position_id = JOBS.id";
        List<Map<String, Object>> mapList = template.queryForList(sql);
        for (Map<String, Object> row : mapList) {
            Employee employee = getEmployeeFromMap(row);
            result.add(employee);
        }
        return result;
    }

}
