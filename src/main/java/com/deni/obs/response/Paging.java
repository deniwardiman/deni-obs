package com.deni.obs.response;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Slice;

import java.util.Iterator;
import java.util.List;


public class Paging<T> implements Iterable<T> {

    private long count;
    private List<T> content;

    public Paging(Page<T> data) {
        this.content = data.getContent();
        this.count = data.getTotalElements();
    }

    public Paging(Slice<T> data) {
        this.content = data.getContent();
        this.count = data.getNumberOfElements();
    }

    public Paging(List<T> data) {
        this.content = data;
        this.count = (long) data.size();
    }

    public Paging(long count, List<T> content) {
        this.count = count;
        this.content = content;
    }

    @Override
    public Iterator<T> iterator() {
        return content.iterator();
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public List<T> getContent() {
        return content;
    }

    public void setContent(List<T> content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Paging{" +
                "count=" + count +
                ", content=" + content +
                '}';
    }
}
