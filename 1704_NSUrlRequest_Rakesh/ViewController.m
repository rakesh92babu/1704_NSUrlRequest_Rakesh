//
//  ViewController.m
//  1704_NSUrlRequest_Rakesh
//
//  Created by student on 8/1/17.
//  Copyright © 2017 Rakesh. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createElements];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.countries.layer.cornerRadius = 8;
    self.countries.clipsToBounds = YES;
    
    self.appsCount.layer.cornerRadius = 8;
    self.appsCount.clipsToBounds = YES;
    
    self.paymentType.layer.cornerRadius = 8;
    self.paymentType.clipsToBounds = YES;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:20], NSFontAttributeName,[UIColor cyanColor], NSForegroundColorAttributeName,nil];
    
    [self.countries setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.appsCount setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.paymentType setTitleTextAttributes:attributes forState:UIControlStateNormal];
}

-(void)createElements
{
    if(self.countries.selectedSegmentIndex == 0){
        self.countriesString = @"in";
    }else if(self.countries.selectedSegmentIndex == 1){
        self.countriesString = @"us";
    }else if(self.countries.selectedSegmentIndex == 2){
        self.countriesString = @"gb";
    }
    
    if(self.paymentType.selectedSegmentIndex == 0){
        self.paymentTypeString = @"top-free";
    }else if(self.paymentType.selectedSegmentIndex == 1){
        self.paymentTypeString = @"top-paid";
    }else if(self.paymentType.selectedSegmentIndex == 2){
        self.paymentTypeString = @"top-grossing";
    }
    
    if(self.appsCount.selectedSegmentIndex == 0){
        self.appsCountString = @"10";
    }else if(self.appsCount.selectedSegmentIndex == 1){
        self.appsCountString = @"25";
    }else if(self.appsCount.selectedSegmentIndex == 2){
        self.appsCountString = @"50";
    }
    
    
    self.URLReq = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://rss.itunes.apple.com/api/v1/%@/ios-apps/%@/%@/explicit/json",self.countriesString,self.paymentTypeString,self.appsCountString]]];
    
    self.URLSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    self.dataTask = [self.URLSession dataTaskWithRequest:self.URLReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(),^{
        
        self.serverResponderDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray * appsArr = [[self.serverResponderDict objectForKey:@"feed"]objectForKey:@"results"];
         //AppDelegate* appDelegate = (AppDelegate*)[ [UIApplication sharedApplication] delegate];
        self.appName = [[NSMutableArray alloc]init];
        self.appImg = [[NSMutableArray alloc]init];
        self.appGenreNames = [[NSMutableArray alloc]init];
        for (unsigned char i=0; i<appsArr.count; i++) {
            //NSLog(@"%@",[[appsArr objectAtIndex:i]objectForKey:@"name"]);
            
            [self.appName addObject:[[appsArr objectAtIndex:i]objectForKey:@"name"]];
            [self.appImg addObject:[[appsArr objectAtIndex:i]objectForKey:@"artworkUrl100"]];
            [self.appGenreNames addObject:[[appsArr objectAtIndex:i]objectForKey:@"primaryGenreName"]];
            
            
           // NSLog(@"%@",[self.appgenreNames objectAtIndex:i]);
        }
        
        TableViewController * tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"tableView"];
        tvc.appNameArr = self.appName;
        tvc.appIconArr = self.appImg;
        tvc.appGenreNamesArr = self.appGenreNames;
        
       // NSLog(@"%@",tvc.appGenreNamesArr);
        [[self navigationController] pushViewController:tvc animated:YES];
        });
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goButton:(id)sender
{
    [self createElements];
    [self.dataTask resume];
    
    
}
@end
