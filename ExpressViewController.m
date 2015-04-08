//
//  ExpressViewController.m
//  Consult
//
//  Created by 徐纪光 on 15/4/7.
//  Copyright (c) 2015年 徐纪光. All rights reserved.
//

#import "ExpressViewController.h"
#import "Request.h"

@interface ExpressViewController ()

@end

@implementation ExpressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.alpha = 0.5;
    
    Request *request = [[Request alloc]init];
    [request setDelegate:self];
    NSString *str = [NSString stringWithFormat:@"http://api.36wu.com/Express/GetExpressInfo?postid=762676547236"];
    [request requestWithGetWithUrl:str];
}

-(void)requestFinished:(NSMutableData *)severData{
    NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:severData options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *array = [dict objectForKey:@"data"];
    for (NSDictionary *diction in array) {
        NSString *str = [diction objectForKey:@"remark"];
        NSLog(@"%@",str);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
