package com.cn.rotator.domain.dao;

import com.cn.rotator.domain.dom.Rotator;
import java.util.List;

/**
 * DAO interface for table: Rotator.
 * @author autogenerated
 */
public interface RotatorDao  {

    public Rotator findRotatorById(long id);
    public void save(Rotator rotator);
    public List<Rotator> getRotators();
}

