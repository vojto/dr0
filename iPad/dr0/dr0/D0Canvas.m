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

- (id)init {
    if ((self = [super init])) {
        self.paths = [NSMutableSet set];
        self.currentPath = nil;
    }
    
    return self;
}

- (void)createPathAt:(CGPoint)point {
    self.currentPath = [UIBezierPath bezierPath];
    [self.currentPath moveToPoint:point];
    [paths addObject:self.currentPath];
}

- (void)lineTo:(CGPoint)point {
    [self.currentPath addLineToPoint:point];
}

- (void)endPathAt:(CGPoint)point {
    [self.currentPath addLineToPoint:point];
    self.currentPath = nil;
}

@end
