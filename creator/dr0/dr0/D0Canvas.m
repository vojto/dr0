//
//  D0Canvas.m
//  dr0
//
//  Created by Rinik Vojto on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "D0Canvas.h"

@implementation D0Canvas

@synthesize paths, currentPath;
@synthesize io;

- (id)init {
    if ((self = [super init])) {
        self.paths = [NSMutableSet set];
        self.currentPath = nil;
        
        self.io = [[SocketIO alloc] initWithDelegate:self];
        [self.io connectToHost:@"192.168.0.105" onPort:5000];
    }
    
    return self;
}

- (void)dealloc {
    self.paths = nil;
    self.currentPath = nil;
}

- (void)createPathAt:(CGPoint)point {
    self.currentPath = [UIBezierPath bezierPath];
    [self.currentPath moveToPoint:point];
    [paths addObject:self.currentPath];
    
    [self sendEvent:@"start" withPoint:point];
}

- (void)lineTo:(CGPoint)point {
    [self.currentPath addLineToPoint:point];
    
    [self sendEvent:@"move" withPoint:point];
}

- (void)endPathAt:(CGPoint)point {
    [self.currentPath addLineToPoint:point];
    self.currentPath = nil;
    
    [self sendEvent:@"close" withPoint:point];
}

#pragma mark - Networking

- (void)sendEvent:(NSString *)event withPoint:(CGPoint)point {
    NSDictionary *data = [NSDictionary dictionaryWithObjectsAndKeys:
                          [NSNumber numberWithFloat:point.x], @"x",
                          [NSNumber numberWithFloat:point.y], @"y",
                          nil];
    [self.io sendEvent:event withData:data];
}


- (void) socketIODidConnect:(SocketIO *)socket {
    NSLog(@"Connected! %@", socket);
}

- (void) socketIODidDisconnect:(SocketIO *)socket {
    NSLog(@"Disconnected! %@", socket);
}

@end
