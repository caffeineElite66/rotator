package com.cn.rotator.service.jpa;

import com.cn.rotator.domain.dao.RotatorDao;
import com.cn.rotator.domain.dom.Rotator;
import com.cn.rotator.domain.dom.RotatorDestinationPath;
import com.cn.rotator.service.RotatorService;
import java.net.MalformedURLException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.Random;

import javax.inject.Inject;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

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
        Rotator r = rotatorDao.findRotatorById(rid);
        List paths = r.getRotatorDestinationPaths();
        Random random = new Random();
        int number = random.nextInt(100) + 1;
        int weight = 0;
        for (Iterator i = paths.iterator(); i.hasNext();) {
            RotatorDestinationPath path = (RotatorDestinationPath) i.next();
            if (number > weight && number <= (path.getPathPercent() + weight)) {
                return new URL(path.getUrl());
            }
            weight += path.getPathPercent();
        }
        throw new RuntimeException("No Path was found with weight: " + weight);
    }
}
