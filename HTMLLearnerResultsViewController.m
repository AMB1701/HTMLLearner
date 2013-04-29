//
//  HTMLLearnerResultsViewController.m
//  HTMLLearner
//
//  Created by Andrew Burke on 3/26/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import "HTMLLearnerResultsViewController.h"
#import "HTMLLearnerEvaluationViewController.h"

@interface HTMLLearnerResultsViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *pageData;
@property (weak, nonatomic) IBOutlet UILabel *lessonLabel;
@property (strong, nonatomic) HTMLLearnerLessonObject *lessonData;
@end

@implementation HTMLLearnerResultsViewController
@synthesize webView, pageData = _pageData, lessonData = _lessonData, lessonLabel;


- (IBAction)doEvaluation:(id)sender
{
    [self performSegueWithIdentifier:@"evaluateSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"evaluateSegue"])
    {
        [segue.destinationViewController checkString:_pageData forLesson:_lessonData];
    }
}

-(void)loadWithHTMLData:(NSString *) data forLesson:(HTMLLearnerLessonObject *)lesson
{
    //NSLog(@"received html string: %@", data);
    //NSLog(@"received solution: %@", lesson);
    _pageData = data;
    _lessonData = lesson;
}

-(void)viewWillAppear:(BOOL)animated
{
    [webView loadHTMLString:_pageData baseURL:nil];
    [lessonLabel setText:[HTMLLearnerLessonObject stripTags:[_lessonData getTitle]]];
    [super viewWillAppear:animated];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"webview error: %@", error);
}

@end
