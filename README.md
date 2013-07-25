NHThreadThis
============

NHThreadThis is a set of Objective-C utilities to wrap and simplify using dispatch queues.
This source code is offered to the public with no guarantees.
It's mostly a set of helpers for my own use to cut down on some of the boilerplate code involved with using dispatch queues.
If you find it useful or have suggestions, feel free to drop me a note!

This source code is provided for free, licensed via the [MIT License](http://opensource.org/licenses/MIT).

Examples
========

To quickly throw some code onto a background thread with default priority:
```Objective-C
    [[NHThreadThis backgroundThis] doThis:^{
        // do your task...
    }];
```

To perform several tasks in the background:
```Objective-C
    [[[NHThreadThis backgroundThis] doThis:^{
        // do one task...
    }] doThis:^{
        // do another task...
    }];
```

To use a dispatch group, in order to ensure several tasks complete before performing an additional task:
```Objective-C
    [[[[[[[NHThreadThis backgroundThis] groupThese] doThis:^{
        // do one task...
    }] doThis:^{
        // do another task...
    }] doThis:^{
        // do yet another task...
    }] waitForever] doThis:^{
        // do this when all the other tasks are done
    }];
```

To use a barrier (for example, often used in a multiple-reader, single-writer pattern):
```Objective-C
    [[[[[[[NHThreadThis backgroundThisWithConcurrentQueueNamed:@"MyQueue"] groupThese] doThis:^{
        // do one task...
    }] doThis:^{
        // do another task...
    }] doThis:^{
        // do yet another task...
    }] doThisBarrier:^{
        // wait until the other tasks are done and prevent others from executing while this one is...
    }] doThis:^{
        // do another task after the barrier task is done...
    }];
```
*NOTE: be sure to use a private queue (not a global queue), as dispatch_barrier_async() will treat the invocation as dispatch_async() when used with a global queue.  This is disallowed in NHThreadThis's doThisBarrier: implementation.


