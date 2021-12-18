package egovframework.project.controller.api;

import javax.servlet.http.HttpServletRequest;

public interface ControllerCrud {
    String create(HttpServletRequest req);
    String update(HttpServletRequest req);
    String read(HttpServletRequest req);
    String delete(HttpServletRequest req);
}