//
//  HTMLLearnerLessonChoiceViewController.h
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMLLearnerLessonObject.h"

@interface HTMLLearnerLessonChoiceViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *tableData;
}
@property (nonatomic, retain) NSArray *tableData;
@property (nonatomic, strong) HTMLLearnerLessonObject *lessonData;
@property (nonatomic, strong) NSString *lessonTitle;

-(void)listItemsForLanguage:(NSString *)language;


@end
