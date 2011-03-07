//
//  GFSpotlight.m
//  Cocos2D-Iris-Effects
//
//  Created by Jay Roberts on 9/27/10.
//  Copyright 2010 Jay Roberts. All rights reserved.
//

#import "GFSpotlight.h"
#import "GFDrawingPrimitives.h"

@implementation GFSpotlight

+(id)spotWithPosition:(CGPoint)p radius:(float)r color:(ccColor3B)c {
  return [[[self alloc] initWithPosition:p radius:r color:c mask:nil] autorelease]; 
}

+(id)spotWithPosition:(CGPoint)p radius:(float)r color:(ccColor3B)c mask:(NSString*)m {
  return [[[self alloc] initWithPosition:p radius:r color:c mask:m] autorelease]; 
}

-(id)initWithPosition:(CGPoint)p radius:(float)r color:(ccColor3B)c mask:(NSString*)m {
  if( (self=[super init]) ) {
    winSize = [[CCDirector sharedDirector] winSize];

    irisPos = p;
    radius = r;
    color = c;
    opacity = 255;
    if (m != nil) {
			useMask = YES;
      mask = [CCSprite spriteWithFile:m];
      mask.anchorPoint = ccp(0.5f, 0.5f);
      mask.position = p;
      mask.scale = (2 * radius) / mask.textureRect.size.width;
      mask.color = color;
      [self addChild:mask];
    } else {
      useMask = NO;
    }
    
    [self schedule:@selector(tick:)];
  }
	return self;
}

-(void)tick:(ccTime)dt {
  if (useMask) {
    mask.scale = (2 * radius) / mask.textureRect.size.width;  
  }
}

-(CGPoint)position {
  return irisPos;
}

-(void)setPosition:(CGPoint)pos {
  
  if (useMask) {
  	irisPos = pos;
    mask.position = pos;
  }
    
}

-(void)setIrisPosition:(CGPoint)pos {
    irisPos = pos;
}

-(void) setColor:(ccColor3B)givenColor
{
    color = givenColor;
}
-(ccColor3B) color{
    return color;
}
-(GLubyte) opacity{
    return opacity;
}
-(void) setOpacity: (GLubyte) givenOpacity
{
    opacity = givenOpacity;
}
-(void)draw {
  glColor4ub(color.r, color.g, color.b, opacity);
  
	// Draw top

  gfDrawFilledRect(ccp(0.0f, winSize.height), ccp(winSize.width, irisPos.y + radius));
  
	// Draw left
  gfDrawFilledRect(ccp(0.0f, irisPos.y + radius), ccp(irisPos.x - radius, irisPos.y - radius));
  
  // Draw right
  gfDrawFilledRect(ccp(irisPos.x + radius, irisPos.y + radius), ccp(winSize.width, irisPos.y - radius));
  
  // Draw bottom
  gfDrawFilledRect(ccp(0.0f, irisPos.y - radius), ccp(winSize.width, 0));
  
  if (!useMask) {
    gfDrawInvertedCircle(irisPos, radius, 10);
  }
  
  glColor4ub(255, 255, 255, 255);
}

@end
