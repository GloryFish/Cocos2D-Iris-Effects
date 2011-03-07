//
//  TransitionTestScene.h
//
//  Created by Jay Roberts on 9/7/10.
//

#import "cocos2d.h"

@interface TransitionTestScene : CCLayer {
	
@private CGPoint firstTouch;
  
}

+(id) scene;
-(void) onMainMenu;
@end