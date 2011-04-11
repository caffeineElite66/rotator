package com.cn.rotator.domain.dom;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;


/**
 * Object mapping for hibernate-handled table: RotatorDestinationPath.
 * 
 * @author autogenerated
 */

@Entity
@Table(name = "RotatorDestinationPath")
public class RotatorDestinationPath implements Cloneable, Serializable {

    private static final long serialVersionUID = -559008637L;

    @Id
    @GeneratedValue
    private long id;

    @Column(name="path_name")
    private String pathName;

    @Column(name="created_at")
    @Temporal(TemporalType.DATE)
    private Date createdAt;

    @Column(name="updated_at")
    @Temporal(TemporalType.DATE)
    private Date updatedAt;

    @Column(name="url")
    private String url;

    @Column(name="path_percent")
    private float pathPercent; 
    
    @Column(name="active")
    private boolean active;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="rotator_id")
    private Rotator rotator;

    public RotatorDestinationPath() {
        this.createdAt = new java.util.Date();
        this.updatedAt = new java.util.Date();
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPathName() {
        return pathName;
    }

    public void setPathName(String pathName) {
        this.pathName = pathName;
    }

    public float getPathPercent() {
        return pathPercent;
    }

    public void setPathPercent(float pathPercent) {
        this.pathPercent = pathPercent;
    }
    
    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Rotator getRotator() {
        return rotator;
    }

    public void setRotator(Rotator rotator) {
        this.rotator = rotator;
    }

   
}