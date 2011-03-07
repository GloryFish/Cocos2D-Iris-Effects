//
//  SpotlightTestScene.m
//  Cocos2D-Iris-Effects
//
//  Created by Jay Roberts on 9/27/10.
//  Copyright 2010 Jay Roberts. All rights reserved.
//

// Import the interfaces
#import "SpotlightTestScene.h"
#import "MainMenuScene.h"
#import "CCTransitionIris.h"


@implementation SpotlightTestScene

+(id) scene {
	CCScene *scene = [CCScene node];
	SpotlightTestScene *layer = [SpotlightTestScene node];
	[scene addChild: layer];
	return scene;
}

-(id) init {
	if( (self=[super init])) {
		[self addChild: [CCLayerColor layerWithColor: ccc4(255, 255, 255, 255)] ];
		self.isTouchEnabled = YES;
		
		CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Spotlight" fontName:@"Marker Felt" fontSize:32];
    label.position = ccp(screenSize.width /2, screenSize.height / 2);
		[self addChild: label];
    
    CCMenuItem* returnToMenu = [CCMenuItemFont itemFromString:@"Return to Menu" target:self selector:@selector(onMainMenu)];
    CCMenu* menu = [CCMenu menuWithItems:returnToMenu, nil];
    menu.position = ccp((returnToMenu.rect.size.width / 2) + screenSize.width * 0.50f, 30);
    [self addChild:menu];
    
    spotlight = [GFSpotlight spotWithPosition:ccp(200, 300) radius:50.0f color:ccBLACK];
        [spotlight setOpacity: 255/100 *20];
    
    [self addChild: spotlight];
    
    id actionTo = [CCMoveTo actionWithDuration: 10 position:ccp(1000, 800)];
    
    [spotlight runAction: actionTo];
    
	}
    
	return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if ([touches count] == 1) {
    UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];	
        NSLogPoint(touchLocation);
		CCLOG(@"Touch at: %@", NSStringFromCGPoint(touchLocation));
    [spotlight setIrisPosition:touchLocation];
    
	}
}

- (void)onMainMenu {
  CCScene* scene = [MainMenuScene scene];
  
  [[CCDirector sharedDirector] replaceScene:[CCTransitionIris transitionWithDuration:2.0f scene:scene irisPosition:ccp([[CCDirector sharedDirector] winSize].width / 2, [[CCDirector sharedDirector] winSize].height / 2) radius:0.0f color:ccBLUE]];
}

- (void) dealloc {
	[super dealloc];
}


@end