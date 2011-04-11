/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cn.rotator.domain.dao;

import java.util.ArrayList;
import javax.inject.Inject;
import com.cn.rotator.domain.dom.Rotator;
import com.cn.rotator.domain.dom.RotatorDestinationPath;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import static junit.framework.Assert.assertEquals;

/**
 *
 * @author kevin
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/test/resources/spring/rotator-config.xml"})
public class RotatorDaoTest {

    @Inject
    private RotatorDao rotatorDao;
    @Inject
    private RotatorDestinationPathDao rotatorDestinationPathDao;
    private Logger log = LoggerFactory.getLogger(RotatorDaoTest.class);

    @Test
    public void testRotator() {
        Rotator r = new Rotator();
        r.setActive(true);
        r.setRotatorName("TestRotator");

        
        RotatorDestinationPath d1 = new RotatorDestinationPath();
        d1.setActive(true);
        d1.setPathName("defaultPath");
        d1.setPathPercent(90);
        d1.setUrl("http://www.google.com");
        d1.setRotator(r);


        RotatorDestinationPath d2 = new RotatorDestinationPath();
        d2.setActive(true);
        d2.setPathName("alternitivePath");
        d2.setPathPercent(10);
        d2.setUrl("http://www.yahoo.com");
        d2.setRotator(r);

        
        ArrayList<RotatorDestinationPath> paths = new ArrayList<RotatorDestinationPath>();
        paths.add(d1);
        paths.add(d2);

        r.setRotatorDestinationPaths(paths);
        rotatorDao.save(r);
        

        final List<Rotator> rotators = rotatorDao.getRotators();
        assertEquals(1, rotators.size());
        assertEquals(2, rotators.get(0).getRotatorDestinationPaths().size());
    }
}
