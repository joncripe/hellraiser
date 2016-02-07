#import <UIKit/UIKit.h>
#import "Constants.h"

@interface TrackerOverviewView : UIView

@property (nonatomic,strong) id delegate;
@property (nonatomic,strong) NSMutableArray *cycles;

- (id)initWithCycles:(NSMutableArray *)cycles andFrame:(CGRect)rect;

@end

@protocol TrackerOverviewViewDelegate <NSObject>
@required

- (void)cycleViewButtonTouched:(UIButton *)sender;
- (void)addNewCycleViewButtonTouched:(UIButton *)sender;

@end