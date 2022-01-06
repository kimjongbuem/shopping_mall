package egovframework.project.exception;

public class IDAlreadyExistsException extends Exception{

	private static final long serialVersionUID = 1L;
	private static final String message = "아이디가 이미 존재합니다.";
	public IDAlreadyExistsException(){
		super(message);
	}

}
