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
@property (weak, nonatomic) IBOutlet UITextView *hintTextField;
@end

@implementation HTMLLearnerTextEntryViewController
@synthesize userEntryTextField = _userEntryTextField, lessonCode = _lessonCode, lessonID = _lessonID, hintTextField = _hintTextField;

-(void)showCode:(NSString *)code forLesson:(NSString *)lesson
{
    //NSLog(@"received code in text entry %@ for lesson %@.", code, lesson);
    _lessonID = lesson;
    _lessonCode = code;
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
        [segue.destinationViewController loadWithHTMLData:data forLesson:_lessonCode];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setTitle:_lessonID];
    [_hintTextField setText:_lessonCode];
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
