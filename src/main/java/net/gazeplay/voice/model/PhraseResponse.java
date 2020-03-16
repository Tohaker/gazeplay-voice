package net.gazeplay.voice.model;

public class PhraseResponse {

    private final String id;
    private final String url;
    private final long ttl;

    public PhraseResponse(String id, String url, long ttl) {
        this.id = id;
        this.url = url;
        this.ttl = ttl;
    }

    public String getId() {
        return id;
    }

    public String getUrl() {
        return url;
    }

    public long getTTL() {
        return ttl;
    }
}
