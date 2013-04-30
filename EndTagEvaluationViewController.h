//
//  HTMLLearnerEvaluationViewController.h
//  HTMLLearner
//
//  Created by Andrew Burke on 4/18/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EndTagLessonObject.h"

@interface EndTagEvaluationViewController : UIViewController
-(void)checkString:(NSString *)data forLesson:(EndTagLessonObject *)lesson;
@end
