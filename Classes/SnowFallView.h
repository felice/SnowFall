//
//  SnowFallView.h
//  SnowFall
//
//  Created by Felice on 03/11/10.
//

#import <UIKit/UIKit.h>

@interface SnowFallView : UIView {
		// how many flakes in the view
	NSInteger		flakesCount;
	
		// file name of flake image
		// adjust flake size accordingly
	NSString		*flakeFileName;
	
		// flake maximum size
	float			flakeWidth;
	float			flakeHeight;
		// flake minimum size as % of maximum size
		// range 0,0 to 1.0  (1.0 = maximum size)
	float			flakeMinimumSize;

		// animation duration
	float animationDurationMin;
	float animationDurationMax;
	
		// do not change
	NSMutableArray	*flakesArray;
	
}

@property (nonatomic, retain) NSMutableArray *flakesArray;
@property (nonatomic, retain) NSString *flakeFileName;
@property (nonatomic, assign) NSInteger flakesCount;
@property (nonatomic, assign) float flakeWidth;
@property (nonatomic, assign) float flakeHeight;
@property (nonatomic, assign) float flakeMinimumSize;
@property (nonatomic, assign) float animationDurationMin;
@property (nonatomic, assign) float animationDurationMax;

-(void) letItSnow;
@end
