from http.server import HTTPServer, BaseHTTPRequestHandler
import socket

class CapstoneHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        body = f"<h1>Capstone Project 8: Docker Container Running!</h1><p>Container Hostname: {socket.gethostname()}</p>"
        self.wfile.write(body.encode("utf-8"))

if __name__ == "__main__":
    server = HTTPServer(("0.0.0.0", 5000), CapstoneHandler)
    print("Serving on port 5000...")
    server.serve_forever()
