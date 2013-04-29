//
//  HTMLLearnerTextEntryViewController.m
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import "HTMLLearnerTextEntryViewController.h"

@interface HTMLLearnerTextEntryViewController ()
@property (strong, nonatomic) NSString* lessonCode;
@property (strong, nonatomic) NSString* lessonID;
@property (weak, nonatomic) IBOutlet UIWebView *hintView;
@end

@implementation HTMLLearnerTextEntryViewController
@synthesize userEntryTextField = _userEntryTextField, lessonCode = _lessonCode, lessonID = _lessonID, hintView = _hintView, lessonData = _lessonData;

-(void)shareLesson:(HTMLLearnerLessonObject *)l
{
    //NSLog(@"received code in text entry %@ for lesson %@.", code, lesson);
    _lessonData = l;
    _lessonID = [_lessonData getTitle];
    _lessonCode = [_lessonData getContent];
}

- (IBAction)testCode:(id)sender
{
    [self performSegueWithIdentifier:@"testMyCodeSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"testMyCodeSegue"])
    {
        NSString *data = [_userEntryTextField text];
        //load HTML from textview into webview
        [segue.destinationViewController loadWithHTMLData:data forLesson:_lessonData];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setTitle:_lessonID];
    [_hintView loadHTMLString:_lessonCode baseURL:nil];
    [super viewWillAppear:animated];
}

- (IBAction)addLeftBracket:(id)sender
{
    [_userEntryTextField setText:[NSString stringWithFormat:@"%@%@", [_userEntryTextField text], @"<"]];
}

- (IBAction)addRightBracket:(id)sender
{
    [_userEntryTextField setText:[NSString stringWithFormat:@"%@%@", [_userEntryTextField text], @">"]];
}

- (IBAction)addNBSP:(id)sender
{
    [_userEntryTextField setText:[NSString stringWithFormat:@"%@%@", [_userEntryTextField text], @"&nbsp"]];
}


@end
