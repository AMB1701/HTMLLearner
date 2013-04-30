//
//  HTMLLearnerResultsViewController.m
//  HTMLLearner
//
//  Created by Andrew Burke on 3/26/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import "EndTagResultsViewController.h"
#import "EndTagEvaluationViewController.h"

@interface EndTagResultsViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *pageData;
@property (weak, nonatomic) IBOutlet UILabel *lessonLabel;
@property (strong, nonatomic) EndTagLessonObject *lessonData;
@end

@implementation EndTagResultsViewController
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

-(void)loadWithHTMLData:(NSString *) data forLesson:(EndTagLessonObject *)lesson
{
    //NSLog(@"received html string: %@", data);
    //NSLog(@"received solution: %@", lesson);
    _pageData = data;
    _lessonData = lesson;
}

-(void)viewWillAppear:(BOOL)animated
{
    [webView loadHTMLString:_pageData baseURL:nil];
    [lessonLabel setText:[EndTagLessonObject stripTags:[_lessonData getTitle]]];
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
