//
//  SnowFallAppDelegate.h
//  SnowFall
//
//  Created by Felice on 30/11/10.
//

#import <UIKit/UIKit.h>

@class SnowFallViewController;

@interface SnowFallAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SnowFallViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SnowFallViewController *viewController;

@end

