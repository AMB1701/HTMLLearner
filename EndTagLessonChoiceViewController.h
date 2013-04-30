//
//  HTMLLearnerLessonChoiceViewController.h
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EndTagLessonChoiceViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *tableData;
}

-(void)listItemsForLanguage:(NSString *)language;


@end
