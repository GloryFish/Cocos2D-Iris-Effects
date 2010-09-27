//
//  Cocos2D_Iris_EffectsAppDelegate.h
//  Cocos2D-Iris-Effects
//
//  Created by Jay Roberts on 9/27/10.
//  Copyright Jay Roberts 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface Cocos2D_Iris_EffectsAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
