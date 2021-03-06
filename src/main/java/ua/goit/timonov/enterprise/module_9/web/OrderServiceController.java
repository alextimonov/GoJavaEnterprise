package ua.goit.timonov.enterprise.module_9.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.goit.timonov.enterprise.module_6_2.model.Employee;
import ua.goit.timonov.enterprise.module_9.service.EmployeeService;
import ua.goit.timonov.enterprise.module_9.service.OrderService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

/**
 * Created by Alex on 17.09.2016.
 */
@Controller
@RequestMapping("/service/order")
public class OrderServiceController {

    public static final String ITEMS = "orders";
    public static final String PATH_ORDERS = "service/order/orders";

    private OrderService orderService;
    private EmployeeService employeeService;

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @Autowired
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public String getAllIngredients(Map<String, Object> model) {
        model.put(ITEMS, orderService.getAllOrders());
        return PATH_ORDERS;
    }

//    @RequestMapping(value = "/dishes", method = RequestMethod.GET)
//    public String getOrderDishes(Map<String, Object> model, @RequestParam(value="order", required=true) Integer id) {
//        Order order = orderService.getOrder(id);
//        model.put("dishes", order.getDishes());
//        return PATH_ORDERS;
//    }

    @RequestMapping(value = "/filterByDate", method = RequestMethod.GET)
    public String filterByDate(Map<String, Object> model, @RequestParam(value="date", required=true) Date date) {
        model.put(ITEMS, orderService.filterByDate(date));
        return PATH_ORDERS;
    }

    @RequestMapping(value = "/filterByWaiter", method = RequestMethod.GET)
    public String filterByName(Map<String, Object> model, @RequestParam(value="waiterName", required=true) String waiterName) {
        Employee waiter = employeeService.getEmployeeByName(waiterName);
        model.put(ITEMS, orderService.filterByWaiter(waiter));
        return PATH_ORDERS;
    }

    @RequestMapping(value = "/filterByTableNumber", method = RequestMethod.GET)
    public String filterByName(Map<String, Object> model, @RequestParam(value="tableNumber", required=true) Integer tableNumber) {
        model.put(ITEMS, orderService.filterByTableNumber(tableNumber));
        return PATH_ORDERS;
    }

    @InitBinder
    public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
        final SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy", locale);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

}
