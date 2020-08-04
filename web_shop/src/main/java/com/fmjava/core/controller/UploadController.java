package com.fmjava.core.controller;

import com.fmjava.core.pojo.entity.Result;
import com.fmjava.core.utils.FastDFSClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/upload")
public class UploadController {

    @Value("${FILE_SERVER_URL}")
    private String FILE_SERVER;

    @RequestMapping("/uploadFile")
    public Result uploadFile(MultipartFile file) throws Exception {
        try {
            if(file==null){
                return new Result(false, "请选择一张图片!");
            }
            FastDFSClient fastDFS = new FastDFSClient("classpath:fastDFS/fdfs_client.conf");
            //上传文件返回文件保存的路径和文件名
            String path = fastDFS.uploadFile(file.getBytes(), file.getOriginalFilename(), file.getSize());
            /**
             保存数据库...
             */
            //拼接上服务器的地址返回给前端
            return new Result(true, FILE_SERVER + path);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "上传失败!");
        }
    }
    /*删除图片*/
    @RequestMapping("/delteImage")
    public Result delteImage(String url){
        try {
            String path  = url.substring(FILE_SERVER.length());
            FastDFSClient fastDFS =new FastDFSClient("classpath:fastDFS/fdfs_client.conf");
            Integer integer = fastDFS.delete_file(path);
            if (integer == 0){
                return new Result(true, "删除成功");
            }else {
                return new Result(false, "删除失败");
            }
        } catch (Exception e) {
            return new Result(false, "删除失败");
        }
    }

    @RequestMapping("/uploadImage")
    public Map uploadImage(MultipartFile upfile){
        try {
            FastDFSClient fastDFS=new FastDFSClient("classpath:fastDFS/fdfs_client.conf");
            String path = fastDFS.uploadFile(upfile.getBytes(), upfile.getOriginalFilename(), upfile.getSize());
            String url=FILE_SERVER+path;
            Map<String, Object> result = new HashMap<>();
            result.put("state","SUCCESS");
            result.put("url",url);
            result.put("title",upfile.getOriginalFilename());
            result.put("original",upfile.getOriginalFilename());
            return result;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
