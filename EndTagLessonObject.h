//
//  HTMLLearnerLessonObject.h
//  HTMLLearner
//
//  Created by Andrew Burke on 4/25/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EndTagLessonObject : NSObject

-(void) setTitle:(NSString *)t;
-(void) setContent:(NSString *)newContent;
-(void) setSolution:(NSString *)newSolution;
+(NSString *) stripTags:(NSString *)tagged;
-(NSString *)getTitle;
-(NSString *)getContent;
-(NSString *)getSolution;

@end
