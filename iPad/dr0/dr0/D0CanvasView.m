//
//  D0CanvasView.m
//  dr0
//
//  Created by Rinik Vojto on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "D0CanvasView.h"

@implementation D0CanvasView

@synthesize paths, currentPath;

- (void)awakeFromNib {
    self.paths = [NSMutableSet set];
    self.currentPath = nil;
}

- (void)drawRect:(CGRect)rect {
    for (UIBezierPath *path in self.paths) {
        [[UIColor redColor] set];
        [path stroke];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] > 1) return;
    UITouch *touch = [[touches allObjects] lastObject];
    CGPoint point = [touch locationInView:self];
    
    // Create new path
    self.currentPath = [UIBezierPath bezierPath];
    [self.currentPath moveToPoint:point];
    [paths addObject:self.currentPath];
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] > 1) return;
    UITouch *touch = [[touches allObjects] lastObject];
    CGPoint point = [touch locationInView:self];
    
    [self.currentPath addLineToPoint:point];
    
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touches cancelled");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touches ended");
    
    if ([touches count] > 1) return;
    UITouch *touch = [[touches allObjects] lastObject];
    CGPoint point = [touch locationInView:self];
    
    [self.currentPath addLineToPoint:point];
    self.currentPath = nil;
    
    [self setNeedsDisplay];
}

@end
