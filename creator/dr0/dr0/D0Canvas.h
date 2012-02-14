//
//  D0Canvas.h
//  dr0
//
//  Created by Rinik Vojto on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocketIO.h"

@interface D0Canvas : NSObject <SocketIODelegate>

@property (retain) NSMutableSet *paths;
@property (retain) UIBezierPath *currentPath;
@property (retain) SocketIO *io;

- (void)createPathAt:(CGPoint)point;
- (void)lineTo:(CGPoint)point;
- (void)endPathAt:(CGPoint)point;

- (void)sendEvent:(NSString *)event withPoint:(CGPoint)point;
- (void)sendEvent:(NSString *)event;

- (void)clean;

@end
