//
//  ViewController.m
//  ToDoList
//
//  Created by imann24 on 6/19/16.
//  Copyright © 2016 Isaiah Mann. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addTaskButtonClicked:(id)sender {
    if ([self.addTaskTextField.text length] > 0) {
        UIView *addedTaskUIView = [[UIView alloc] init];
        addedTaskUIView.backgroundColor = [UIColor blueColor];
        [addedTaskUIView.heightAnchor constraintEqualToConstant:50].active = true;
        [addedTaskUIView.widthAnchor constraintEqualToConstant:350].active = true;
        // Adapted from: http://stackoverflow.com/questions/3209803/how-to-programmatically-add-text-to-a-uiview
        UILabel *addedTask = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
        [addedTask setTextColor:[UIColor whiteColor]];
        [addedTask setBackgroundColor:[UIColor clearColor]];
        [addedTask setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
        addedTask.text = self.addTaskTextField.text;

        CGFloat borderWidth = 2.0f;
        
        addedTaskUIView.layer.borderColor = [UIColor whiteColor].CGColor;
        addedTaskUIView.layer.borderWidth = borderWidth;
        
        [addedTaskUIView addSubview:addedTask];
        self.addTaskTextField.text = @"";
        [self.taskListStackView addArrangedSubview: addedTaskUIView];
    }
}
@end
