package egovframework.project.exception;

public class IdFirstNotEnglish extends Exception{
	private static final long serialVersionUID = 1L;
	private static final String message = "아이디의 첫 글자가 영어여야 합니다.";

    public IdFirstNotEnglish(){
        super(message);
    }
}
