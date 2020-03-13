package net.gazeplay.voice.controller;

import net.gazeplay.voice.model.Phrase;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicLong;

@RestController
public class PhraseController {

    private final AtomicLong counter = new AtomicLong();
    private final long DEFAULT_TTL = 3600;

    @GetMapping("/phrase")
    public Phrase phrase(@RequestParam(value = "message", defaultValue = "Hello GazePlay") String message) {
        return new Phrase(counter.incrementAndGet(), message, "S3 URL", DEFAULT_TTL);
    }
}
