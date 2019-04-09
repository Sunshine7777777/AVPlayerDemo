//
//  MucisPlayController.m
//  AVPlayerDemo
//
//  Created by Sun on 2019/4/10.
//

#import "MucisPlayController.h"
#import <AVFoundation/AVFoundation.h>

@interface MucisPlayController (){
}
@property (nonatomic,strong) AVPlayer *myPlayer;
@property (nonatomic,strong) AVPlayerItem *myPlayerItem;
#define mucisUrl @"http://music.163.com/song/media/outer/url?id=25906124.mp3"
@end

@implementation MucisPlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myPlayerItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:mucisUrl]];
    self.myPlayer = [[AVPlayer alloc]initWithPlayerItem:self.myPlayerItem];
    [self.myPlayerItem addObserver:self forKeyPath:@"status" options:0 context:nil];
    UIButton *muiscBt = [UIButton buttonWithType:0];
    [muiscBt setTitle:@"PLAY" forState:0];
    [muiscBt setTitleColor:[UIColor blackColor] forState:0];
    muiscBt.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:muiscBt];
    muiscBt.frame = CGRectMake(0, 0, 100, 30);
    muiscBt.center = self.view.center;
    [muiscBt addTarget:self action:@selector(play:) forControlEvents:7];
    // Do any additional setup after loading the view.
}
-(void)play:(UIButton *)bt{
    if ([bt.titleLabel.text isEqualToString:@"PLAY"]) {
        [self.myPlayer play];
        [bt setTitle:@"PAUSE" forState:0];

    }else{
        [self.myPlayer  pause];
        [bt setTitle:@"PLAY" forState:0];

    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:
(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"]) {
        //取出status的新值
        AVPlayerItemStatus status = [change[NSKeyValueChangeNewKey]intValue];
        switch (status) {
            case AVPlayerItemStatusFailed:
                NSLog(@"item 有误");
                //  self.isReadToPlay = NO;
                break;
            case AVPlayerItemStatusReadyToPlay:
                NSLog(@"准好播放了");
                //    self.isReadToPlay = YES;
                //  self.avSlider.maximumValue = self.item.duration.value / self.item.duration.timescale;
                break;
            case AVPlayerItemStatusUnknown:
                NSLog(@"视频资源出现未知错误");
                //   self.isReadToPlay = NO;
                break;
            default:
                break;
        }
    }
    //移除监听（观察者）
    //   [object removeObserver:self forKeyPath:@"status"];
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
