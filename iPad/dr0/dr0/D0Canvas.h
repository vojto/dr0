//
//  D0Canvas.h
//  dr0
//
//  Created by Rinik Vojto on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface D0Canvas : NSObject

@property (retain) NSMutableSet *paths;
@property (retain) UIBezierPath *currentPath;

- (void)createPathAt:(CGPoint)point;
- (void)lineTo:(CGPoint)point;
- (void)endPathAt:(CGPoint)point;

@end
