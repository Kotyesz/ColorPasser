import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

public class Main {

    private static int red=0,green=0,blue=0;
    private static Gui gui;

    public static void main(String[] args) throws Exception {
        gui = new Gui();
        HttpServer server = HttpServer.create(new InetSocketAddress(9871), 0);
        server.createContext("/color", new MyHandler());
        server.setExecutor(null); // creates a default executor
        server.start();
    }

    static class MyHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            String response = "This is the response";
            t.sendResponseHeaders(200, response.length());
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            String colors[] = t.getRequestURI().toString().split(":");
            red = Integer.parseInt(colors[1]);
            green = Integer.parseInt(colors[2]);
            blue = Integer.parseInt(colors[3]);
            gui.cChange(red,green,blue);
            os.close();
        }
    }

}