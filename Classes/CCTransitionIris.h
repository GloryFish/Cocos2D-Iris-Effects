//
//  CCTransitionIris.h
//
//  Created by Jay Roberts on 9/7/10.
//

#import "cocos2d.h"

@interface CCTransitionIris : CCTransitionScene {
  CGPoint irisPos;
  CCSprite* mask;
  float radius;
  
  @private ccColor3B color;
  @private CGSize winSize;
  @private ccTime elapsed;
  @private float maxRadius;
  @private float curRadius;
  @private bool shrinking;
  @private bool useMask;
	@private NSString* maskFile;
}

+(id)transitionWithDuration:(ccTime)t scene:(CCScene *)s irisPosition:(CGPoint) p radius:(float)r;
+(id)transitionWithDuration:(ccTime)t scene:(CCScene *)s irisPosition:(CGPoint) p radius:(float)r color:(ccColor3B)c;
+(id)transitionWithDuration:(ccTime)t scene:(CCScene *)s irisPosition:(CGPoint) p radius:(float)r color:(ccColor3B)c mask:(NSString*)m;

-(id)initWithDuration:(ccTime)t scene:(CCScene *)s irisPosition:(CGPoint) p radius:(float)r color:(ccColor3B)c mask:(NSString*)m;

-(void)tick:(ccTime)dt;

-(void)calculateMaxRadius;

@end