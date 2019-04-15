//
//  ViewController.m
//  AVPlayerDemo
//
//  Created by Sun on 2019/4/9.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController (){
    
}

@property (nonatomic,strong) AVPlayer *myPlayer;
@property (nonatomic,strong) AVPlayerItem *myPlayerItem;
@property (nonatomic,strong) AVPlayerLayer *myPlayerLayer;
@property (nonatomic,strong) AVAsset *myAsset;


//#define VedionUrl  @"http://vip.okokbo.com/20180117/BNp2mT7Q/index.m3u8"
#define VedionUrl @"http://wvideo.spriteapp.cn/video/2016/0709/5781023a979d7_wpd.mp4"
//#define VedionUrl  @"http://120.77.151.162:8080/media/IpadFile/video/红酒文化.mp4"
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myAsset = [AVAsset assetWithURL:[NSURL URLWithString:VedionUrl]];
    self.myPlayerItem = [AVPlayerItem playerItemWithAsset:self.myAsset];
    [self.myPlayerItem addObserver:self forKeyPath:@"status" options:0 context:nil];
    
    self.myPlayer = [AVPlayer playerWithPlayerItem:self.myPlayerItem];
    self.myPlayerLayer  = [AVPlayerLayer playerLayerWithPlayer:self.myPlayer];
    self.myPlayerLayer.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200);
  //  self.myPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.view.layer addSublayer:self.myPlayerLayer];
    [self performSelector:@selector(play) withObject:nil afterDelay:3];
    
  
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)play{
    [self.myPlayer play];
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
    [object removeObserver:self forKeyPath:@"status"];
}

@end
