//
//  HTMLLearnerLessonObject.m
//  HTMLLearner
//
//  Created by Andrew Burke on 4/25/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import "HTMLLearnerLessonObject.h"

@interface HTMLLearnerLessonObject()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *solution;
@end

@implementation HTMLLearnerLessonObject
@synthesize title = _title, content = _content, solution = _solution;

+(NSString *) stripTags:(NSString *)tagged
{
    NSRange r = [tagged rangeOfString:@"<"];
    while(!(r.location == NSNotFound))
    {
        NSRange rEnd = [tagged rangeOfString:@">"];
        tagged = [[tagged substringToIndex:r.location] stringByAppendingString:[tagged substringFromIndex:rEnd.location+1]];
        
        r = [tagged rangeOfString:@"<"];
    }
    //NSLog(@"Tagged is now: %@", tagged);
    return tagged;
}

-(NSString *)getTitle
{
    return _title;
}

-(void) setTitle:(NSString *)t
{
    _title = t;
}

-(NSString *)getContent
{
    return _content;
}

-(void) setContent:(NSString *)newContent
{
    _content = newContent;
}

-(NSString *)getSolution
{
    return _solution;
}

-(void) setSolution:(NSString *)newSolution
{
    _solution = newSolution;
}

@end
