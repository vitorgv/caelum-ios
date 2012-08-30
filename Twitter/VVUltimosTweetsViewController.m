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
    for (NSDictionary *tweetDict in tweets)
    {
        VVTweet *tweet = [[VVTweet alloc] init];
        tweet.text = [tweetDict objectForKey:@"text"];
        
        int indice = [tweets indexOfObject:tweetDict];
        if (indice % 2 == 0)
        {
            NSMutableArray *tweetsPares = [self.ultimosTweets objectForKey:@"Par"];
            
        } else {
            
        }
        
    }
    
    
}


@end
