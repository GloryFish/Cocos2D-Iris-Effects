//
//  SpotlightTestScene.h
//  Cocos2D-Iris-Effects
//
//  Created by Jay Roberts on 9/27/10.
//

#import "cocos2d.h"
#import "GFSpotlight.h"
@interface SpotlightTestScene : CCLayer {
	
	@private CGPoint firstTouch;
  @private GFSpotlight* spotlight; 
}

+(id) scene;
-(void)  onMainMenu;
@end