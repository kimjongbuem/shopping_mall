package egovframework.project.model.header;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@SuppressWarnings("unchecked")
public class Header<T> {
    // api 응답시간 //

    private LocalDateTime transactionTime;

    // api 응답코드 //
    private String resultCode;

    // api 부가설명 //
    private String description;

    private T data;


    public static <T> Header<T> OK(){
        return (Header<T>)Header.builder().
                transactionTime(LocalDateTime.now()).
                resultCode("OK").
                description("OK").
                build();
    }

    public static <T> Header<T> OK(T data){
        return (Header<T>)Header.builder().
                transactionTime(LocalDateTime.now()).
                resultCode("OK").
                data(data).
                description("OK").
                build();
    }

	public static <T> Header<T> ERROR(String description){
        return (Header<T>)Header.builder().
                transactionTime(LocalDateTime.now()).
                resultCode("ERROR").
                description(description).
                build();
    }

}