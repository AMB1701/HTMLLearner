//
//  HTMLLearnerEvaluationViewController.m
//  HTMLLearner
//
//  Created by Andrew Burke on 4/18/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import "EndTagEvaluationViewController.h"

@interface EndTagEvaluationViewController ()
@property (strong, nonatomic) NSString* dataEntered;
@property (strong, nonatomic) NSString* lessonAnswer;
@property (nonatomic) NSUInteger errors;
@property (weak, nonatomic) IBOutlet UIWebView *expectedView;
@property (weak, nonatomic) IBOutlet UIWebView *actualView;
@property (weak, nonatomic) IBOutlet UILabel *happyLabel;
@property (weak, nonatomic) IBOutlet UILabel *errorsLabel;

@end

@implementation EndTagEvaluationViewController
@synthesize dataEntered = _dataEntered, lessonAnswer = _lessonAnswer, expectedView = _expectedView, actualView = _actualView, happyLabel = _happyLabel, errorsLabel = _errorsLabel, errors;

-(void)checkString:(NSString *)data forLesson:(EndTagLessonObject *)lesson
{
    _dataEntered = [@"<solution>" stringByAppendingString:data];
    _dataEntered = [_dataEntered stringByAppendingString:@"</>"];
    _lessonAnswer = [lesson getSolution];
    NSLog(@"\nD: %@\nA: %@", _dataEntered, _lessonAnswer);
    errors = 0;
    
    for (NSUInteger i=0; i<[data length] && i < [_lessonAnswer length]; i++)
    {
        if ([_dataEntered characterAtIndex:i] != [_lessonAnswer characterAtIndex:i])
        {
            //NSString *hint = [NSString stringWithFormat:@"found %c expected %c", [_lessonAnswer characterAtIndex:i]];
            //NSLog(@"Mismatch found, hint is: %@",hint);
            errors++;
        }
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [_expectedView loadHTMLString:_lessonAnswer baseURL:nil]; 
    [_actualView loadHTMLString:_dataEntered baseURL:nil];
    _errorsLabel.text = [NSString stringWithFormat:@"Total errors found: %d", errors];
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
