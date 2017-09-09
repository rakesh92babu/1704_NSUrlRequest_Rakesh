//
//  ViewController.h
//  1704_NSUrlRequest_Rakesh
//
//  Created by student on 8/1/17.
//  Copyright © 2017 Rakesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *countries;
@property (weak, nonatomic) IBOutlet UISegmentedControl *paymentType;
@property (weak, nonatomic) IBOutlet UISegmentedControl *appsCount;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property NSURLSession * URLSession;
@property NSMutableURLRequest * URLReq;
@property NSURLSessionDataTask * dataTask;
@property NSArray * mude;

- (IBAction)goButton:(id)sender;
@property NSMutableDictionary * serverResponderDict;

@property NSString * countriesString;
@property NSString * paymentTypeString;
@property NSString * appsCountString;

@property NSMutableArray * appName;
@property NSMutableArray * appImg;
@property NSMutableArray * appGenreNames;

@end

