#import "AppDelegate.h"
#import "Constants.h"
#import "CycleObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:kSaveDataFilePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *savedData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        if ([savedData objectForKey:kCycles] != nil) { // If Data, Load and Copy It
            self.cycles = [[NSMutableArray alloc] initWithArray:[[savedData objectForKey:kCycles] mutableCopy]];
        }
    }
    
    // If No Data Loaded
    if (self.cycles == nil) {
        self.cycles = [[NSMutableArray alloc] init];
        
        // Add Default First Cycle
        CycleObject *newCycleObject = [[CycleObject alloc] init];
        [self.cycles addObject:newCycleObject];
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.backgroundColor = [UIColor blackColor];
    _mainViewController = [[MainViewController alloc] initWithCycles:_cycles];
    [self.mainViewController setDelegate:self];
    [self.window setRootViewController:_mainViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)saveData {
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (self.cycles != nil) {
        [dataDict setObject:self.cycles forKey:kCycles];  // save the cycles array
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:kSaveDataFilePath];
    
    [NSKeyedArchiver archiveRootObject:dataDict toFile:filePath];
}

#pragma mark - MainViewControllerDelegate

- (void)saveDataRequest {
    NSLog(@"Save");
    [self saveData];
}

@end