package egovframework.project.exception.handler;

import org.springframework.web.bind.annotation.*;

import egovframework.project.exception.IDAlreadyExistsException;
import egovframework.project.exception.IdFirstNotEnglish;
import egovframework.project.exception.IdShortException;
import egovframework.project.exception.PasswordShortException;
@ControllerAdvice
public class SignExceptionHandler {
	@ExceptionHandler
	public String handleIdShortException(IdShortException idShortException){
        return idShortException.getMessage();
    }
	@ExceptionHandler
	public String handleIdFirstNotEnglish(IdFirstNotEnglish idFirstNotEnglish){
        return idFirstNotEnglish.getMessage();
    }
	@ExceptionHandler
	public String handlePasswordShortException(PasswordShortException passwordShortException){
        return passwordShortException.getMessage();
    }
	@ExceptionHandler
	public String handleIdAlreadyExistsException(IDAlreadyExistsException idAlreadyExistsException){
        return idAlreadyExistsException.getMessage();
    }
}
