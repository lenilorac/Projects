'''
A Web Crawler With asyncio coroutines from 
http://aosabook.org/en/500L/a-web-crawler-with-asyncio-coroutines.html
'''

import socket
global stopped
from selectors import DefaultSelector, EVENT_WRITE, EVENT_READ

# initilising 2 url sets with root
urls_todo = set(['/'])
# seen_urls include urls_todo
seen_urls = set(['/'])

selector = DefaultSelector()
#async - does concurrent ops on a single thread using non-blocking sockets
#set socket non-blocking before connecting
# sock = socket.socket()
# sock.setblocking(False)
# try:
#     sock.connect(('xkcd.com', 80))
#     # throws execption even when working
#     # sets errno -> EINPROCESS
# except BlockingIOError:
#     pass

# #register socket with default selector
# # callback function that indicates when the socket is writable
# def connected():
#     selector.unregister(sock.fileno())
#     print('connected!')

# selector.register(sock.fileno(), EVENT_WRITE, connected)

# def loop():
#     while True:
#         events = selector.select()
#         for event_key, event_mask in events:
#             callback = event_key.data
#             callback()

class Fetcher:
    def __init__(self, url):
        self.response = b''
        self.url = url
        self.sock = None

    def fetch(self):
        self.sock = socket.socket()
        self.sock.setblocking(False)
        try:
            self.sock.connect(('xkcd.com', 80))
        except BlockingIOError:
            pass
        # register next callback
        selector.register(self.sock.fileno(), EVENT_WRITE, self.connected)

    def connected(self, key, mask):
        print('connected!')
        selector.unregister(key.fd)
        request = 'GET {} HTTP/1.0\r\nHost: xkcd.com\r\n\r\n'.format(self.url)
        self.sock.send(request.encode('ascii'))
        # register next callback
        selector.register(key.fd, EVENT_READ, self.read_response)

    #TODO
    def parse_links(self):
        return 0
           

    def read_response(self, key, mask):
        chunk = self.sock.recv(4096) # chunk size 4k
        if chunk:
            self.response += chunk
        else:
            selector.unregister(key.fd) #reading finished
            links = self.parse_links() # yet to implement

            #python set-logic:





#begin fetching http://xkcd.com/353/
fetcher = Fetcher('/353/')
fetcher.fetch()
stopped = False

def loop():
    while not stopped:
        events = selector.select()
        for event_key, event_mask in events:
            callback = event_key.data
            callback(event_key, event_mask)