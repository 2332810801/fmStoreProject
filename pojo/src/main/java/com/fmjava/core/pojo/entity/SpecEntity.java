package com.fmjava.core.pojo.entity;

import com.fmjava.core.pojo.specification.Specification;
import com.fmjava.core.pojo.specification.SpecificationOption;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter@Setter
public class SpecEntity implements Serializable {
    private Specification spec;
    private List<SpecificationOption> specOption;

    public SpecEntity() {
    }

    public SpecEntity(Specification spec, List<SpecificationOption> specOption) {
        this.spec = spec;
        this.specOption = specOption;
    }

    public Specification getSpec() {
        return spec;
    }

    public void setSpec(Specification spec) {
        this.spec = spec;
    }

    public List<SpecificationOption> getSpecOption() {
        return specOption;
    }

    public void setSpecOption(List<SpecificationOption> specOption) {
        this.specOption = specOption;
    }
}
