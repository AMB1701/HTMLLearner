//
//  HTMLLearnerTextEntryViewController.h
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EndTagLessonObject.h"

@interface EndTagTextEntryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *userEntryTextField;
-(void)shareLesson:(EndTagLessonObject *)l;
@end
