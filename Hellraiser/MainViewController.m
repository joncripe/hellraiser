#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithCycles:(NSMutableArray *)cycles {
    self = [super init];
    if (self) {
        _cycles = cycles;
        [self setup];
    }
    return self;
}

- (void)setup {
    _trackerOverviewView = [[TrackerOverviewView alloc] initWithCycles:_cycles andFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [_trackerOverviewView setBackgroundColor:[UIColor redColor]];
    [_trackerOverviewView setDelegate:self];
    [self.view addSubview:_trackerOverviewView];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)saveData {
    if ([self delegate] != nil && [[self delegate] respondsToSelector:@selector(saveDataRequest)]) {
        [[self delegate] saveDataRequest];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TrackerOverviewViewDelegate

- (void)cycleViewButtonTouched:(UIButton *)sender {
    NSLog(@"%@", [_cycles objectAtIndex:sender.tag]);
}

- (void)addNewCycleViewButtonTouched:(UIButton *)sender {
    // Todo: add a cycle when button touched
    [self saveData];
}

@end