package ua.goit.timonov.enterprise.module_9.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.goit.timonov.enterprise.module_6_2.model.Employee;
import ua.goit.timonov.enterprise.module_9.service.EmployeeService;

import java.util.Map;

/**
 * Created by Alex on 17.09.2016.
 */
@Controller
@RequestMapping("/service/employee")
public class EmployeeServiceController {

    private EmployeeService employeeService;

    @Autowired
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public String serviceEmployees(Map<String, Object> model) {
        model.put("employees", employeeService.getAllEmployees());
        return "service/employee/employees";
    }
//        ModelAndView modelAndView = new ModelAndView("service/employee/employees");
//        List<EmployeeView> employeeViews = employeeService.getAllEmployees().stream()
//                .map(employee -> new EmployeeView(employee)).collect(Collectors.toList());
//        modelAndView.addObject("employees", employeeViews);
//        return modelAndView;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getEmployeeToAdd(Map<String, Object> model) {
        model.put("employeeView", new EmployeeView());
        return "service/employee/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addEmployee(Map<String, Object> model, @ModelAttribute("employeeView") EmployeeView employeeView) {
        Employee employee = employeeView.getEmployeeFromView();
        employeeService.add(employee);
        model.put("employees", employeeService.getAllEmployees());
        return "service/employee/employees";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editEmployeeById(Map<String, Object> model, @RequestParam(value="id", required=true) Integer id) {
        Employee employee = employeeService.getEmployeeById(id);
        EmployeeView employeeView = new EmployeeView(employee);
        model.put("employeeView", employeeView);
        return "service/employee/edit";
    }

    @RequestMapping(value = "/editByName", method = RequestMethod.GET)
    public String editDishByName(Map<String, Object> model, @RequestParam(value="name", required=true) String name) {
        Employee employee = employeeService.getEmployeeByName(name);
        EmployeeView employeeView = new EmployeeView(employee);
        model.put("employeeView", employeeView);
        return "service/employee/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String saveEditDish(Map<String, Object> model, @ModelAttribute("employeeView") EmployeeView employeeView) {
        Employee employee = employeeView.getEmployeeFromView();
        employeeService.update(employee);
        model.put("employees", employeeService.getAllEmployees());
        return "service/employee/employees";
    }
}
