# Inception of dr0 [dr-oh - draw]

---

**1530 CET**. I just got the best idea. It's easy to show somebody your ideas by drawing them on a piece of paper. But what do you do, if the other party is on the other of the world?

I have an iPad, so why not draw on an iPad, and send the other party link to website, where whatever I draw is rendered? It's easy with today's technologies: WebSockets, Canvas, SVG.

This should be easy, so let's get started. Here's the ingredients:

- 1x iPad
- 1x Node.js server with WebSockets
- 1x Modern browser

*iPad application*

I'm definitely gonna deal with vector objects. I've used `NSBezierPath` before for my graphics course, so it should be easy. There are `touchDown`, `touchMove` and `touchEnd` events. When user touches the screen I'll want to create a new vector, when they move it, I'll want to add a point to that vector, and when they release the finger, I'll want to end that vector. With every step I'll want to redraw the screen. 

---

**1540 CET** It looks like iPad app will be easy enough, I'll just create the bezier paths, add them to array, and render each time. But I'm gonna have to kill IM and email soon.

---

**1555 CET**

Now I can draw on the iPad. Look!

![drawing on the iPad](http://hron.fei.tuke.sk/~rinik/data/IMG_0212.JPG)

It's time to have some networking fun. Let's think about this. The first thing I'm gonna try is to send a message with one of three types: `start`, `move` and `end`. Then, on the server I will simply forward these messages to the client. There will be no storage on the server. That means, if you refresh your browser, everything's lost. That could be easily fixed by creating some sort of queue of commands on the server, and sending the whole things to the client when they connect, but whatever.

I'm gonna use Socket.IO to make it work on older browser too. Here's the [Cocoa library](https://github.com/pkyeck/socket.IO-objc) that I'm gonna use.

I have no idea how fast it will be, and if it will look anything like real time. I don't feel like doing any research, so I'm just gonna write some code and see what happens.