//
//  HelloWorldLayer.m
//  Cocos2D-Iris-Effects
//
//  Created by Jay Roberts on 9/27/10.
//  Copyright Jay Roberts 2010. All rights reserved.
//

#import "MainMenuScene.h"
#import "TransitionTestScene.h"
#import "SpotlightTestScene.h"
#import "CCTransitionIris.h"

@implementation MainMenuScene

+(id) scene
{
	CCScene *scene = [CCScene node];
	MainMenuScene *layer = [MainMenuScene node];
	[scene addChild: layer];
	return scene;
}

-(id) init {
	if( (self=[super init] )) {
		
    CCMenuItem* transitionTest = [CCMenuItemFont itemFromString:@"Iris Transition Test" target:self selector:@selector(onTransitionTest)];
    CCMenuItem* transitionMaskTest = [CCMenuItemFont itemFromString:@"Iris Transition Mask Test" target:self selector:@selector(onTransitionMaskTest)];
    CCMenuItem* spotlightTest = [CCMenuItemFont itemFromString:@"Spotlight Test" target:self selector:@selector(onSpotlightTest)];
    
    CCMenu* menu = [CCMenu menuWithItems:transitionTest, transitionMaskTest, spotlightTest, nil];
    [menu alignItemsVerticallyWithPadding:30.0f];
    [self addChild:menu];
    

	}
	return self;
}

-(void)onTransitionTest {
  CCScene* scene = [TransitionTestScene scene];
  
  [[CCDirector sharedDirector]replaceScene:[CCTransitionIris transitionWithDuration:2.0f scene:scene irisPosition:ccp([[CCDirector sharedDirector] winSize].width / 2, [[CCDirector sharedDirector] winSize].height / 2) radius:0.0f color:ccRED]];
}

-(void)onTransitionMaskTest {
  CCScene* scene = [TransitionTestScene scene];
  
  [[CCDirector sharedDirector]replaceScene:[CCTransitionIris transitionWithDuration:2.0f scene:scene irisPosition:ccp([[CCDirector sharedDirector] winSize].width / 2, [[CCDirector sharedDirector] winSize].height / 2) radius:0.0f color:ccYELLOW mask:@"mask-star-128.png"]];
}

-(void)onSpotlightTest {
  CCScene* scene = [SpotlightTestScene scene];
  
  [[CCDirector sharedDirector]replaceScene:[CCTransitionIris transitionWithDuration:2.0f scene:scene irisPosition:ccp([[CCDirector sharedDirector] winSize].width / 2, [[CCDirector sharedDirector] winSize].height / 2) radius:0.0f color:ccWHITE]];
}


- (void) dealloc {
	[super dealloc];
}

@end