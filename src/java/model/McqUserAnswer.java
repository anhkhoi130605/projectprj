package model;

import java.util.UUID;

public class McqUserAnswer {
    private UUID submissionId;
    private UUID mcqChoiceId;

    // getters & setters
    public UUID getSubmissionId() { return submissionId; }
    public void setSubmissionId(UUID submissionId) { this.submissionId = submissionId; }

    public UUID getMcqChoiceId() { return mcqChoiceId; }
    public void setMcqChoiceId(UUID mcqChoiceId) { this.mcqChoiceId = mcqChoiceId; }
}
