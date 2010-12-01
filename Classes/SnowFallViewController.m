//
//  SnowFallViewController.m
//  SnowFall
//
//  Created by Felice on 30/11/10.
//

#import "SnowFallViewController.h"
#import "SnowFallView.h"

@implementation SnowFallViewController


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
	[self.view addSubview:bg];
	[bg release];
	SnowFallView *sfv = [[SnowFallView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width*2, self.view.frame.size.height*2)];
	sfv.flakesCount = 400;
	[self.view addSubview:sfv];
	[sfv letItSnow];
	[sfv release];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
