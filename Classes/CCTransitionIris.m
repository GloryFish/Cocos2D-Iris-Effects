//
//  CCTransitionIris.m
//
//  Created by Jay Roberts on 9/7/10.
//

#import "cocos2d.h"
#import "CCTransitionIris.h"
#import "GFDrawingPrimitives.h"

@implementation CCTransitionIris

+(id)transitionWithDuration:(ccTime)t scene:(CCScene *)s irisPosition:(CGPoint)p radius:(float) r {
  return [[[self alloc] initWithDuration:t scene:s irisPosition: p radius:(float) r color:ccBLACK mask:nil] autorelease];
}

+(id)transitionWithDuration:(ccTime)t scene:(CCScene *)s irisPosition:(CGPoint) p radius:(float)r color:(ccColor3B)c {
  return [[[self alloc] initWithDuration:t scene:s irisPosition: p radius:(float) r color:c mask:nil] autorelease];
}

+(id)transitionWithDuration:(ccTime)t scene:(CCScene *)s irisPosition:(CGPoint) p radius:(float)r color:(ccColor3B)c mask:(NSString*)m {
  return [[[self alloc] initWithDuration:t scene:s irisPosition: p radius:(float) r color:c mask:m] autorelease];
}

-(id)initWithDuration:(ccTime)t scene:(CCScene *)s irisPosition:(CGPoint)p radius:(float)r color:(ccColor3B)c mask:(NSString*)m {
	if( (self=[super initWithDuration:t scene:s]) ) {
  	
		winSize = [[CCDirector sharedDirector] winSize];
		shrinking = YES;
    
    if (m != nil) {
			useMask = YES;
      maskFile = m;
    } else {
      useMask = NO;
    }
    
    irisPos = p;
    radius = r;
		[self calculateMaxRadius];    
    curRadius = maxRadius;
    
    color = c;
    elapsed = 0.0f;
    

  }
  
	return self;
}

-(void)tick:(ccTime)dt {
	elapsed += dt;
  
  if (elapsed < (duration_ / 2)) { // Shrink
    curRadius = maxRadius - ((maxRadius - radius) * elapsed) / (duration_ / 2);
  } else if (elapsed < duration_) { // Grow
  	if (shrinking) {
      shrinking = NO;
      outScene_.visible = NO;
      inScene_.visible = YES;
      [inScene_ visit];
    }
    curRadius = radius + ((maxRadius - radius) * (elapsed - (duration_ / 2))) / (duration_ / 2);
  } else {
    [self finish];
  }
  
  if (useMask) {
    mask.scale = (2 * curRadius) / mask.textureRect.size.width;  
  }
}


-(void) onEnter {
	[super onEnter];
  
	outScene_.visible = YES;
  inScene_.visible = NO;
	
  [outScene_ visit];
  
  if (useMask) {
    mask = [CCSprite spriteWithFile:maskFile];
    mask.anchorPoint = ccp(0.5f, 0.5f);
    mask.position = irisPos;
    mask.scale = (2 * curRadius) / mask.textureRect.size.width;
    mask.color = color;
    
    [self addChild:mask];
  }
  
  [self schedule:@selector(tick:)];  
  
}

-(void)draw {
  if( inSceneOnTop_ ) {
		[outScene_ visit];
		[inScene_ visit];
	} else {
		[inScene_ visit];
		[outScene_ visit];
	}
  
  glColor4ub(color.r, color.g, color.b, 255);
  
	// Draw top
  gfDrawFilledRect(ccp(0.0f, winSize.height), ccp(winSize.width, irisPos.y + curRadius));
  
	// Draw left
  gfDrawFilledRect(ccp(0.0f, irisPos.y + curRadius), ccp(irisPos.x - curRadius, irisPos.y - curRadius));
  
  // Draw right
  gfDrawFilledRect(ccp(irisPos.x + curRadius, irisPos.y + curRadius), ccp(winSize.width, irisPos.y - curRadius));
  
  // Draw bottom
  gfDrawFilledRect(ccp(0.0f, irisPos.y - curRadius), ccp(winSize.width, 0));
  
  if (!useMask) {
    gfDrawInvertedCircle(irisPos, curRadius, 10);
  }
  
  glColor4ub(255, 255, 255, 255);
  
}

// Return the radius required to inscribe the viewport within a circle centered at self.irisPos
-(void)calculateMaxRadius {
	maxRadius = 0.0f;
  
  float test = ccpDistance(irisPos, ccp(0, 0));
	if (test > maxRadius) {
    maxRadius = test;
  }
  
  test = ccpDistance(irisPos, ccp(0, winSize.height));
	if (test > maxRadius) {
    maxRadius = test;
  }
  
  test = ccpDistance(irisPos, ccp(winSize.width, winSize.height));
	if (test > maxRadius) {
    maxRadius = test;
  }
  
  test = ccpDistance(irisPos, ccp(winSize.width, 0));
	if (test > maxRadius) {
    maxRadius = test;
  }
  
  // Make the maxRadius larger if we are using a mask because the mask is likely not circular.
  // We want to make sure that the mask is not covering the screen at all when the iris is fully open.
  if (useMask) {
    maxRadius = maxRadius * 2.0f;
  }
}

@end


