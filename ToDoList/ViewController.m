//
//  ViewController.m
//  ToDoList
//
//  Created by imann24 on 6/19/16.
//  Copyright © 2016 Isaiah Mann. All rights reserved.
//

#import "ViewController.h"
#import "DataHolder.h"
@interface ViewController ()

@end

@implementation ViewController


// Adapted from: http://stackoverflow.com/questions/4660371/how-to-add-a-touch-event-to-a-uiview
//The event handling method
- (void)handleTapToDelete:(UITapGestureRecognizer *)recognizer {
    UIView *view = recognizer.view;
    UIView *labelView = [view subviews][0];
    UILabel *label = (UILabel *)labelView;
    NSString *viewText = label.text;
    [[DataHolder sharedInstance] removeData:viewText];
    [[DataHolder sharedInstance] saveData];
    [view removeFromSuperview];
}

- (void)addTapToDelete:(UIView *) view {
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleTapToDelete:)];
    [view addGestureRecognizer:singleFingerTap];
}

- (void)populateExistingTasks {
    NSMutableArray *tasks = [DataHolder sharedInstance].tasks;
    for (int i = 0; i < [tasks count]; i++) {
        [self addTaskToView:tasks[i]];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[DataHolder sharedInstance] loadData];
    [self populateExistingTasks];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addTaskToView:(NSString*)taskName {
    UIView *addedTaskUIView = [[UIView alloc] init];
    addedTaskUIView.backgroundColor = [UIColor blueColor];
    [addedTaskUIView.heightAnchor constraintEqualToConstant:50].active = true;
    [addedTaskUIView.widthAnchor constraintEqualToConstant:350].active = true;
    // Adapted from: http://stackoverflow.com/questions/3209803/how-to-programmatically-add-text-to-a-uiview
    UILabel *addedTask = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
    [addedTask setTextColor:[UIColor whiteColor]];
    [addedTask setBackgroundColor:[UIColor clearColor]];
    [addedTask setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
    addedTask.text = taskName;
    
    CGFloat borderWidth = 2.0f;
    
    addedTaskUIView.layer.borderColor = [UIColor whiteColor].CGColor;
    addedTaskUIView.layer.borderWidth = borderWidth;
    
    [addedTaskUIView addSubview:addedTask];
    
    [self addTapToDelete:addedTaskUIView];
    
    [self.taskListStackView addArrangedSubview: addedTaskUIView];
    
}

- (IBAction)addTaskButtonClicked:(id)sender {
    if ([self.addTaskTextField.text length] > 0) {
        [self addTaskToView:self.addTaskTextField.text];
        [[DataHolder sharedInstance] addData:self.addTaskTextField.text];
        [[DataHolder sharedInstance] saveData];
        self.addTaskTextField.text = @"";
        
    }
}
@end
