//
//  HTMLLearnerLessonPreviewViewController.h
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMLLearnerLessonObject.h"

@interface HTMLLearnerLessonPreviewViewController : UIViewController
@property (nonatomic, strong) HTMLLearnerLessonObject *lessonData;
@property (nonatomic, strong) NSString *lessonCode;
-(void) shareLesson:(HTMLLearnerLessonObject *)lesson;
@end
