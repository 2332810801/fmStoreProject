package com.fmjava.core.pojo.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
@Setter@Getter
public class Result implements Serializable {
    private boolean success;//成功&失败
    private String message;//返回信息

    public Result(boolean success, String message) {
        this.success = success;
        this.message = message;
    }
}
