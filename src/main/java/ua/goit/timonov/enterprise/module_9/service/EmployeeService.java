package ua.goit.timonov.enterprise.module_9.service;

import org.springframework.transaction.annotation.Transactional;
import ua.goit.timonov.enterprise.module_6_2.dao.EmployeeDAO;
import ua.goit.timonov.enterprise.module_6_2.model.Employee;

import java.util.List;

/**
 * Created by Alex on 01.09.2016.
 */
public class EmployeeService {

    private EmployeeDAO employeeDAO;

    public void setEmployeeDAO(EmployeeDAO employeeDAO) {
        this.employeeDAO = employeeDAO;
    }

    @Transactional
    public List<Employee> getAllEmployees() {
        return employeeDAO.getAll();
    }

    @Transactional
    public Employee getEmployeeByName(String name) {
        return employeeDAO.search(name);
    }
}
