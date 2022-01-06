package egovframework.project.exception;

public class PasswordShortException extends Exception{
	private static final long serialVersionUID = 1L;
	private static final String message = "비밀번호가 짧습니다. ( 최소 8글자 이상 )";

    public PasswordShortException(){
        super(message);
    }
}
