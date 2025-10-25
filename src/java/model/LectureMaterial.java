package model;

import java.util.UUID;

public class LectureMaterial {
    private UUID lessionID;
    private int id;
    private String type;
    private String url;

    // getters & setters
    public UUID getLessionID() { return lessionID; }
    public void setLessionID(UUID lessionID) { this.lessionID = lessionID; }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }
}
