package com.deni.obs.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "ranks")
public class Ranks extends BaseModel {
    private static final long serialVersionUID = 4480994239348052016L;

    @Column(length = 100)
    private String department;

    @Column(length = 100)
    private String student;

    @Column(length = 100)
    private String mark;

    public Double getPass() {
        return pass;
    }

    public void setPass(Double pass) {
        this.pass = pass;
    }

    @Column
    private Double pass;

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getStudent() {
        return student;
    }

    public void setStudent(String student) {
        this.student = student;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }
}
