package com.cn.rotator.service.jpa;

import com.cn.rotator.domain.dao.TesterDao;
import com.cn.rotator.domain.dom.Tester;
import com.cn.rotator.service.TesterService;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;

/**
 * User: kevin Date: 1/22/11 Time: 11:27 PM
 */
@Service("testerService")
@Repository
public class JpaTesterService implements TesterService {

	private TesterDao testerDao;

	@Inject
	public void setTesterDao(TesterDao testerDao) {
		this.testerDao = testerDao;
	}

	@Transactional
	public void create(Tester tester) {
		this.testerDao.save(tester);
	}
}
