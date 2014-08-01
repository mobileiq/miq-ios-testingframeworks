//
//  OCMockObject+AsyncVerify.m
//  testingframeworks
//
//  Created by Sebastian Skuse on 25/07/2014.
//  Copyright (c) 2014 Mobile IQ Ltd. All rights reserved.
//

#import "OCMockObject+AsyncVerify.h"

@implementation OCMockObject (AsyncVerify)

- (void)waitForVerificationWithTimeout:(NSTimeInterval)timeout {
    [self waitForVerificationWithTimeout:timeout interval:0.2];
}

- (void)waitForVerificationWithTimeout:(NSTimeInterval)timeout interval:(NSTimeInterval)interval {
    NSTimeInterval i = 0;
    while (i < timeout) {
        @try {
            [self verify];
            return;
        }
        @catch (NSException *e) {}
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
        i += interval;
    }
    [self verify];
}

@end
