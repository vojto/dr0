//
//  D0CanvasView.h
//  dr0
//
//  Created by Rinik Vojto on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface D0CanvasView : UIView

@property (retain) NSMutableSet *paths;
@property (retain) UIBezierPath *currentPath;

@end
