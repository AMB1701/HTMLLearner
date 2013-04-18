//
//  HTMLLearnerLessonChoiceViewController.h
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTMLLearnerLessonChoiceViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *tableData;
    NSArray *lessonContent;
}
@property (nonatomic, retain) NSArray *tableData;
@property (nonatomic, retain) NSArray *lessonContent;
@property (nonatomic, strong) NSString *lessonData;
@property (nonatomic, strong) NSString *lessonTitle;

-(void)listItemsForLanguage:(NSString *)language;


@end
