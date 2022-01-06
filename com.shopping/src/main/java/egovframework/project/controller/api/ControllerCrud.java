package egovframework.project.controller.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ControllerCrud {
    String create(HttpServletRequest req, HttpServletResponse res);
    String update(HttpServletRequest req, HttpServletResponse res);
    String read(HttpServletRequest req, HttpServletResponse res);
    void delete(HttpServletRequest req, HttpServletResponse res);
}