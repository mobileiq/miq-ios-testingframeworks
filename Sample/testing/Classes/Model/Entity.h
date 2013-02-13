//
//  Entity.h
//  testing
//
//  Created by David Hardiman on 13/02/2013.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * date;

@end
