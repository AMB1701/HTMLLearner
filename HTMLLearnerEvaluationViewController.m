//
//  HTMLLearnerEvaluationViewController.m
//  HTMLLearner
//
//  Created by Andrew Burke on 4/18/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import "HTMLLearnerEvaluationViewController.h"

@interface HTMLLearnerEvaluationViewController ()
@property (strong, nonatomic) NSString* dataEntered;
@property (strong, nonatomic) NSString* lessonAnswer;
@property (weak, nonatomic) IBOutlet UILabel *expectedLabel;
@property (weak, nonatomic) IBOutlet UILabel *actualLabel;
@property (weak, nonatomic) IBOutlet UILabel *happyLabel;

@end

@implementation HTMLLearnerEvaluationViewController
@synthesize dataEntered = _dataEntered, lessonAnswer = _lessonAnswer, expectedLabel = _expectedLabel, actualLabel = _actualLabel, happyLabel = _happyLabel;

-(void)checkString:(NSString *)data forLesson:(NSString *)lesson
{
    _dataEntered = data;
    _lessonAnswer = lesson;
}

-(void)viewWillAppear:(BOOL)animated
{
    _expectedLabel.text = [NSString stringWithFormat:@"Expected: %@", _lessonAnswer];
    _actualLabel.text = [NSString stringWithFormat:@"Received: %@", _dataEntered];
    if([_dataEntered isEqualToString:_lessonAnswer])
    {
        _happyLabel.text = @"Great job!";
        //NSLog(@"Lesson completed successfully.");
    }
    else
    {
        _happyLabel.text = @"Looks like there were some mistakes...";
        //NSLog(@"Lesson incomplete.");
    }
    
    [super viewWillAppear:animated];
}

- (IBAction)chooseNewLesson:(id)sender
{
    [self performSegueWithIdentifier:@"returnToLessonListSegue" sender:self];
}

@end
