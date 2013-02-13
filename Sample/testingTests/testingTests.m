//
//  testingTests.m
//  testingTests
//
//  Created by David Hardiman on 13/02/2013.
//
//

#import <MIQTestingFramework/MIQTestingFramework.h>
#import "Entity.h"

TEST_CASE_WITH_SUBCLASS(Tests, MIQCoreDataTestBase)

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
    expect(@"a").to.equal(@"a");
}

- (void)testMocky {
    LRMockery *context = [LRMockery mockeryForSenTestCase:self];
    id mock = [context mock:[NSString class]];
    [context checking:^(that) {
        [[oneOf(mock) receives] uppercaseString];
    }];
    [mock uppercaseString];
    assertContextSatisfied(context);
}

- (void)testCoreData {
    Entity *entity = [NSEntityDescription insertNewObjectForEntityForName:@"Entity" inManagedObjectContext:self.managedObjectContext];
    entity.name = @"test";
    entity.date = [NSDate date];
    expect(entity.name).to.equal(@"test");
    expect(entity.date).notTo.beNil();
}

END_TEST_CASE
