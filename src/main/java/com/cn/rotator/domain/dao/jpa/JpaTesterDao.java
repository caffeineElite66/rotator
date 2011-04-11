package com.cn.rotator.domain.dao.jpa;

import com.cn.rotator.domain.dao.TesterDao;
import com.cn.rotator.domain.dom.Tester;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * User: kevin Date: 1/16/11 Time: 10:20 PM
 */
@Repository
public class JpaTesterDao implements TesterDao {

	EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public EntityManager getEntityManager() {
		return this.entityManager;
	}

	@Override
	@Transactional(readOnly = true)
	public Tester findTesterById(long id) {
		return (Tester) this.entityManager
				.createQuery("select t from Tester t where t.id = :id")
				.setParameter("id", id).getSingleResult();
	}

	@Override
	@Transactional
	public void save(Tester tester) {
		this.entityManager.merge(tester);
	}
}
