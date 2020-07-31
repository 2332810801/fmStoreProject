package com.fmjava.core.service;

import com.alibaba.dubbo.config.annotation.Service;

@Service
public class TestServiceImpl implements TestService {
    @Override
    public String getName() {
        return "duboo_service";
    }
}
