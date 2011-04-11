package com.cn.rotator.domain.dao.jpa;

import com.cn.rotator.domain.dao.RotatorDestinationPathDao;
import com.cn.rotator.domain.dom.RotatorDestinationPath;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * User: kevin
 * Date: 1/31/11
 * Time: 11:08 PM
 */
@Repository
public class JpaRotatorDestinationPathDao implements RotatorDestinationPathDao{

    EntityManager entityManager;

    @PersistenceContext
    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    public EntityManager getEntityManager() {
        return this.entityManager;
    }
    @Override
    @Transactional
    public void save(RotatorDestinationPath path) {
        this.entityManager.merge(path);
    }

}
