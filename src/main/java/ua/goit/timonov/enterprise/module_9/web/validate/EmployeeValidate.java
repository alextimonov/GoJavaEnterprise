package ua.goit.timonov.enterprise.module_9.web.validate;

import org.apache.commons.lang3.StringUtils;
import ua.goit.timonov.enterprise.module_6_2.model.Position;
import ua.goit.timonov.enterprise.module_9.web.EmployeeView;

/**
 * Created by Alex on 20.09.2016.
 */
public class EmployeeValidate {

    private String nameLabel;
    private String surnameLabel;
    private String birthdayLabel;
    private String positionLabel;
    private String salaryLabel;

    public String getNameLabel() {
        return nameLabel;
    }

    public String getSurnameLabel() {
        return surnameLabel;
    }

    public String getBirthdayLabel() {
        return birthdayLabel;
    }

    public String getPositionLabel() {
        return positionLabel;
    }

    public String getSalaryLabel() {
        return salaryLabel;
    }

    public boolean isValid(EmployeeView employeeView) {
        boolean result = true;
        String inputtedPosition = employeeView.getPosition();
        if (StringUtils.isBlank(employeeView.getName())) {
            result = false;
            nameLabel = "You should input some name";
        }
        if (StringUtils.isBlank(employeeView.getSurname())) {
            result = false;
            surnameLabel = "You should input some surname";
        }
        if (employeeView.getBirthday() == null) {
            result = false;
            birthdayLabel = "You should input date properly";
        }
        if (isNotInPositionValues(inputtedPosition)) {
            result = false;
            positionLabel = "You should input some existing position";
        }
        if (employeeView.getSalary() <= 0) {
            result = false;
            salaryLabel = "You should input positive value";
        }
        return result;
    }

    private boolean isNotInPositionValues(String inputtedPosition) {
        Position[] positions = Position.values();
        for (Position position : positions) {
            if (inputtedPosition.equalsIgnoreCase(position.name()))
                return false;
        }
        return true;
    }
}
