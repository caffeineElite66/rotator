package com.cn.rotator.service.jpa;

import com.cn.rotator.domain.dao.RotatorDao;
import com.cn.rotator.domain.dom.Rotator;
import com.cn.rotator.service.RotatorService;
import java.net.MalformedURLException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.net.URL;

@Service("rotatorService")
@Repository
public class JpaRotatorService implements RotatorService {

    private RotatorDao rotatorDao;

    @Inject
    public void setRotatorDao(RotatorDao rotatorDao) {
        this.rotatorDao = rotatorDao;
    }

    @Override
    public URL getDestinationPath(long rid) throws MalformedURLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }


}
