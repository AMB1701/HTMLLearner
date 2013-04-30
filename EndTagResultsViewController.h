//
//  HTMLLearnerResultsViewController.h
//  HTMLLearner
//
//  Created by Andrew Burke on 3/26/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EndTagLessonObject.h"

@interface EndTagResultsViewController : UIViewController <UIWebViewDelegate>

-(void)loadWithHTMLData:(NSString *)data forLesson:(EndTagLessonObject *)lesson;

@end
