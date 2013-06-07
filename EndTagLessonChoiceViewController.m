//
//  HTMLLearnerLessonChoiceViewController.m
//  HTMLLearner
//
//  Created by Andrew Burke on 3/28/13.
//  Copyright (c) 2013 CS639. All rights reserved.
//

#import "EndTagLessonChoiceViewController.h"
#import "EndTagLessonPreviewViewController.h"
#import "EndTagLessonObject.h"


@interface EndTagLessonChoiceViewController ()
@property (strong, nonatomic) NSString *lang;
@property (strong, nonatomic) NSMutableArray * lessonList;
@property (nonatomic, retain) NSArray *tableData;
@property (nonatomic, strong) EndTagLessonObject *lessonData;
@end

@implementation EndTagLessonChoiceViewController
@synthesize tableData = _tableData, lang = _lang, lessonList = _lessonList, lessonData = _lessonData;

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
        path = [[NSBundle mainBundle] pathForResource:@"HTMLLessons" ofType:@"xml"];
    }
    
    if(path)
    {
        content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        //NSLog(@"path is %@", path);
        if(content)
        {
            NSString *t = nil, *c = nil, *sol = nil;

            while ([content length] > 0)
            {
                NSRange r = [content rangeOfString:@"\n"];
                NSString *temp = [content substringToIndex:r.location];
                temp = [temp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                
                content = [content substringFromIndex:[temp length]+1];
                if([temp length] >= 6)
                {
                    NSString *h = [temp substringToIndex:6];
                    //NSLog(@"h: %@", h);
                    if([h isEqualToString:@"<title"])
                        t = temp;
                    else if([h isEqualToString:@"<conte"])
                        c = temp;
                    else if([h isEqualToString:@"<solut"])
                        sol = temp;
                    
                    if(c != nil && t != nil && sol != nil)
                    {
                        EndTagLessonObject *lesson = [[EndTagLessonObject alloc] init];
                        [lesson setTitle:t];
                        [lesson setContent:c];
                        [lesson setSolution:sol];
                        [_lessonList addObject:lesson];
                        
                        //NSLog(@"found title: %@\n  content:%@\n  solution:%@", t, c, sol);
                        //NSLog(@"lessonList size is now: %d", [_lessonList count]);
                        t = nil; c = nil; sol = nil;
                    }
                }
            }
        }
    }
    
    _tableData = [[NSArray alloc] initWithArray:[_lessonList copy]];
}

- (IBAction)beginLesson:(id)sender
{
    [self performSegueWithIdentifier:@"toSolutionPreviewSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toSolutionPreviewSegue"])
    {
        //NSLog(@"fired lesson %@ with data %@", _lessonData);
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
    
    cell.textLabel.text = [EndTagLessonObject stripTags:[[_tableData objectAtIndex:indexPath.row] getTitle]];
    //NSLog(@"filled cell with %@", cell.textLabel.text);
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _lessonData = [_tableData objectAtIndex:indexPath.row];
}

@end
