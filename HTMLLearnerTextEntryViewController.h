//
//  HTMLLearnerTextEntryViewController.h
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMLLearnerResultsViewController.h"
#import "HTMLLearnerLessonObject.h"

@interface HTMLLearnerTextEntryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *userEntryTextField;
@property (nonatomic, strong) HTMLLearnerLessonObject *lessonData;
-(void)shareLesson:(HTMLLearnerLessonObject *)l;
@end
