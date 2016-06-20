//
//  ViewController.h
//  ToDoList
//
//  Created by imann24 on 6/19/16.
//  Copyright © 2016 Isaiah Mann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)addTaskButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *addTaskTextField;
@property (weak, nonatomic) IBOutlet UIStackView *taskListStackView;


@end

