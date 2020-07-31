package com.fmjava.core.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fmjava.core.dao.good.BrandDao;
import com.fmjava.core.pojo.good.Brand;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
@Service
public class BrandServiceImpl implements BrandService{

    @Autowired
    private BrandDao brandDao;
    @Override
    public List<Brand> selectAll() {
        return brandDao.selectByExample(null);
    }
}
