package egovframework.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public abstract class BaseService<Entity> implements ServiceCrud<Entity> {

    @Autowired(required = false)
    protected JpaRepository<Entity, Long> baseRepository;

}
