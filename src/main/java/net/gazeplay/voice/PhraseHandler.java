package net.gazeplay.voice;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.google.gson.Gson;
import net.gazeplay.voice.model.HttpResponse;
import net.gazeplay.voice.model.Phrase;
import net.gazeplay.voice.model.PhraseResponse;

import java.util.Arrays;
import java.util.Collections;
import java.util.UUID;

public class PhraseHandler implements RequestHandler<Phrase, HttpResponse> {
    private static long DEFAULT_TTL = 3600;

    @Override
    public HttpResponse handleRequest(Phrase input, Context context) {
        // Synthesize voice from the 'message' in the input
        System.out.println(Arrays.toString(input.getMessages()));

        PhraseResponse response = new PhraseResponse(UUID.randomUUID().toString(), "S3 URL", DEFAULT_TTL);
        String body = new Gson().toJson(response);

        return new HttpResponse(200, Collections.emptyMap(), body);
    }
}
