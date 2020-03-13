package net.gazeplay.voice.model;

public class Phrase {

    private final long id;
    private final String message;
    private final String url;
    private final long ttl;

    public Phrase(long id, String message, String url, long ttl) {
        this.id = id;
        this.message = message;
        this.url = url;
        this.ttl = ttl;
    }


    public long getId() {
        return id;
    }

    public String getMessage() {
        return message;
    }

    public String getUrl() {
        return url;
    }

    public long getTTL() {
        return ttl;
    }
}