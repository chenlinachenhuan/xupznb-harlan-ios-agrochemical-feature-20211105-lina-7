//
//  Agro_groupViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/15.
//

#import "Agro_groupViewController.h"
#import "trendViewController.h"
#import "favoriteViewController.h"
#import "XXPageTabView.h"
#import "publishVIew.h"
#import "publishTextViewController.h"
#import "Agro_loginViewController.h"
#import "publishPicAndVedioViewController.h"
#import "TZImagePickerController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "UIView+TZLayout.h"

@interface Agro_groupViewController ()<XXPageTabViewDelegate,UIScrollViewDelegate,publishVIewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,TZImagePickerControllerDelegate>
{
    XXPageTabView *_pageTabView;
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
}

@property (nonatomic, assign) CGFloat      startOffsetX;
@property (nonatomic ,strong) UIScrollView *contentScrollView;
@property(nonatomic,strong)NSMutableArray * titleArr;
@property(nonatomic,retain)UIView *naviView;
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property (strong, nonatomic) CLLocation *location;
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;

@end

@implementation Agro_groupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =  [UIColor colorWithRed:248/255.0 green:250/255.0 blue:251/255.0 alpha:1.0];
    [self createNaviView];
    [self createScrollView];
    [self createSelectView];
    [self createCellView];
}
-(void)createNaviView{
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(31, 0, ScreenWidth,navBarHeight)];
    title.text = @"  分享我的动态";
    title.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    title.numberOfLines = 0;
   
    UIButton * publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    publishButton.frame = CGRectMake(ScreenWidth-15-22, title.center.y-11, 22, 22);
    [publishButton addTarget:self action:@selector(publishButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [publishButton setImage:[UIImage imageNamed:@"上传"] forState:UIControlStateNormal];
     self.navigationItem.titleView=title ;
    UIBarButtonItem * rightB = [[UIBarButtonItem alloc] initWithCustomView:publishButton];
    self.navigationItem.rightBarButtonItem = rightB;
}
-(void)publishButtonMethod{
    if (Agro_appDelegate.isLogin==YES) {
        publishVIew * publishV = [[publishVIew alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight1)];
        publishV.myDelegate= self;
        NSArray * titleArr =[NSArray arrayWithObjects:@"视频\n照片或视频",@"从相册选择",@"发表文字",@"取消", nil];
        [publishV createPublishView:titleArr];
        [self.tabBarController.view addSubview:publishV];
    }else{
        Agro_loginViewController * loginVC = [[Agro_loginViewController alloc] init];
        loginVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:loginVC animated:YES completion:nil];
    }
    
}
-(void)publishTypeButtonMethod:(NSInteger)tag{
    if (tag==0) {
        [self takePhoto];
//        publishPicAndVedioViewController * vc = [[publishPicAndVedioViewController alloc] init];
//        vc.modalPresentationStyle = UIModalPresentationFullScreen;
//        [self presentViewController:vc animated:YES completion:nil];
    }else if (tag==1){
        [self pushTZImagePickerController];
    }else if (tag==2){
        publishTextViewController * textV = [[publishTextViewController alloc] init];
        textV.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:textV animated:YES completion:nil];
    }else if (tag==3){
        
    }
}
- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        _imagePickerVc.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
        _imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (@available(iOS 9, *)) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
 
    }
    return _imagePickerVc;
}
- (void)takePhoto {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        // 无相机权限 做一个友好的提示
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self takePhoto];
                });
            }
        }];
        // 拍照之前还需要检查相册权限
    } else if ([PHPhotoLibrary authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if ([PHPhotoLibrary authorizationStatus] == 0) { // 未请求过相册权限
        [[TZImageManager manager] requestAuthorizationWithCompletion:^{
            [self takePhoto];
        }];
    } else {
        [self pushImagePickerController];
    }
}

// 调用相机
- (void)pushImagePickerController {
    // 提前定位
    __weak typeof(self) weakSelf = self;
    [[TZLocationManager manager] startLocationWithSuccessBlock:^(NSArray<CLLocation *> *locations) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.location = [locations firstObject];
    } failureBlock:^(NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.location = nil;
    }];
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerVc.sourceType = sourceType;
        NSMutableArray *mediaTypes = [NSMutableArray array];
        if (YES) {
            [mediaTypes addObject:(NSString *)kUTTypeMovie];
        }
        if (YES) {
            [mediaTypes addObject:(NSString *)kUTTypeImage];
        }
        if (mediaTypes.count) {
            _imagePickerVc.mediaTypes = mediaTypes;
        }
        [self presentViewController:_imagePickerVc animated:YES completion:nil];
    } else {
        NSLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
}
- (void)pushTZImagePickerController {
//    if (self.maxCountTF.text.integerValue <= 0) {
//        return;
//    }
    // 设置languageBundle以使用其它语言，必须在TZImagePickerController初始化前设置 / Set languageBundle to use other language
    // [TZImagePickerConfig sharedInstance].languageBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"tz-ru" ofType:@"lproj"]];

    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
//    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    
//    if (self.maxCountTF.text.integerValue > 1) {
        // 1.设置目前已经选中的图片数组
//        imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
//    }
    imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
    imagePickerVc.allowTakeVideo = YES;   // 在内部显示拍视频按
    imagePickerVc.videoMaximumDuration = 10; // 视频最大拍摄时间
    imagePickerVc.allowEditVideo = YES; // 允许编辑视频
    // imagePickerVc.saveEditedVideoToCollection = YES; // 编辑后的视频是否自动保存到相册
    // imagePickerVc.maxCropVideoDuration = 30; // 裁剪视频的最大时长
    // imagePickerVc.presetName = AVAssetExportPresetMediumQuality // 编辑后的视频的导出质量
    [imagePickerVc setUiImagePickerControllerSettingBlock:^(UIImagePickerController *imagePickerController) {
        imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    }];
    // imagePickerVc.autoSelectCurrentWhenDone = NO;
    
    // imagePickerVc.photoWidth = 1600;
    // imagePickerVc.photoPreviewMaxWidth = 1600;
    
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观
    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    // imagePickerVc.barItemTextColor = [UIColor blackColor];
    // imagePickerVc.navigationBar.translucent = NO;
    // [imagePickerVc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    // imagePickerVc.navigationBar.tintColor = [UIColor blackColor];
    // if (@available(iOS 13.0, *)) {
    //     UINavigationBarAppearance *barAppearance = [[UINavigationBarAppearance alloc] init];
    //     barAppearance.backgroundColor = imagePickerVc.navigationBar.barTintColor;
    //     barAppearance.titleTextAttributes = imagePickerVc.navigationBar.titleTextAttributes;
    //     imagePickerVc.navigationBar.standardAppearance = barAppearance;
    //     imagePickerVc.navigationBar.scrollEdgeAppearance = barAppearance;
    // }
    
    imagePickerVc.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    imagePickerVc.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    /*
    [imagePickerVc setPhotoPickerPageUIConfigBlock:^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
        [doneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }];
     */
    /*
    [imagePickerVc setAssetCellDidSetModelBlock:^(TZAssetCell *cell, UIImageView *imageView, UIImageView *selectImageView, UILabel *indexLabel, UIView *bottomView, UILabel *timeLength, UIImageView *videoImgView) {
        cell.contentView.clipsToBounds = YES;
        cell.contentView.layer.cornerRadius = cell.contentView.tz_width * 0.5;
    }];
     */
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = YES;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
//    imagePickerVc.allowPickingGif = self.allowPickingGifSwitch.isOn;
//    imagePickerVc.allowPickingMultipleVideo = self.allowPickingMuitlpleVideoSwitch.isOn; // 是否可以多选视频
    
    // 4. 照片排列按修改时间升序
//    imagePickerVc.sortAscendingByModificationDate = self.sortAscendingSwitch.isOn;
    
    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = YES;
//    imagePickerVc.needCircleCrop = YES;
    // 设置竖屏下的裁剪尺寸
    NSInteger left = 30;
    NSInteger widthHeight = self.view.tz_width - 2 * left;
    NSInteger top = (self.view.tz_height - widthHeight) / 2;
    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    imagePickerVc.scaleAspectFillCrop = YES;
    // 设置横屏下的裁剪尺寸
    // imagePickerVc.cropRectLandscape = CGRectMake((self.view.tz_height - widthHeight) / 2, left, widthHeight, widthHeight);
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/
    
    // imagePickerVc.allowPreview = NO;
    // 自定义导航栏上的返回按钮
    /*
    [imagePickerVc setNavLeftBarButtonSettingBlock:^(UIButton *leftButton){
        [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 20)];
    }];
    imagePickerVc.delegate = self;
    */
    
    // Deprecated, Use statusBarStyle
    // imagePickerVc.isStatusBarDefault = NO;
    imagePickerVc.statusBarStyle = UIStatusBarStyleLightContent;
    
    // 设置是否显示图片序号
    imagePickerVc.showSelectedIndex = YES;
    
    // 设置拍照时是否需要定位，仅对选择器内部拍照有效，外部拍照的，请拷贝demo时手动把pushImagePickerController里定位方法的调用删掉
    // imagePickerVc.allowCameraLocation = NO;
    
    // 自定义gif播放方案
//    [[TZImagePickerConfig sharedInstance] setGifImagePlayBlock:^(TZPhotoPreviewView *view, UIImageView *imageView, NSData *gifData, NSDictionary *info) {
//        FLAnimatedImage *animatedImage = [FLAnimatedImage animatedImageWithGIFData:gifData];
//        FLAnimatedImageView *animatedImageView;
//        for (UIView *subview in imageView.subviews) {
//            if ([subview isKindOfClass:[FLAnimatedImageView class]]) {
//                animatedImageView = (FLAnimatedImageView *)subview;
//                animatedImageView.frame = imageView.bounds;
//                animatedImageView.animatedImage = nil;
//            }
//        }
//        if (!animatedImageView) {
//            animatedImageView = [[FLAnimatedImageView alloc] initWithFrame:imageView.bounds];
//            animatedImageView.runLoopMode = NSDefaultRunLoopMode;
//            [imageView addSubview:animatedImageView];
//        }
//        animatedImageView.animatedImage = animatedImage;
//    }];
    
    // 设置首选语言 / Set preferred language
    // imagePickerVc.preferredLanguage = @"zh-Hans";
    
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {

    }];
    
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(PHAsset *)asset {
    
}
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];

    publishPicAndVedioViewController * vc = [[publishPicAndVedioViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];

    [vc typeForVideoOrPhoto:type didFinishPickingMediaWithInfo:info];
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos{
    [picker dismissViewControllerAnimated:YES completion:nil];
    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    publishPicAndVedioViewController * vc = [[publishPicAndVedioViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.selectedAssets = _selectedAssets;
    vc.selectedPhotos = _selectedPhotos;
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (void)refreshCollectionViewWithAddedAsset:(PHAsset *)asset image:(UIImage *)image {
    [_selectedAssets addObject:asset];
    [_selectedPhotos addObject:image];
//    [_collectionView reloadData];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - TZImagePickerControllerDelegate

/// User click cancel button
/// 用户点击了取消
- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    // NSLog(@"cancel");
}

// The picker should dismiss itself; when it dismissed these handle will be called.
// You can also set autoDismiss to NO, then the picker don't dismiss itself.
// If isOriginalPhoto is YES, user picked the original photo.
// You can get original photo with asset, by the method [[TZImageManager manager] getOriginalPhotoWithAsset:completion:].
// The UIImage Object in photos default width is 828px, you can set it by photoWidth property.
// 这个照片选择器会自己dismiss，当选择器dismiss的时候，会执行下面的代理方法
// 你也可以设置autoDismiss属性为NO，选择器就不会自己dismis了
// 如果isSelectOriginalPhoto为YES，表明用户选择了原图
// 你可以通过一个asset获得原图，通过这个方法：[[TZImageManager manager] getOriginalPhotoWithAsset:completion:]
// photos数组里的UIImage对象，默认是828像素宽，你可以通过设置photoWidth属性的值来改变它
 

/// 如果用户选择了某张照片下面的代理方法会被执行
/// 如果isSelectOriginalPhoto为YES，表明用户选择了原图
/// 你可以通过一个asset获得原图，通过这个方法：[[TZImageManager manager] getOriginalPhotoWithAsset:completion:]
- (void)imagePickerController:(TZImagePickerController *)picker didSelectAsset:(PHAsset *)asset photo:(UIImage *)photo isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
//    [_selectedAssets addObject:asset];
//    [_selectedPhotos addObject:photo];
//    [self.collectionView reloadData];
}

/// 如果用户取消选择了某张照片下面的代理方法会被执行
/// 如果isSelectOriginalPhoto为YES，表明用户选择了原图
/// 你可以通过一个asset获得原图，通过这个方法：[[TZImageManager manager] getOriginalPhotoWithAsset:completion:]
- (void)imagePickerController:(TZImagePickerController *)picker didDeselectAsset:(PHAsset *)asset photo:(UIImage *)photo isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
//    int index = -1;
//    for (int i = 0; i < _selectedAssets.count; i++) {
//        if ([_selectedAssets[i] isEqual:asset]) {
//            index = i;
//        }
//    }
//    if (index > -1) {
//        [_selectedAssets removeObjectAtIndex:index];
//        [_selectedPhotos removeObjectAtIndex:index];
//        [self.collectionView reloadData];
//    }
}

// If user picking a video and allowPickingMultipleVideo is NO, this callback will be called.
// If allowPickingMultipleVideo is YES, will call imagePickerController:didFinishPickingPhotos:sourceAssets:isSelectOriginalPhoto:
// 如果用户选择了一个视频且allowPickingMultipleVideo是NO，下面的代理方法会被执行
// 如果allowPickingMultipleVideo是YES，将会调用imagePickerController:didFinishPickingPhotos:sourceAssets:isSelectOriginalPhoto:
 

// If allowEditVideo is YES and allowPickingMultipleVideo is NO, When user picking a video, this callback will be called.
// If allowPickingMultipleVideo is YES, video editing is not supported, will call imagePickerController:didFinishPickingPhotos:sourceAssets:isSelectOriginalPhoto:
// 当allowEditVideo是YES且allowPickingMultipleVideo是NO是，如果用户选择了一个视频，下面的代理方法会被执行
// 如果allowPickingMultipleVideo是YES，则不支持编辑视频，将会调用imagePickerController:didFinishPickingPhotos:sourceAssets:isSelectOriginalPhoto:
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingAndEditingVideo:(UIImage *)coverImage outputPath:(NSString *)outputPath error:(NSString *)errorMsg {
//    _isAllowEditVideo = YES;
    self->_selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
    self->_selectedAssets = [NSMutableArray arrayWithArray:@[[NSURL fileURLWithPath:outputPath]]];
    if (outputPath) {
        // NSData *data = [NSData dataWithContentsOfFile:outputPath];
        NSLog(@"视频导出到本地完成,outputPath为:%@",outputPath);
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        publishPicAndVedioViewController * vc = [[publishPicAndVedioViewController alloc] init];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.selectedAssets = _selectedAssets;
        vc.selectedPhotos = _selectedPhotos;
        vc.isAllowEditVideo = YES;
        [self presentViewController:vc animated:YES completion:nil];
    } else {
        NSLog(@"视频导出失败:%@",errorMsg);
    }
//    [self.collectionView reloadData];
}

// If user fail to save edited, this callback will be called.
// 如果用户保存编辑好的视频失败，将会调用
- (void)imagePickerController:(TZImagePickerController *)picker didFailToSaveEditedVideoWithError:(NSError *)error {
    NSLog(@"编辑后的视频自动保存到相册失败:%@",error.description);
}

// If user picking a gif image and allowPickingMultipleVideo is NO, this callback will be called.
// If allowPickingMultipleVideo is YES, will call imagePickerController:didFinishPickingPhotos:sourceAssets:isSelectOriginalPhoto:
// 如果用户选择了一个gif图片且allowPickingMultipleVideo是NO，下面的代理方法会被执行
// 如果allowPickingMultipleVideo是YES，将会调用imagePickerController:didFinishPickingPhotos:sourceAssets:isSelectOriginalPhoto:
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingGifImage:(UIImage *)animatedImage sourceAssets:(PHAsset *)asset {
    _selectedPhotos = [NSMutableArray arrayWithArray:@[animatedImage]];
    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
//    [_collectionView reloadData];
}

// Decide album show or not't
// 决定相册显示与否
- (BOOL)isAlbumCanSelect:(NSString *)albumName result:(PHFetchResult *)result {
    /*
    if ([albumName isEqualToString:@"个人收藏"]) {
        return NO;
    }
    if ([albumName isEqualToString:@"视频"]) {
        return NO;
    }*/
    return YES;
}

// Decide asset show or not't
// 决定asset显示与否
- (BOOL)isAssetCanBeDisplayed:(PHAsset *)asset {
    /*
    switch (asset.mediaType) {
        case PHAssetMediaTypeVideo: {
            // 视频时长
            // NSTimeInterval duration = phAsset.duration;
            return NO;
        } break;
        case PHAssetMediaTypeImage: {
            // 图片尺寸
            if (asset.pixelWidth > 3000 || asset.pixelHeight > 3000) {
                 return NO;
            }
            return YES;
        } break;
        case PHAssetMediaTypeAudio:
            return NO;
            break;
        case PHAssetMediaTypeUnknown:
            return NO;
            break;
        default: break;
    }
     */
    return YES;
}

// Decide asset can be selected
// 决定照片能否被选中
- (BOOL)isAssetCanBeSelected:(PHAsset *)asset {
    /*
    switch (asset.mediaType) {
        case PHAssetMediaTypeVideo: {
            // 视频时长
            // NSTimeInterval duration = phAsset.duration;
            return NO;
        } break;
        case PHAssetMediaTypeImage: {
            // 图片尺寸
            if (asset.pixelWidth > 3000 || asset.pixelHeight > 3000) {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"不支持选择超大图片" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
                [self.presentedViewController presentViewController:alertController animated:YES completion:nil];
                return NO;
            }
            return YES;
        } break;
        case PHAssetMediaTypeAudio:
            return NO;
            break;
        case PHAssetMediaTypeUnknown:
            return NO;
            break;
        default: break;
    }
     */
    return YES;
}

#pragma mark - Click Event

 
#pragma mark - Private

/// 打印图片名字
- (void)printAssetsName:(NSArray *)assets {
    NSString *fileName;
    for (PHAsset *asset in assets) {
        fileName = [asset valueForKey:@"filename"];
        // NSLog(@"图片名字:%@",fileName);
    }
}
-(void)createScrollView{
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
    [self.view addSubview:self.homeScrollView];
//    [self.tabBarController.view addSubview:self.homeScrollView];
}
-(void)createSelectView{
    
    
    trendViewController *title_0VC = [[trendViewController alloc] init];
    favoriteViewController *title_1VC = [[favoriteViewController alloc] init];
    [self addChildViewController:title_1VC];
    [self addChildViewController:title_0VC];
    _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"红人", @"动态"]];
    _pageTabView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    _pageTabView.tabFrame = CGRectMake(0, 0, ScreenWidth, 44);

    _pageTabView.tabSize = CGSizeMake(ScreenWidth, 44);
    _pageTabView.tabItemFont = [UIFont fontWithName:@"PingFang SC" size: 17];
//    _pageTabView.unSelectedColor = [UIColor orangeColor];;
    _pageTabView.selectedColor = [UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0];
    _pageTabView.bodyBounces = NO;
    _pageTabView.titleStyle = XXPageTabTitleStyleDefault;
    _pageTabView.indicatorStyle = XXPageTabIndicatorStyleFollowText;
    _pageTabView.selectedTabIndex = 1;
     _pageTabView.delegate = self;
    _pageTabView.tabBackgroundColor =  [UIColor colorWithRed:248/255.0 green:250/255.0 blue:251/255.0 alpha:1.0];;
    [self.homeScrollView addSubview:_pageTabView];
     [self reloadScrollViewFrame:CGRectGetMaxY(_pageTabView.frame)];
}
-(void)createCellView{
    UIView * contentView =(UIView*) [self.view viewWithTag:10000];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 30, 30)];
    view.backgroundColor = [UIColor redColor];
    [contentView addSubview:view];
}
#pragma mark - XXPageTabViewDelegate
- (void)pageTabViewDidEndChange {
    NSInteger selectedTabIndex = _pageTabView.selectedTabIndex;
    NSLog(@"点击了index：%zd", selectedTabIndex);

    switch (selectedTabIndex) {
        case 0:
        {
            // 我的好友
        }
            break;
        case 1:
        {
            // 通讯录
        }
            break;
    }
}

#pragma mark 刷新列表
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}
@end
