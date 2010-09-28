//
//  SpotlightTestScene.h
//  Cocos2D-Iris-Effects
//
//  Created by Jay Roberts on 9/27/10.
//

#import "cocos2d.h"

@interface SpotlightTestScene : CCLayer {
	
	@private CGPoint firstTouch;
  @private CCNode* spotlight; 
}

+(id) scene;

@end