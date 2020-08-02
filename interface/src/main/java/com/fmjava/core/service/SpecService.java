package com.fmjava.core.service;

import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.entity.SpecEntity;
import com.fmjava.core.pojo.specification.Specification;
import org.springframework.web.bind.annotation.RequestBody;

public interface SpecService {
    PageResult findPageSpec(Integer page, Integer pageSize,Specification spec);

    void save(SpecEntity specEntity);

    SpecEntity findSpecById(Long id);

    void update(SpecEntity specEntity);

    void deleteById(Long[] id);
}
