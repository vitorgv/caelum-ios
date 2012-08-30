//
//  VVUltimosTweetsViewController.m
//  Twitter
//
//  Created by ios2971 on 30/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VVUltimosTweetsViewController.h"
#import "VVTweet.h"

@interface VVUltimosTweetsViewController ()
@end

@implementation VVUltimosTweetsViewController

@synthesize ultimosTweets;

- (void) viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/user_timeline.json?screen_name=vitorvellozo&count=10"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSMutableArray *tweets = [NSJSONSerialization JSONObjectWithData:data 
                                    options:NSJSONReadingMutableContainers 
                                      error:nil];

//    NSLog(@"%@", [tweets objectAtIndex:0]);
    
    self.ultimosTweets = [[NSMutableDictionary alloc] init];
    for (NSDictionary *tweetDict in tweets) {
        VVTweet *tweet = [[VVTweet alloc] init];
        tweet.text = [tweetDict objectForKey:@"text"];
        
        int indice = [tweets indexOfObject:tweetDict];
        if (indice % 2 == 0) {
            [self addObject:tweet forKey:@"Par"];
        } else {
            [self addObject:tweet forKey:@"Impar"];
        }
        
    }
    
    
}

- (void) addObject: (VVTweet *) tweet forKey: (NSString *) chave {
    NSMutableArray *tweets = [self.ultimosTweets objectForKey:chave];
    if(!tweets){
        tweets = [[NSMutableArray alloc] init];
        [self.ultimosTweets setObject:tweets forKey:chave];
    }
    [tweets addObject:tweet];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.ultimosTweets allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *parOuImpar = [[self.ultimosTweets allKeys] objectAtIndex:section];
    NSMutableArray *tweets = [self.ultimosTweets objectForKey:parOuImpar];
    return [tweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *parOuImpar = [[self.ultimosTweets allKeys] objectAtIndex:indexPath.section];
    NSMutableArray *tweets = [self.ultimosTweets objectForKey:parOuImpar];
    VVTweet *tweet = [tweets objectAtIndex:indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.textLabel.text = tweet.text;
    }
    
    return cell;
}

@end
