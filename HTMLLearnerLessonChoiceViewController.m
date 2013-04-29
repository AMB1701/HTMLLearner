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
@property (strong, nonatomic) NSMutableArray * lessonList;
@end

@implementation HTMLLearnerLessonChoiceViewController
@synthesize tableData = _tableData, lessonTitle = _lessonTitle, lang = _lang, lessonList = _lessonList, lessonData = _lessonData;

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
    
    NSString *content;
    NSString *path;
    
    _lessonList = [[NSMutableArray alloc] init];
    
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
        {
            while ([content length] > 0)
            {
                NSString *s = [self nextTokenFromString:content];
                content = [content substringFromIndex:[s length]+2];
                if([s isEqualToString:@"<Lesson>"])
                {
                    NSString *t = [self nextTokenFromString:content];
                    content = [content substringFromIndex:[t length]+2];
                    NSString *c = [self nextTokenFromString:content];
                    content = [content substringFromIndex:[c length]+2];
                    NSString *sol = [self nextTokenFromString:content];
                    content = [content substringFromIndex:[sol length]+2];
                    //NSLog(@"found title: %@\n  content:%@\n  solution:%@", t, c, sol);
                    HTMLLearnerLessonObject *lesson = [[HTMLLearnerLessonObject alloc] init];
                    [lesson setTitle:t];
                    [lesson setContent:c];
                    [lesson setSolution:sol];
                    [_lessonList addObject:lesson];
                    //NSLog(@"lessonList size is now: %d", [_lessonList count]);
                }
            }
            
        }
    }
    
    _tableData = [[NSArray alloc] initWithArray:[_lessonList copy]];
                  //initWithObjects:@"Test Lesson 1", @"Test Lesson 2", nil];
}

-(NSString *)nextTokenFromString:(NSString *)c
{
    NSRange r = [c rangeOfString:@"\n"];
    NSString *t = [c substringToIndex:r.location];
    t = [t stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //NSLog(@"returning %@", t);
    return t;
}


- (IBAction)beginLesson:(id)sender
{
    [self performSegueWithIdentifier:@"toSolutionPreviewSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toSolutionPreviewSegue"])
    {
        //NSLog(@"fired lesson %@ with data %@", _lessonTitle, _lessonData);
        [segue.destinationViewController shareLesson:_lessonData];
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
    
    cell.textLabel.text = [HTMLLearnerLessonObject stripTags:[[_tableData objectAtIndex:indexPath.row] getTitle]];
    //NSLog(@"filled cell with %@", cell.textLabel.text);
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _lessonData = [_tableData objectAtIndex:indexPath.row];
}

@end
