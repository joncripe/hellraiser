#import <Foundation/Foundation.h>
#import "SubCycleOneObject.h"
#import "SubCycleTwoObject.h"
#import "SubCycleThreeObject.h"
#import "SubCycleFourObject.h"

@interface CycleObject : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) SubCycleOneObject *subCycleOne;
@property (nonatomic, strong) SubCycleTwoObject *subCycleTwo;
@property (nonatomic, strong) SubCycleThreeObject *subCycleThree;
@property (nonatomic, strong) SubCycleFourObject *subCycleFour;

@end