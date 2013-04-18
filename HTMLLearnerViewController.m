//
//  HTMLLearnerViewController.m
//  HTMLLearner
//
//  Created by Andrew Burke on 3/7/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import "HTMLLearnerViewController.h"
#import "HTMLLearnerLessonChoiceViewController.h"

@interface HTMLLearnerViewController ()
@property (nonatomic, strong) NSString *chosenLanguage;

@end

@implementation HTMLLearnerViewController
@synthesize chosenLanguage = _chosenLanguage;

- (IBAction)segueToLessons:(id)sender
{
    [self performSegueWithIdentifier:@"toLessonsSegue" sender:self];
}

- (IBAction)segueToHTMLLessons:(id)sender
{
    _chosenLanguage = @"HTML";
    [self performSegueWithIdentifier:@"toLessonListSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toLessonListSegue"])
    {
        [segue.destinationViewController listItemsForLanguage:_chosenLanguage];
    }
}

- (IBAction)toCredits:(id)sender
{
    [self performSegueWithIdentifier:@"toCreditsSegue" sender:self];
}

@end
