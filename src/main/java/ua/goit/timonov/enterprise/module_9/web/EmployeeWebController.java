package ua.goit.timonov.enterprise.module_9.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ua.goit.timonov.enterprise.module_6_2.model.Employee;
import ua.goit.timonov.enterprise.module_9.service.EmployeeService;

import java.util.List;
import java.util.Map;

/**
 * Controller for mapping requests to Employee pages
 */
@Controller
public class EmployeeWebController {

    private ObjectMapper objectMapper = new ObjectMapper();
    private EmployeeService employeeService;

    @Autowired
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public String getEmployees(Map<String, Object> model) {
        model.put("employees", employeeService.getAllEmployees());
        return "employees";
    }

    @RequestMapping(value = "/employee/{employeeName}", method = RequestMethod.GET)
    public ModelAndView getEmployeeWithName(@PathVariable("employeeName") String employeeName) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("employee", employeeService.getEmployeeByName(employeeName));
        modelAndView.setViewName("employee");
        return modelAndView;
    }

    @RequestMapping(value = "/waiters", method = RequestMethod.GET)
    public String waiters(Map<String, Object> model) {
        model.put("waiters", employeeService.getWaiters());
        return "waiters";
    }

    @RequestMapping(value = "/restEmployees", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView restEmployees() throws JsonProcessingException {
        List<Employee> employees = employeeService.getAllEmployees();
        ModelAndView modelAndView = new ModelAndView("restEmployees");
        modelAndView.addObject("employees", objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(employees));
        return modelAndView;
    }

    @RequestMapping(value = "/restEmployees/{employeeName}", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView getEmployeeByName(@PathVariable String employeeName) {
        String jsonEmployee;
        try {
            int employeeId = Integer.valueOf(employeeName);
            jsonEmployee = getEmployeeFromDatabase(employeeId);
        }
        catch(NumberFormatException e) {
            jsonEmployee = searchEmployeeByNameOrSurname(employeeName);
        }
        ModelAndView modelAndView = new ModelAndView("restEmployees");
        modelAndView.addObject("employees", jsonEmployee);
        return modelAndView;
    }

    private String getEmployeeFromDatabase(int employeeId) {
        try {
            Employee employee = employeeService.searchById(employeeId);
            return objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(employee);
        }
        catch (RuntimeException | JsonProcessingException e) {
            return "There's no employee with id = " + employeeId + " in database!";
        }
    }

    private String searchEmployeeByNameOrSurname(String employeeName) {
        try {
            Employee employee = employeeService.searchByName(employeeName);
            return objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(employee);
        }
        catch (IndexOutOfBoundsException | JsonProcessingException e) {
            return getEmployeeFromDatabase(employeeName);
        }
    }

    private String getEmployeeFromDatabase(String employeeSurname) {
        try {
            Employee employee = employeeService.searchByName("", employeeSurname);
            return objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(employee);
        }
        catch (RuntimeException | JsonProcessingException e) {
            return "There's no employee with name or surname " + employeeSurname + " in database!";
        }
    }

    @RequestMapping(value = "/restEmployees/{employeeName}/{employeeSurname}", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView getEmployeeByFullName(@PathVariable String employeeName, @PathVariable String employeeSurname) {
        String jsonEmployee = getEmployeeFromDatabase(employeeName, employeeSurname);
        ModelAndView modelAndView = new ModelAndView("restEmployees");
        modelAndView.addObject("employees", jsonEmployee);
        return modelAndView;
    }

    private String getEmployeeFromDatabase(String employeeName, String employeeSurname) {
        try {
            Employee employee = employeeService.searchByName(employeeName, employeeSurname);
            return objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(employee);
        }
        catch (RuntimeException | JsonProcessingException e) {
            return "There's no employee with name " + employeeName + " and surname " + employeeSurname + " in database!";
        }
    }
}

