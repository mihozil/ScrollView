//
//  ScrollView.m
//  Objective C Example
//
//  Created by Apple on 1/2/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "ScrollView.h"

@interface ScrollView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollview;

@end

@implementation ScrollView{
    UIImageView *photo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"milkway.jpg"]];
    [self.scrollview addSubview:photo];
    self.scrollview.delegate = self;
    self.scrollview.maximumZoomScale = 4;
    self.scrollview.minimumZoomScale = 0.2;
    
    [self.view addSubview:self.scrollview];
    

}
- (UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return photo;
}
- (void) zoomFigure: (NSString*) st{
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:st
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:nil];
    self.navigationItem.rightBarButtonItem = button;
    
}
- (void) scrollViewDidZoom:(UIScrollView *)scrollView{
    NSString* st = [NSString stringWithFormat:@"%2.2f",self.scrollview.zoomScale];
    [self zoomFigure:st];
    
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
