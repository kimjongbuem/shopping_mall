package egovframework.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import egovframework.project.controller.api.Crud;

@Component
public abstract class BaseService<Res, Req, Entity> implements Crud<Res, Req> {

    @Autowired(required = false)
    protected JpaRepository<Entity, Long> baseRepository;

}
