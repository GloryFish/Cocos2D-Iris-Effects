//
//  GFSpotlight.h
//  Cocos2D-Iris-Effects
//
//  Created by Jay Roberts on 9/27/10.
//

#import "cocos2d.h"

@interface GFSpotlight : CCNode<CCRGBAProtocol> {

	@private CGSize winSize;
	@private CGPoint irisPos;
	@private ccColor3B color;
	@private float radius;
	@private BOOL useMask;
	@private CCSprite* mask;
    @private GLubyte opacity;
}

+(id)spotWithPosition:(CGPoint)p radius:(float)r color:(ccColor3B)c;
+(id)spotWithPosition:(CGPoint)p radius:(float)r color:(ccColor3B)c mask:(NSString*)m;
-(id)initWithPosition:(CGPoint)p radius:(float)r color:(ccColor3B)c mask:(NSString*)m;

-(CGPoint)position;
-(void)setPosition:(CGPoint)pos;
-(void)setIrisPosition:(CGPoint)pos;
@end
