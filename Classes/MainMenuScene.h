//
//  MainMenuScene.h
//  Cocos2D-Iris-Effects
//
//  Created by Jay Roberts on 9/27/10.
//  Copyright Jay Roberts 2010. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorld Layer
@interface MainMenuScene : CCLayer
{
}

// returns a Scene that contains the HelloWorld as the only child
+(id) scene;
-(void) onTransitionTest;
-(void) onTransitionMaskTest;
-(void) onSpotlightTest;
@end
