package ua.goit.timonov.enterprise.module_9.web;

import org.springframework.format.annotation.DateTimeFormat;
import ua.goit.timonov.enterprise.module_6_2.model.Employee;
import ua.goit.timonov.enterprise.module_6_2.model.Job;
import ua.goit.timonov.enterprise.module_6_2.model.Position;

import java.util.Date;

/**
 * Created by Alex on 17.09.2016.
 */
public class EmployeeView {

    /* unique id in the DB table */
    private int id;

    /* employee's surname */
    private String surname;

    /* employee's name */
    private String name;

    /* employee's date of birthday */
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date birthday;

    /* employee's salary */
    private float salary;

    /* employee's position */
    private String position;
//    private Position position;

    public EmployeeView() {
    }

    public EmployeeView(Employee employee) {
        id = employee.getId();
        name = employee.getName();
        surname = employee.getSurname();
        birthday = employee.getBirthday();
        salary = employee.getSalary();
        position = employee.getJob().getPosition().toString().toLowerCase();
    }

    public Employee getEmployeeFromView() {
        Employee employee = new Employee();
        employee.setId(id);
        employee.setName(name);
        employee.setSurname(surname);
        employee.setBirthday(birthday);
        employee.setSalary(salary);
        employee.setJob(new Job(Position.byName(position.toUpperCase())));
        return employee;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

}
