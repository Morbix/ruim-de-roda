//
//  CategoryViewController.h
//  Ruim de Roda
//
//  Created by Matheus Frozzi Alberton on 11/04/15.
//  Copyright (c) 2015 Ruim de Roda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property NSString *categoryID;
@property NSString *categoryText;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
