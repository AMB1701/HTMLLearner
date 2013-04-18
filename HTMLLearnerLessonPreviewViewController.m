//
//  HTMLLearnerLessonPreviewViewController.m
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import "HTMLLearnerLessonPreviewViewController.h"
#import "HTMLLearnerTextEntryViewController.h"

@interface HTMLLearnerLessonPreviewViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation HTMLLearnerLessonPreviewViewController
@synthesize webView, lessonCode = _lessonCode, lessonData = _lessonData;

-(void) showCode:(NSString *)code forLesson:(NSString *)lesson
{
    //NSLog(@"received code in preview %@ for lesson %@.", code, lesson);
    _lessonData = lesson;
    _lessonCode = code;
}

-(void)viewWillAppear:(BOOL)animated
{
    [webView loadHTMLString:_lessonCode baseURL:nil];
}

- (IBAction)moveToEntry:(id)sender
{
    [self performSegueWithIdentifier:@"toTextEntrySegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toTextEntrySegue"])
        [segue.destinationViewController showCode:_lessonCode forLesson:_lessonData];
}

@end
