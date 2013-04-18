//
//  HTMLLearnerLessonPreviewViewController.h
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTMLLearnerLessonPreviewViewController : UIViewController
@property (nonatomic, strong) NSString *lessonCode;
@property (nonatomic, strong) NSString *lessonData;
-(void) showCode:(NSString *)code forLesson:(NSString *)lesson;
@end
