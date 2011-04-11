package com.cn.rotator.service;

import java.net.MalformedURLException;
import java.net.URL;

public interface RotatorService {

    public URL getDestinationPath(long rid) throws MalformedURLException;
}
