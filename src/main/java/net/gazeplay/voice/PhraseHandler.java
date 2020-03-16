package net.gazeplay.voice;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import net.gazeplay.voice.model.Phrase;
import net.gazeplay.voice.model.Response;

import java.util.Arrays;
import java.util.UUID;

public class PhraseHandler implements RequestHandler<Phrase, Response> {
    private static long DEFAULT_TTL = 3600;

    @Override
    public Response handleRequest(Phrase input, Context context) {
        // Synthesize voice from the 'message' in the input
        System.out.println(Arrays.toString(input.getMessages()));

        Response response = new Response(UUID.randomUUID().toString(), "S3 URL", DEFAULT_TTL);

        return response;
    }
}
