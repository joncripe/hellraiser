#import "TrackerOverviewView.h"

@implementation TrackerOverviewView

#define kBackgroundP 10
#define kCycleViewButtonH 80
#define kAddButtonH 80
#define kLineH 1

- (id)initWithCycles:(NSMutableArray *)cycles andFrame:(CGRect)rect {
    self = [super initWithFrame:rect];
    if (self) {
        _cycles = cycles;
        [self setup];
    }
    return self;
}

- (void)setup {
    
    UIScrollView *cycleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kStatusBarH, self.frame.size.width, self.frame.size.height - (kAddButtonH + kStatusBarH))];
    [self addSubview:cycleScrollView];
    
    CGFloat cycleViewOffsetY = 0;
    for (NSInteger i = 0; i < [_cycles count]; i++) {
        UIButton *cycleViewButton = [[UIButton alloc] initWithFrame:CGRectMake(0, cycleViewOffsetY, self.frame.size.width, kCycleViewButtonH)];
        [cycleViewButton setTag:i];
        [cycleViewButton setBackgroundColor:[UIColor redColor]];
        [cycleViewButton addTarget:self action:@selector(cycleViewButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [cycleScrollView addSubview:cycleViewButton];
        
        UILabel *label = [[UILabel alloc] init];
        [label setText:[NSString stringWithFormat:@"Week %ld", i + 1]];
        [label setTextColor:[UIColor whiteColor]];
        [label sizeToFit];
        [label setFrame:CGRectMake(0, 0, label.frame.size.width, label.frame.size.height)];
        [label setCenter:CGPointMake((cycleViewButton.frame.size.width / 2), (cycleViewButton.frame.size.height / 2))];
        [cycleViewButton addSubview:label];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(cycleViewButton.frame.origin.x, cycleViewButton.frame.size.height - kLineH, cycleViewButton.frame.size.width, kLineH)];
        [line setBackgroundColor:[UIColor blackColor]];
        [cycleViewButton addSubview:line];
        
        cycleViewOffsetY += cycleViewButton.frame.size.height;
    }
    
    [cycleScrollView setContentSize:CGSizeMake(self.frame.size.width, cycleViewOffsetY)];
    
    UIButton *addNewCycle = [[UIButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height - kAddButtonH, self.frame.size.width, kAddButtonH)];
    [addNewCycle setBackgroundColor:[UIColor blackColor]];
    [addNewCycle setTitle:@"Add New Cycle" forState:UIControlStateNormal];
    [addNewCycle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addNewCycle addTarget:self action:@selector(addNewCycleViewButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addNewCycle];
}

- (void)cycleViewButtonTouched:(UIButton *)sender {
    if ([self delegate] != nil && [[self delegate] respondsToSelector:@selector(cycleViewButtonTouched:)]) {
        [[self delegate] cycleViewButtonTouched:sender];
    }
}

- (void)addNewCycleViewButtonTouched:(UIButton *)sender {
    if ([self delegate] != nil && [[self delegate] respondsToSelector:@selector(addNewCycleViewButtonTouched:)]) {
        [[self delegate] addNewCycleViewButtonTouched:sender];
    }
}

@end