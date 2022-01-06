package egovframework.project.exception;

public class IdShortException extends Exception{
	
	private static final long serialVersionUID = 1L;
	private static final String message = "아이디의 길이가 최소 6글자 이상이어야 합니다.";

    public IdShortException(){
        super(message);
    }
}
