//
//  HTMLLearnerLessonChoiceViewController.m
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import "HTMLLearnerLessonChoiceViewController.h"
#import "HTMLLearnerLessonPreviewViewController.h"

@interface HTMLLearnerLessonChoiceViewController ()
@property (strong, nonatomic) NSString *lang;
@end

@implementation HTMLLearnerLessonChoiceViewController
@synthesize tableData = _tableData, lessonData = _lessonData, lessonTitle = _lessonTitle, lessonContent = _lessonContent, lang = _lang;

-(void)listItemsForLanguage:(NSString *)language
{
    //NSLog(@"Lang: %@", language);
    _lang = language;
}

-(void)viewWillAppear:(BOOL)animated
{
    if(_lang == nil)
        _lang = @"HTML";
    [self navigationController].title = [@"Lesson Choices:" stringByAppendingString:_lang];
    
    _tableData = [[NSArray alloc] initWithObjects:@"Test Lesson 1", @"Test Lesson 2", nil];
    _lessonContent = [[NSArray alloc] initWithObjects:@"<b>Hello, world!</b>",@"<b><i>OMG!</b></i>", nil];
    /*
    NSString *content;
    NSString *path;
    
    if([_lang isEqualToString:@"HTML"])
    {
        //set the HTML file name here
        path = [[NSBundle mainBundle] pathForResource:@"lessonConcept" ofType:@"xml"];
    }
    
    if(path)
    {
        content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        //NSLog(@"path is %@", path);
        if(content)
            NSLog(@"content is %@", content);
    }*/
}

- (IBAction)beginLesson:(id)sender
{
    [self performSegueWithIdentifier:@"toSolutionPreviewSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toSolutionPreviewSegue"])
    {
        _lessonData = [NSString stringWithFormat:@"<html><body>%@</body></html>", _lessonData];
        //NSLog(@"fired lesson %@ with data %@", _lessonTitle, _lessonData);
        [segue.destinationViewController showCode:_lessonData forLesson:_lessonTitle];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"lessonCell"];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"lessonCell"];
    
    cell.textLabel.text = [_tableData objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [_lessonContent objectAtIndex:indexPath.row];
    
    //NSLog(@"filled cell with %@", cell.textLabel.text);
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _lessonTitle = [_tableData objectAtIndex:indexPath.row];
    _lessonData = [_lessonContent objectAtIndex:indexPath.row];
}

@end
