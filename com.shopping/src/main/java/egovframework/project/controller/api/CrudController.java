package egovframework.project.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import egovframework.project.service.BaseService;


@Component
public abstract class CrudController<Entity>{
	
	@Autowired
    protected BaseService<Entity> baseService;

}
