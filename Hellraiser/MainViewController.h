#import <UIKit/UIKit.h>
#import "TrackerOverviewView.h"
#import "Constants.h"

@interface MainViewController : UIViewController <TrackerOverviewViewDelegate>

@property (nonatomic, strong) TrackerOverviewView *trackerOverviewView;
@property (nonatomic,strong) id delegate;
@property (nonatomic,strong) NSMutableArray *cycles;

- (id)initWithCycles:(NSMutableArray *)cycles;

@end

@protocol MainViewControllerDelegate <NSObject>
@required

- (void)saveDataRequest;

@end