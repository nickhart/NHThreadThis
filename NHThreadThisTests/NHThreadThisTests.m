//
//  NHThreadThisTests.m
//  NHThreadThisTests
//
//  Created by Nicholas Hart on 7/24/13.
//  Copyright (c) 2013 Nicholas Hart. All rights reserved.
//

#import "NHThreadThisTests.h"
#import "NHThreadThis.h"

@implementation NHThreadThisTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExampleGroupAndWait
{
    __block NSUInteger index = 0;
    [[[[[[[[[[[[[[NHThreadThis backgroundThis] groupThese] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] waitForever] doThisAndWait:^{
        NSLog(@"done %u", index);
    }];
}

- (void)testExampleGroupBarrierAndWait
{
    __block NSUInteger index = 0;
    [[[[[[[[[[[[[[[[NHThreadThis backgroundThisWithConcurrentQueueNamed:@"MyQueue"] groupThese] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThisBarrier:^{
        index = 0;
        NSLog(@"barrier %u", index);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThis:^{
        NSLog(@"in background %u", index++);
    }] doThisBarrier:^{
        index = 0;
        NSLog(@"barrier %u", index);
    }] waitForever] doThisAndWait:^{
        NSLog(@"done %u", index);
    }];
}

- (void)testThreadThisIterations
{
    __block NSUInteger index = 0;
    [[[[[[[[NHThreadThis backgroundThisWithConcurrentQueueNamed:@"MyQueue"] groupThese] doThis:^(size_t count) {
        NSLog(@"in background %u (count %zu)", index++, count);
    } iterations:5] doThisBarrier:^{
        index = 0;
        NSLog(@"barrier %u", index);
    }] doThis:^(size_t count) {
        NSLog(@"in background %u (count %zu)", index++, count);
    } iterations:5] doThisBarrier:^{
        index = 0;
        NSLog(@"barrier %u", index);
    }] waitForever] doThisAndWait:^{
        NSLog(@"done %u", index);
    }];
}

@end
