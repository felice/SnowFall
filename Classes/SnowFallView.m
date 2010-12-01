//
//  SnowFallView.m
//  SnowFall
//
//  Created by Felice on 03/11/10.
//

#import "SnowFallView.h"
#import <QuartzCore/QuartzCore.h>

#define kDefaultFlakesCount 200
#define kDefaultFlakeWidth 40.0
#define kDefaultFlakeHeight 46.0
#define kDefaultFlakeFileName @"snowflake.png"
#define kDefaultMinimumSize 0.4
#define kDefaultAnimationDurationMin 6.0
#define kDefaultAnimationDurationMax 12.0

@implementation SnowFallView
@synthesize flakesArray;
@synthesize flakesCount;
@synthesize flakeWidth;
@synthesize flakeHeight;
@synthesize flakeFileName;
@synthesize flakeMinimumSize;
@synthesize animationDurationMin;
@synthesize animationDurationMax;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
			// avoid drawing outside the view bounds
		self.clipsToBounds = YES;
			// set default values
		flakesCount = kDefaultFlakesCount;
		flakeWidth = kDefaultFlakeWidth;
		flakeHeight = kDefaultFlakeHeight;
		flakeFileName = kDefaultFlakeFileName;
		flakeMinimumSize = kDefaultMinimumSize;
		animationDurationMin = kDefaultAnimationDurationMin;
		animationDurationMax = kDefaultAnimationDurationMax;
    }
    return self;
}


-(void)createFlakes {	
	srandomdev();
	flakesArray = [[NSMutableArray alloc] initWithCapacity:flakesCount];
	UIImage *flakeImg = [UIImage imageNamed:flakeFileName];
	for (int i=0; i < flakesCount; i++) {
		
			// random flake size, range: from 40% to 100% actual size
		float vz = ((Float32)1.0*(Float32)random()/(Float32)RAND_MAX);
			// check size low boundary limit
		vz = (vz < flakeMinimumSize ? flakeMinimumSize : vz);
		float vw = flakeWidth*vz;
		float vh = flakeHeight*vz;
		
			// ensure flakes span beyond the view right bound, by adding flake width
			// creates the "window" effect with half flakes on the border
		float vx = ((Float32)self.frame.size.width*(Float32)random()/(Float32)RAND_MAX);
			// enlarge content height by 1/2 view height, screen is always well populated
		float vy = ((Float32)self.frame.size.height*1.5*(Float32)random()/(Float32)RAND_MAX);
			// flakes start y position is above upper view bound, add view height
		vy += self.frame.size.height;
		
			// ensure flakes span beyond the view left bound, by subtracting flake width
		vx -= vw;
		
		CGRect frame = CGRectMake(vx, vy, vw, vh);
		
		UIImageView *imageView = [[UIImageView alloc] initWithImage:flakeImg];
		imageView.frame = frame;
		imageView.userInteractionEnabled = NO;
		
		[flakesArray addObject:imageView];
		[self addSubview:imageView];
	}
}

-(void) letItSnow {
	if (!flakesArray)
		[self createFlakes];
	self.backgroundColor = [UIColor clearColor];
	
		// prepare rotation animation
	CABasicAnimation *rotAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
	rotAnimation.repeatCount=1e100;
	rotAnimation.autoreverses=NO;
	rotAnimation.toValue = [NSNumber numberWithFloat:6.28318531];	// 360 degrees in radians
	
		// prepare vertical fall animation
	CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	theAnimation.repeatCount=1e100;
	theAnimation.autoreverses=NO;
	
	for (UIImageView *v in flakesArray)	{
		CGPoint p = v.center;
		float startypos = p.y;
		float endypos = self.frame.size.height;
		p.y = endypos;
		v.center = p;
		float timeInterval = ((Float32)(animationDurationMax-animationDurationMin)*(Float32)random()/(Float32)RAND_MAX);
		theAnimation.duration=timeInterval+animationDurationMin;
		theAnimation.fromValue=[NSNumber numberWithFloat:-startypos];
		[v.layer addAnimation:theAnimation forKey:@"transform.translation.y"];
		
		rotAnimation.duration=timeInterval;
		[v.layer addAnimation:rotAnimation forKey:@"transform.rotation.y"];
	}
}

- (void)dealloc {
	[flakesArray release];
    [super dealloc];
}


@end
