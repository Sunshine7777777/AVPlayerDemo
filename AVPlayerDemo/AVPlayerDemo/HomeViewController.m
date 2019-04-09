//
//  HomeViewController.m
//  AVPlayerDemo
//
//  Created by Sun on 2019/4/10.
//

#import "HomeViewController.h"
#import "ViewController.h"
#import "MucisPlayController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *muiscBt = [UIButton buttonWithType:0];
    [muiscBt setTitle:@"MUISC" forState:0];
    [muiscBt setTitleColor:[UIColor blackColor] forState:0];
    muiscBt.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:muiscBt];
    
    
    UIButton *videoBt = [UIButton buttonWithType:0];
    [videoBt setTitle:@"VIDEO" forState:0];
    [videoBt setTitleColor:[UIColor blackColor] forState:0];
    videoBt.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:videoBt];
    
    muiscBt.frame = CGRectMake(50, 100, 100, 20);
    videoBt.frame = CGRectMake(50, 300, 100, 20);
    [videoBt addTarget:self action:@selector(video) forControlEvents:7];
    [muiscBt addTarget:self action:@selector(mucis) forControlEvents:7];
    // Do any additional setup after loading the view.
}
-(void)video{
    ViewController *vc = [ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)mucis{
    MucisPlayController *vc = [MucisPlayController new];
    [self.navigationController pushViewController:vc animated:YES];
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
