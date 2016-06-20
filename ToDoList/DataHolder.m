//
//  DataHolder.h
//  ToDoList
//
//  Created by imann24 on 6/19/16.
//  Copyright © 2016 Isaiah Mann. All rights reserved.
//

// Adapted from: http://stackoverflow.com/questions/19197448/how-to-save-data-in-ios

#import <Foundation/Foundation.h>
#import "DataHolder.h"

NSString * const kTasks = @"kTasks";

@implementation DataHolder : NSObject

- (id) init
{
    self = [super init];
    if (self)
    {
        self.tasks = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (DataHolder *)sharedInstance
{
    static DataHolder *_sharedInstance = nil;
    static dispatch_once_t onceSecurePredicate;
    dispatch_once(&onceSecurePredicate,^
                  {
                      _sharedInstance = [[self alloc] init];
                  });
    
    return _sharedInstance;
}

-(void)saveData {
    [[NSUserDefaults standardUserDefaults]
     setObject:[NSMutableArray arrayWithArray:self.tasks] forKey:kTasks];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)loadData {
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kTasks]) {
        self.tasks = [NSMutableArray arrayWithArray:(NSMutableArray *)[[NSUserDefaults standardUserDefaults]
                                   objectForKey:kTasks]];
    } else {
        self.tasks = [[NSMutableArray alloc] init];
    }
}

-(void)addData:(NSString *)addedTask {
    [self.tasks addObject:addedTask];
}

@end