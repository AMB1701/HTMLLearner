//
//  HTMLLearnerLessonPreviewViewController.m
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import "EndTagLessonPreviewViewController.h"
#import "EndTagTextEntryViewController.h"

@interface EndTagLessonPreviewViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *lessonLabel;
@property (nonatomic, strong) EndTagLessonObject *lessonData;
@property (nonatomic, strong) NSString *lessonCode;

@end

@implementation EndTagLessonPreviewViewController
@synthesize webView, lessonCode = _lessonCode, lessonData = _lessonData, lessonLabel = _lessonLabel;

-(void) shareLesson:(EndTagLessonObject *)lesson
{
    //NSLog(@"received code in preview %@ for lesson %@.", code, lesson);
    _lessonData = lesson;
    _lessonCode = [lesson getSolution];;
}

-(void)viewWillAppear:(BOOL)animated
{
    [_lessonLabel setText:[EndTagLessonObject stripTags:[_lessonData getTitle]]];
    [webView loadHTMLString:_lessonCode baseURL:nil];
}

- (IBAction)moveToEntry:(id)sender
{
    [self performSegueWithIdentifier:@"toTextEntrySegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toTextEntrySegue"])
        [segue.destinationViewController shareLesson:_lessonData];
}

@end
