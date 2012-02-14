//
//  D0CanvasView.m
//  dr0
//
//  Created by Rinik Vojto on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "D0CanvasView.h"

@implementation D0CanvasView

@synthesize canvas;

- (void)awakeFromNib {
    self.canvas = [[[D0Canvas alloc] init] autorelease];
}

- (void)dealloc {
    self.canvas = nil;
}

- (void)drawRect:(CGRect)rect {
    for (UIBezierPath *path in self.canvas.paths) {
        [[UIColor redColor] set];
        [path stroke];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] > 1) return;
    UITouch *touch = [[touches allObjects] lastObject];
    CGPoint point = [touch locationInView:self];
    
    [self.canvas createPathAt:point];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] > 1) return;
    UITouch *touch = [[touches allObjects] lastObject];
    CGPoint point = [touch locationInView:self];
    
    [self.canvas lineTo:point];
    
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
    
    [self.canvas endPathAt:point];
    
    [self setNeedsDisplay];
}

- (IBAction)cleanAction:(id)sender {
    [self.canvas clean];
    [self setNeedsDisplay];
}
@end
