//
//  DataHolder.m
//  ToDoList
//
//  Created by imann24 on 6/19/16.
//  Copyright © 2016 Isaiah Mann. All rights reserved.
//

// Adapted from: http://stackoverflow.com/questions/19197448/how-to-save-data-in-ios
#import <Foundation/Foundation.h>

@interface DataHolder : NSObject

+ (DataHolder *)sharedInstance;

@property (strong) NSMutableArray *tasks;

-(void) saveData;
-(void) loadData;
-(void) addData:(NSString *)addedTask;
-(void)removeData:(NSString *)taskToRemove;
@end