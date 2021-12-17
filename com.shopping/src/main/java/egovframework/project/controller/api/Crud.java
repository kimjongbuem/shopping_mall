package egovframework.project.controller.api;

import egovframework.project.model.header.Header;

public interface Crud<Res, Req> {
    Header<Res> create(Header<Req> request);
    Header<Res> update(Header<Req> request);
    Header<Res> read(Long id);
    Header delete(Long id);
}