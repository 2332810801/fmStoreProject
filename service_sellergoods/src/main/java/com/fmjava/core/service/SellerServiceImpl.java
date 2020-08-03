package com.fmjava.core.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fmjava.core.dao.seller.SellerDao;
import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.seller.Seller;
import com.fmjava.core.pojo.seller.SellerQuery;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
@Transactional
public class SellerServiceImpl implements SellerService {
    @Autowired
    private SellerDao sellerDao;
    @Override
    public void add(Seller seller) {
        seller.setCreateTime(new Date());
        //审核状态注册的时候默认为0 ,未审核
        seller.setStatus("0");
        sellerDao.insertSelective(seller);
    }

    @Override
    public PageResult findPage(Integer page, Integer pageSize,Seller seller) {
        PageHelper.startPage(page, pageSize);
        SellerQuery query = new SellerQuery();
        SellerQuery.Criteria criteria = query.createCriteria();
        if (seller != null) {
            if (seller.getStatus() != null && !"".equals(seller.getStatus())) {
                criteria.andStatusEqualTo(seller.getStatus());
            }
            if (seller.getName() != null && !"".equals(seller.getName())){
                criteria.andNameLike("%"+seller.getName()+"%");
            }
            if (seller.getNickName() != null && !"".equals(seller.getNickName())) {
                criteria.andNickNameLike("%"+seller.getNickName()+"%");
            }
        }
        Page<Seller> sellerList = (Page<Seller>)sellerDao.selectByExample(query);
        return new PageResult(sellerList.getTotal(), sellerList.getResult());
    }

    @Override
    public Seller sellerdetail(String sellerId) {
        return sellerDao.selectByPrimaryKey(sellerId);
    }

    @Override
    public void updateStatus(Seller seller) {
        sellerDao.updateByPrimaryKeySelective(seller);
    }
}