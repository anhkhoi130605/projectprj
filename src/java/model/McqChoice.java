package model;

import java.util.UUID;

public class McqChoice {
    private UUID id;
    private String content;
    private boolean isCorrect;
    private UUID mcqQuestionId;

    // getters & setters
    public UUID getId() { return id; }
    public void setId(UUID id) { this.id = id; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public boolean isCorrect() { return isCorrect; }
    public void setCorrect(boolean correct) { isCorrect = correct; }

    public UUID getMcqQuestionId() { return mcqQuestionId; }
    public void setMcqQuestionId(UUID mcqQuestionId) { this.mcqQuestionId = mcqQuestionId; }
}
