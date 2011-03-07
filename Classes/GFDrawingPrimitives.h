//
//  GFDrawingPrimitives.h
//
//  Created by Jay Roberts on 9/8/10.
//

#import "cocos2d.h"

#ifndef CC_POINTS_TO_PIXELS
#define CC_POINTS_TO_PIXELS(__pixels__)	\
CGPointMake( (__pixels__).x * CC_CONTENT_SCALE_FACTOR(), (__pixels__).y * CC_CONTENT_SCALE_FACTOR() )
#endif

void gfDrawFilledRect(CGPoint v1, CGPoint v2);
void gfDrawInvertedCircle( CGPoint center, float radius, NSUInteger segments);