package ru.kpfu.itis.skillshare.mainservice.exception.notfound;

public class QuestionNotFoundException extends NotFoundServiceException {

    public QuestionNotFoundException(){
        super("Question not found :(");
    }

    public QuestionNotFoundException(Long id) {
        super("Question with id = %s - not found".formatted(id));
    }

}
