package com.deni.obs.response;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MetaInfo {

    @JsonProperty("total")
    private int total;

    @JsonProperty("offset")
    private int offset;

    @JsonProperty("limit")
    private int limit;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public MetaInfo(int total, int offset, int limit) {
        super();
        this.total = total;
        this.offset = offset;
        this.limit = limit;
    }

}
