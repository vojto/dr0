function Canvas() {
  // Networking
  this.socket = null;
  
  // "Model"
  this.currentPath = null;
  
  // View
  this.paper = Raphael(10, 10, 1024, 768);
  
  this.connect();
}

Canvas.prototype.connect = function() {
  var self = this;
  this.socket = io.connect('http://rinik.net:5000');
  this.socket.on('start', function(data) {
    self.start(data);
  });
  this.socket.on('move', function(data) {
    self.move(data);
  });
  this.socket.on('close', function(data) {
    self.close(data);
  });
  this.socket.on('clean', function(data) {
    self.clean(data);
  });
};

Canvas.prototype.start = function(data) {
  console.log('Path started', data);
  this.currentPath = this.paper.path('M' + data.x + ',' + data.y);
  this.currentPath.attr('stroke', 'red');
  this.currentPath.attr('stroke-width', '3');
  console.log(this.currentPath);
};

Canvas.prototype.move = function(data) {
  path = this.currentPath.attr('path');
  path.push(['L', data.x, data.y]);
  this.currentPath.attr('path', path);
};

Canvas.prototype.close = function(data) {
  path = this.currentPath.attr('path');
  path.push(['L', data.x, data.y]);
  this.currentPath.attr('path', path);
  this.currentPath = null;
};

Canvas.prototype.clean = function(data) {
  this.paper.clear();
  this.currentPath = null;
};


var canvas = new Canvas();