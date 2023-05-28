package com.deni.obs.model;

import java.util.List;

public class DataTableModel {
    private Integer draw;
    private Long recordsTotal;
    private Integer recordsFiltered;
    private List<Object> data;

    public DataTableModel(Integer draw, Long recordsTotal, Integer recordsFiltered, List<Object> data) {
        this.draw = draw;
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsFiltered;
        this.data = data;
    }

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public Long getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(Long recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public Integer getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(Integer recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<Object> getData() {
        return data;
    }

    public void setData(List<Object> date) {
        this.data = date;
    }
}
