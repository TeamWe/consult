//
//  ViewController.m
//  Consult
//
//  Created by 徐纪光 on 15/4/7.
//  Copyright (c) 2015年 徐纪光. All rights reserved.
//

#import "ViewController.h"
#import "ExpressViewController.h"
#import "WeatherViewController.h"
#import "BusViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.view.alpha = 0.5;
    
    self.navigationController.navigationItem.title = @"查询大全";
    
    UIButton * buttonexpress = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonexpress.frame = CGRectMake(80, 100, 160, 40);
    buttonexpress.backgroundColor = [UIColor whiteColor];
    buttonexpress.layer.cornerRadius = 8;
    buttonexpress.layer.borderColor = [UIColor blueColor].CGColor;
    buttonexpress.layer.borderWidth = 0.38;
    [buttonexpress setTitle:@"快递查询" forState:UIControlStateNormal];
    [self.view addSubview:buttonexpress];
    [buttonexpress addTarget:self action:@selector(expressmenu) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * buttonweather = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonweather.frame = CGRectMake(80, 200, 160, 40);
    buttonweather.backgroundColor = [UIColor whiteColor];
    buttonweather.layer.cornerRadius = 8;
    buttonweather.layer.borderColor = [UIColor blueColor].CGColor;
    buttonweather.layer.borderWidth = 0.38;
    [buttonweather setTitle:@"天气查询" forState:UIControlStateNormal];
    [self.view addSubview:buttonweather];
    [buttonweather addTarget:self action:@selector(weathermenu) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * buttonbus = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonbus.frame = CGRectMake(80, 300, 160, 40);
    buttonbus.backgroundColor = [UIColor whiteColor];
    buttonbus.layer.cornerRadius = 8;
    buttonbus.layer.borderColor = [UIColor blueColor].CGColor;
    buttonbus.layer.borderWidth = 0.38;
    [buttonbus setTitle:@"公交查询" forState:UIControlStateNormal];
    [self.view addSubview:buttonbus];
    [buttonbus addTarget:self action:@selector(weathermenu) forControlEvents:UIControlEventTouchUpInside];
}

-(void)expressmenu{
    ExpressViewController * expressmenu = [[ExpressViewController alloc]init];
    [self.navigationController pushViewController:expressmenu animated:YES];
}

-(void)weathermenu{
    WeatherViewController * weathermenu = [[WeatherViewController alloc]init];
    [self.navigationController pushViewController:weathermenu animated:YES];
}

-(void)busmenu{
    BusViewController * busmenu = [[BusViewController alloc]init];
    [self.navigationController pushViewController:busmenu animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
