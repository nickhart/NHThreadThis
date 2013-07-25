//
//  NHViewController.m
//  NHThreadThis
//
//  Created by Nicholas Hart on 7/24/13.
//  Copyright (c) 2013 Nicholas Hart. All rights reserved.
//

#import "NHViewController.h"
#import "NHTestCell.h"
#import "NHThreadThis.h"

#define kDismissLabel           NSLocalizedString(@"Dismiss", @"Dismiss label")
#define RANDOM_FLOAT()          ((CGFloat)arc4random())/((CGFloat)UINT32_MAX)
#define RANDOM_INTERVAL()       (RANDOM_FLOAT() * 2.0)

#define kIndexKey               @"index"
#define kTextLabelKey           @"textLabel"
#define kBackgroundColorKey     @"backgroundKey"

@interface NHViewController ()

@property (nonatomic, strong) NSMutableSet * completedTasks;
@property (nonatomic, strong) NSArray * sortedTasks;

@end

@implementation NHViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self startTest];
}

#pragma mark private methods

- (void)startTest {
    self.completedTasks = [NSMutableSet set];
    // XXXNH: Stand back! I'm going to try science!
    SEL testSelector = NSSelectorFromString(self.testName);
    NSParameterAssert([self respondsToSelector:testSelector]);
    if ([self respondsToSelector:testSelector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:testSelector];
#pragma clang diagnostic pop
    }
}

- (void)taskCompleted: (NSUInteger) taskIndex {
    UIColor * backgroundColor = [UIColor colorWithRed:RANDOM_FLOAT() green:RANDOM_FLOAT() blue:RANDOM_FLOAT() alpha:0.5];
    NSDictionary * taskConfig = @{ kIndexKey : @(taskIndex),
                                   kTextLabelKey: [@(taskIndex) stringValue],
                                   kBackgroundColorKey : backgroundColor };
    [self.completedTasks addObject:taskConfig];
    self.sortedTasks = [self.completedTasks sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:kIndexKey ascending:YES]]];
    [self.collectionView reloadData];
}

- (void)randomTask: (NSUInteger) index completion: (void(^)(NSUInteger)) completion {
    [NSThread sleepForTimeInterval:RANDOM_INTERVAL()];
    NSLog(@"task %u complete", index);
    completion(index);
}

- (void)basicTest {
    __weak NHViewController * weakSelf = self;
    NHThreadThis * mainThis = [NHThreadThis mainThis];
    __block NSUInteger index = 0;
    [[[[[[[[[[[[[[[[[[[[[NHThreadThis backgroundThisWithConcurrentQueueNamed:self.testName] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }];
}

- (void)groupTest {
    __weak NHViewController * weakSelf = self;
    NHThreadThis * mainThis = [NHThreadThis mainThis];
    __block NSUInteger index = 0;
    [[[[[[[[[[[[[[[[[[[[[[[NHThreadThis backgroundThisWithConcurrentQueueNamed:self.testName] groupThese] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] notifyThis:^{
        [mainThis doThis:^{
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Group Test", @"Group Test alert title")
                                        message:NSLocalizedString(@"All tasks complete!", @"Group Test alert message")
                                       delegate:nil
                              cancelButtonTitle:kDismissLabel
                              otherButtonTitles:nil] show];
        }];
    }];
}

- (void)notifyBarrierTask {
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Barrier Test", @"Barrier Test alert title")
                                message:NSLocalizedString(@"All tasks complete!", @"Barrier Test alert message")
                               delegate:nil
                      cancelButtonTitle:kDismissLabel
                      otherButtonTitles:nil] show];
}

// the barrier is used for a multiple-reader, single-writer pattern.
- (void)barrierTest {
    __weak NHViewController * weakSelf = self;
    NHThreadThis * mainThis = [NHThreadThis mainThis];
    __block NSUInteger index = 0;
    [[[[[[[[[[[[[[[[[[[[NHThreadThis backgroundThisWithConcurrentQueueNamed:self.testName] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThisBarrier:^{
        [mainThis doThisAndWait:^{
            [weakSelf notifyBarrierTask];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThisBarrier:^{
        [mainThis doThisAndWait:^{
            [weakSelf notifyBarrierTask];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThisBarrier:^{
        [mainThis doThisAndWait:^{
            [weakSelf notifyBarrierTask];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }] doThis:^{
        [self randomTask:index++ completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    }];
}

// XXXNH: this is currently broken...
- (void)iterationTest {
    __weak NHViewController * weakSelf = self;
    NHThreadThis * mainThis = [NHThreadThis mainThis];
    [[[NHThreadThis backgroundThisWithConcurrentQueueNamed:self.testName] doThis:^(size_t count){
        [self randomTask:count completion:^(NSUInteger result) {
            [mainThis doThis:^{
                [weakSelf taskCompleted:result];
            }];
        }];
    } iterations:16] doThisBarrier:^{
        [mainThis doThis:^{
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Iteration Test", @"Iteration Test alert title")
                                        message:NSLocalizedString(@"All tasks complete!", @"Iteration Test alert message")
                                       delegate:nil
                              cancelButtonTitle:kDismissLabel
                              otherButtonTitles:nil] show];
        }];
    }];
}

#pragma mark UICollectionViewDataSource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSParameterAssert(section == 0);
    return section == 0 ? [self.completedTasks count] : 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * reuseIdentifier = @"TestCell";
    NHTestCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSDictionary * taskConfig = [self.sortedTasks objectAtIndex:indexPath.row];
    cell.backgroundColor = [taskConfig objectForKey:kBackgroundColorKey];
    cell.textLabel.text = [taskConfig objectForKey:kTextLabelKey];
    return cell;
}

@end
