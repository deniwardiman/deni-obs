package com.deni.obs.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

/**
 *
 * @author nunu
 */
@MappedSuperclass
public class BaseModel implements Serializable {

    private static final long serialVersionUID = 4480994239348052016L;

    @Id
    @Column(length = 36)
    public String id;
    
    @Column(name = "created_at", updatable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")//, timezone = "Asia/Jakarta")
    public Date createdAt;
    
    @Version
    @Column(name = "updated_at")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Jakarta")
    public Date updatedAt;

    @Column(name = "is_deleted")
    public boolean isDeleted;
    
    @Column(name = "created_by", length = 36)
    public String createdBy;
    
    @Column(name = "updated_by", length = 36)
    public String updatedBy;
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }
    
    @PrePersist
    public void prePersist() {

        this.id = UUID.randomUUID().toString();
        this.createdAt = new Date();
        this.updatedAt = new Date();
        this.isDeleted = false;
    }

    @PreUpdate
    public void preUpdate(){
        this.updatedAt = new Date();
    }
    
}
