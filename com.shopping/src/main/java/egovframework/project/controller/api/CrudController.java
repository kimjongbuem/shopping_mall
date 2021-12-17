package egovframework.project.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.project.model.header.Header;
import egovframework.project.service.BaseService;


@Component
public abstract class CrudController<Res, Req, Entity> implements Crud<Res, Req>{
	
	@Autowired
    protected BaseService<Res, Req, Entity> baseService;

	@RequestMapping("create")
    public Header<Res> create(Header<Req> request) {
        return baseService.create(request);
    }
	
	@Override
    @RequestMapping("read")
    public Header<Res> read(Long id) {
        return baseService.read(id);
    }

    @RequestMapping("update")
    public Header<Res> update(Header<Req> request) {
        return baseService.update(request);
    }

    @Override
    @RequestMapping("delete")
    public Header delete(Long id) {
        return baseService.delete(id);
    }
}
