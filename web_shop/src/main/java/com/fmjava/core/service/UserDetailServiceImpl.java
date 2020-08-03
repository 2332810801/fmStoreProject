package com.fmjava.core.service;

import com.fmjava.core.pojo.seller.Seller;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class UserDetailServiceImpl implements UserDetailsService {

    private SellerService sellerService;

    public void setSellerService(SellerService sellerService) {
        this.sellerService = sellerService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        /*定义权限集合*/
        ArrayList<GrantedAuthority> authList = new ArrayList<>();
        authList.add(new SimpleGrantedAuthority("ROLE_SELLER"));// ROLE_SELLER 权限名称
        if(username==null){
            return null;
        }
        /*根据用户名查询数据库*/
        Seller seller = sellerService.sellerdetail(username);
        if(seller!=null){
            if("1".equals(seller.getStatus())){
               return new User(username, seller.getPassword(), authList);
            }
        }
        return null;
    }
}
