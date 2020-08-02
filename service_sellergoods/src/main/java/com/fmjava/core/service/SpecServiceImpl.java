package com.fmjava.core.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fmjava.core.dao.specification.SpecificationDao;
import com.fmjava.core.dao.specification.SpecificationOptionDao;
import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.entity.SpecEntity;
import com.fmjava.core.pojo.good.BrandQuery;
import com.fmjava.core.pojo.specification.Specification;
import com.fmjava.core.pojo.specification.SpecificationOption;
import com.fmjava.core.pojo.specification.SpecificationOptionQuery;
import com.fmjava.core.pojo.specification.SpecificationQuery;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

@Service
@Transactional
public class SpecServiceImpl implements SpecService {
    @Autowired
    SpecificationDao specdao;
    @Autowired
    SpecificationOptionDao specOptionDao;
    @Override
    public PageResult findPageSpec(Integer page, Integer pageSize, Specification spec) {
        PageHelper.startPage(page,pageSize);
        SpecificationQuery query = new SpecificationQuery();
        query.setOrderByClause("id desc");
        if(spec!=null){
            if(spec.getSpecName()!=null&&!"".equals(spec.getSpecName())){
                SpecificationQuery.Criteria criteria = query.createCriteria();
                criteria.andSpecNameLike("%"+spec.getSpecName()+"%");
            }
        }
        Page<Specification> specifications =(Page<Specification>)specdao.selectByExample(query);
        return new PageResult(specifications.getTotal(),specifications.getResult());
    }

    @Override
    public void save(SpecEntity specEntity) {
        //1. 规格对象 保存完后 获取id
        specdao.insertSelective(specEntity.getSpec());
        //2. 规格选项
        for (SpecificationOption specificationOption : specEntity.getSpecOption()) {
            specificationOption.setSpecId(specEntity.getSpec().getId());
            specOptionDao.insertSelective(specificationOption);
        }
    }

    @Override
    public SpecEntity findSpecById(Long id) {
        //1. 查询规格对象
        Specification specification = specdao.selectByPrimaryKey(id);
        //2. 查询规格选项
        SpecificationOptionQuery specificationOptionQuery = new SpecificationOptionQuery();
        SpecificationOptionQuery.Criteria criteria = specificationOptionQuery.createCriteria();
        criteria.andSpecIdEqualTo(specification.getId());
        List<SpecificationOption> specificationOptions = specOptionDao.selectByExample(specificationOptionQuery);
        return new SpecEntity(specification,specificationOptions);
    }

    @Override
    public void update(SpecEntity specEntity) {
        //1. 更新规格对象
        specdao.updateByPrimaryKeySelective(specEntity.getSpec());
        //2. 打破关系
        SpecificationOptionQuery specificationOptionQuery = new SpecificationOptionQuery();
        SpecificationOptionQuery.Criteria criteria = specificationOptionQuery.createCriteria();
        criteria.andSpecIdEqualTo(specEntity.getSpec().getId());
        specOptionDao.deleteByExample(specificationOptionQuery);
        //3. 更新规格选项 重新建立关系
        for (SpecificationOption specificationOption : specEntity.getSpecOption()) {
            specificationOption.setSpecId(specEntity.getSpec().getId());
            specOptionDao.insertSelective(specificationOption);
        }

    }

    @Override
    public void deleteById(Long[] id) {
        if(id!=null){
            //删除规格
            for (Long ids : id) {
                specdao.deleteByPrimaryKey(ids);
                SpecificationOptionQuery specificationOptionQuery = new SpecificationOptionQuery();
                SpecificationOptionQuery.Criteria criteria = specificationOptionQuery.createCriteria();
                criteria.andSpecIdEqualTo(ids);
                specOptionDao.deleteByExample(specificationOptionQuery);
            }
            //删除规格选项
        }

    }

    @Override
    public List<Specification> selectOptionList() {
        return specdao.selectByExample(null);
    }

}
