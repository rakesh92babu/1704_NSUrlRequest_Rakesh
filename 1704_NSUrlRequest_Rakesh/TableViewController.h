//
//  TableViewController.h
//  1704_NSUrlRequest_Rakesh
//
//  Created by student on 8/2/17.
//  Copyright © 2017 Rakesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TableViewController : UITableViewController

@property AppDelegate * appDelegate;
@property NSMutableArray * appNameArr;
@property NSMutableArray * appIconArr;
@property NSMutableArray * appGenreNamesArr;
@end
