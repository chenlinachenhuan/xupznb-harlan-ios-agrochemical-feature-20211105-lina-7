//
//  publishPicAndVedioViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/22.
//

#import "publishPicAndVedioViewController.h"
#import "trendCreateParser.h"
#import "PublishCollectionView.h"
#import "publishCollectionViewCell.h"
#import "publishVIew.h"
#import "TZImagePickerController.h"
#import "UIView+TZLayout.h"
#import "TZTestCell.h"
#import <Photos/Photos.h>
#import "LxGridViewFlowLayout.h"
#import "TZImageManager.h"
#import "TZVideoPlayerController.h"
#import "TZPhotoPreviewController.h"
#import "TZGifPhotoPreviewController.h"
#import "TZLocationManager.h"
#import "TZAssetCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "FLAnimatedImage.h"
#import "TZImageUploadOperation.h"
#import "TZVideoEditedPreviewController.h"
#import "ALiyunOssParser.h"
#import "ossModel.h"
@interface publishPicAndVedioViewController ()<UITextViewDelegate,trendCreateParserDelegate,publishVIewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,TZImagePickerControllerDelegate,UIScrollViewDelegate,ALiyunOssParserDelegate>{
    CGFloat _itemWH;
    CGFloat _margin;
     
     BOOL _isSelectOriginalPhoto;
 }
@property(nonatomic,retain) UITextView * textView;
@property(nonatomic,retain)UICollectionView * collectionView;
@property(nonatomic,retain)NSMutableArray * imageArr;
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (strong, nonatomic) LxGridViewFlowLayout *layout;
@property (strong, nonatomic)  UIScrollView *scrollView;
@property (strong, nonatomic) CLLocation *location;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property(nonatomic,retain)UIScrollView *homeScrollView;

@end

@implementation publishPicAndVedioViewController
-(id)init{
    if (self==[super init]) {
        self.selectedAssets = [[NSMutableArray alloc] init];
        self.selectedPhotos = [[NSMutableArray alloc] init];

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createScrollView];
    [self createTextView];
    self.imageArr = [[NSMutableArray alloc] init];
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
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
-(void)createTextView{
    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TopHeight)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    bigButton * backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10.5, statusBarHeight, 44, 44);
    [backButton setImage:[UIImage imageNamed:@"??????"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backButton];
    
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, statusBarHeight, ScreenWidth, 44)];
    title.text = @"????????????";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = FontSize(17);
    [topView addSubview:title];
    
    UIButton * publishB = [UIButton buttonWithType:UIButtonTypeCustom];
    publishB.frame = CGRectMake(ScreenWidth-12-54, title.center.y-12, 54, 24);
    [publishB setBackgroundColor:SelectColor];
    [publishB setTitle:@"??????" forState:UIControlStateNormal];
    [publishB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    publishB.clipsToBounds = YES;
    publishB.layer.cornerRadius = 5;
    publishB.titleLabel.font = FontSize(15);
    [publishB addTarget:self action:@selector(publishMethod) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:publishB];
    
    UILabel * lineL = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame)-1, ScreenWidth, 1)];
    lineL.backgroundColor = BackGroundColor;
    [topView addSubview:lineL];
    
    self.textView = [[UITextView alloc] init];
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textView.frame  = CGRectMake(12, 5, ScreenWidth-24, 130);
    self.textView.showsVerticalScrollIndicator = NO;
    self.textView.delegate = self;
    self.textView.textColor = UIColorFromRGB(0xCCCCCC);
    self.textView.text = @"?????????????????????";
    self.textView.font = FontSize(15);
    [self.homeScrollView addSubview:self.textView];
//    CGFloat height = 0;
//    if (self.imageArr.count<3) {
//        height = (ScreenWidth-44-10)/3;
//    }else if (self.imageArr.count>=3&&self.imageArr.count<6)
//    {
//        height = (ScreenWidth-44-10)/3*2+5;
//    }else{
//        height = (ScreenWidth-44-10)/3*3+10;
//    }
//
    [self configCollectionView];
//    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
////    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    self.collectionView = [[PublishCollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textView.frame)+21, ScreenWidth-44, height) collectionViewLayout:flow];
//    self.collectionView.showsHorizontalScrollIndicator=NO;
//    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([publishCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"listCell"];
//    [self.collectionView  RowHeight:(ScreenWidth-44-10)/3 withRowWidth:(ScreenWidth-44-10)/3 withSpacing:5 withArr:self.imageArr selectedCell:^(NSIndexPath * _Nonnull indexPath) {
//        if (indexPath.row==self.imageArr.count) {
//            [self publishButtonMethod];
//        }else{
//
//        }
//    }];
//    [self.view addSubview:self.collectionView];
    
}
-(void)publishButtonMethod{
     
        publishVIew * publishV = [[publishVIew alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight1)];
        publishV.myDelegate= self;
        NSArray * titleArr =[NSArray arrayWithObjects:@"??????\n???????????????",@"???????????????",@"??????", nil];
        [publishV createPublishView:titleArr];
        [self.view addSubview:publishV];
    
}
-(void)publishTypeButtonMethod:(NSInteger)tag{
 }
 
#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.textColor = UIColorFromRGB(0xCCCCCC);
        textView.text = @"?????????????????????";
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"?????????????????????"]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
}
-(void)backButtonMethod{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)requestOss{
    [[ChrysanthemumIndexView sharedMasterUser]show];
    ALiyunOssParser *parser = [[ALiyunOssParser alloc] init];
    parser.myDelegate = self;
    [parser requestOSS];
}
-(void)successOss:(ossModel *)model{
    NSArray * arr = @[model];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:arr] forKey:[NSString stringWithFormat:@"%@ossModel",Agro_appDelegate.loginModel.myId]];
    if (_selectedAssets.count==1) {
        if ([_selectedAssets[0] isKindOfClass:[NSURL class]]){
            NSData *data = [NSData dataWithContentsOfURL:_selectedAssets[0]];
            NSLog(@"%@",data);
//            [[ChrysanthemumIndexView sharedMasterUser]show];
            [[AliyunOSSUpload aliyunInit] uploadVideo:data success:^(NSArray<NSString *> * _Nonnull nameArray) {
                if (nameArray.count==0) {
                    [[ChrysanthemumIndexView sharedMasterUser]remove];
                    [self dismissViewControllerAnimated:YES completion:nil];
                    FBUtilShowTipView(self.view,@"????????????");
                    return;
                }
                [[ChrysanthemumIndexView sharedMasterUser]remove];
                trendCreateParser * parser =[[trendCreateParser alloc] init];
                parser.myDelegate = self;
                [parser requestAlbumPics:nameArray[0] content:self.textView.text typeId:2 title:@"1"];
            }];
        }else if ([_selectedAssets[0] isKindOfClass:[PHAsset class]]){
            PHAsset * asset = _selectedAssets[0];
            if (asset.mediaType == PHAssetMediaTypeVideo) {
                PHVideoRequestOptions *options = [[PHVideoRequestOptions alloc] init];
                options.version = PHImageRequestOptionsVersionCurrent;
                options.deliveryMode = PHVideoRequestOptionsDeliveryModeAutomatic;
                PHImageManager *manager = [PHImageManager defaultManager];
                [manager requestAVAssetForVideo:asset options:options resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
                        AVURLAsset *urlAsset = (AVURLAsset *)asset;
                        NSURL *url = urlAsset.URL;
                        NSData *data = [NSData dataWithContentsOfURL:url];
                        NSLog(@"%@",data);
                    [[AliyunOSSUpload aliyunInit] uploadVideo:data success:^(NSArray<NSString *> * _Nonnull nameArray) {
                        trendCreateParser * parser =[[trendCreateParser alloc] init];
                        parser.myDelegate = self;
                        [parser requestAlbumPics:nameArray[0] content:self.textView.text typeId:2 title:@"1"];
                    }];

                }];


            }else{
                trendCreateParser * parser =[[trendCreateParser alloc] init];
                parser.myDelegate = self;
                [[AliyunOSSUpload aliyunInit] uploadImage:_selectedPhotos success:^(NSArray<NSString *> * _Nonnull nameArray) {
                    if (nameArray.count==0) {
                        [[ChrysanthemumIndexView sharedMasterUser]remove];
                        FBUtilShowTipView(self.view,@"????????????");
                        [self dismissViewControllerAnimated:YES completion:nil];
                        return;
                    }
                    NSString *nameStr = [nameArray componentsJoinedByString:@","];
                    [parser requestAlbumPics:nameStr content:self.textView.text typeId:1 title:@"1"];
                    
                }];
            }
        }
    }else if (_selectedAssets.count>1){
      
            trendCreateParser * parser =[[trendCreateParser alloc] init];
            parser.myDelegate = self;
            [[AliyunOSSUpload aliyunInit] uploadImage:_selectedPhotos success:^(NSArray<NSString *> * _Nonnull nameArray) {
                if (nameArray.count==0) {
                    [[ChrysanthemumIndexView sharedMasterUser]remove];
                    FBUtilShowTipView(self.view,@"????????????");
                    [self dismissViewControllerAnimated:YES completion:nil];
                    return;
                }
                NSString *nameStr = [nameArray componentsJoinedByString:@","];
                [parser requestAlbumPics:nameStr content:self.textView.text typeId:1 title:@"1"];
                
            }];
        
    }
    
   
    
}
 
-(void)publishMethod{
    NSData *data= [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@ossModel",Agro_appDelegate.loginModel.myId]];
    NSMutableArray * arr =[NSKeyedUnarchiver unarchiveObjectWithData:data];
    Agro_appDelegate.ossModel =[arr lastObject];
    if ([commonMethod compareOneDay:[commonMethod getCurrentTime] withAnotherDay:Agro_appDelegate.ossModel.expiration]==1||Agro_appDelegate.ossModel.expiration==nil) {
        [self requestOss];
    }
   
     
    
}
-(void)successCreateTrend{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadDataMethod" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)failedMethod:(NSString *)message{
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    FBUtilShowTipView(self.view,message);
}
- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / ???????????????????????????????????????
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
- (void)configCollectionView {
    // ????????????????????????????????????LxGridViewFlowLayout?????????UICollectionViewFlowLayout??????
    _layout = [[LxGridViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textView.frame), ScreenWidth, (ScreenWidth-44-10)/3) collectionViewLayout:_layout];
    CGFloat rgb = 244 / 255.0;
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.contentInset = UIEdgeInsetsMake(4, 4, 4, 4);
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.scrollEnabled = NO;
    _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.homeScrollView addSubview:_collectionView];
    [_collectionView registerClass:[TZTestCell class] forCellWithReuseIdentifier:@"TZTestCell"];
    NSLog(@"%f",CGRectGetMaxY(self.collectionView.frame));
    [self reloadScrollViewFrame:ScreenHeight+1];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    NSInteger contentSizeH = 14 * 35 + 20;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.scrollView.contentSize = CGSizeMake(0, contentSizeH + 5);
//    });
//    if (self.scrollView.tz_height + 80 > self.view.tz_height) {
//        self.scrollView.tz_height = self.view.tz_height - 80;
//    }
     _margin = 5;
    _itemWH = (ScreenWidth-40 - 2 * _margin ) / 3 ;
    _layout.itemSize = CGSizeMake(_itemWH, _itemWH);
    _layout.minimumInteritemSpacing = _margin;
    _layout.minimumLineSpacing = _margin;
    [self.collectionView setCollectionViewLayout:_layout];
    CGFloat collectionViewY = CGRectGetMaxY(self.scrollView.frame);
    self.collectionView.frame = CGRectMake(10, CGRectGetMaxY(self.textView.frame)+21, ScreenWidth-30 , self.view.tz_height - collectionViewY);
}
#pragma mark UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_selectedPhotos.count >= 9) {
        return _selectedPhotos.count;
    }
   
   
        if (_isAllowEditVideo) {
            return 1;
        } else {
            for (PHAsset *asset in _selectedAssets) {
                if (asset.mediaType == PHAssetMediaTypeVideo) {
                    return _selectedPhotos.count;
                }
            }
        }
    
    return _selectedPhotos.count + 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TZTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZTestCell" forIndexPath:indexPath];
    cell.videoImageView.hidden = YES;
    if (indexPath.item == _selectedPhotos.count) {
        cell.imageView.frame = CGRectMake(cell.bounds.size.width/2-17, cell.bounds.size.height/2-17, 34, 34);
//        cell.imageView.contentMode = 1;
        cell.imageView.image = [UIImage imageNamed:@"??????"];
        cell.deleteBtn.hidden = YES;
        cell.gifLable.hidden = YES;
    } else {
        cell.imageView.frame = cell.bounds;
        cell.imageView.image = _selectedPhotos[indexPath.item];
        if (!_isAllowEditVideo) {
            cell.asset = _selectedAssets[indexPath.item];
        }else{
            cell.videoImageView.hidden = NO;
        }
        cell.deleteBtn.hidden = NO;
    }
    
    cell.deleteBtn.tag = indexPath.item;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == _selectedPhotos.count) {
        BOOL showSheet =YES;
        if (showSheet) {
            NSString *takePhotoTitle = @"??????";
//            if (self.showTakeVideoBtnSwitch.isOn && self.showTakePhotoBtnSwitch.isOn) {
//                takePhotoTitle = @"??????";
//            } else if (self.showTakeVideoBtnSwitch.isOn) {
//                takePhotoTitle = @"??????";
//            }
            UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:takePhotoTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self takePhoto];
            }];
            [alertVc addAction:takePhotoAction];
            UIAlertAction *imagePickerAction = [UIAlertAction actionWithTitle:@"???????????????" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self pushTZImagePickerController];
            }];
            [alertVc addAction:imagePickerAction];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"??????" style:UIAlertActionStyleCancel handler:nil];
            [alertVc addAction:cancelAction];
            UIPopoverPresentationController *popover = alertVc.popoverPresentationController;
            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
            if (popover) {
                popover.sourceView = cell;
                popover.sourceRect = cell.bounds;
                popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
            }
            [self presentViewController:alertVc animated:YES completion:nil];
        } else {
            [self pushTZImagePickerController];
        }
    } else if (_isAllowEditVideo && [_selectedAssets[indexPath.item] isKindOfClass:[NSURL class]]) { // preview edited video / ????????????????????????
        TZVideoEditedPreviewController *vc = [[TZVideoEditedPreviewController alloc] init];
        vc.videoURL = _selectedAssets[indexPath.item];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:nil];
    } else { // preview photos or video / ????????????????????????
        PHAsset *asset = _selectedAssets[indexPath.item];
        BOOL isVideo = NO;
        isVideo = asset.mediaType == PHAssetMediaTypeVideo;
//        if ([[asset valueForKey:@"filename"] containsString:@"GIF"] && self.allowPickingGifSwitch.isOn && !self.allowPickingMuitlpleVideoSwitch.isOn) {
//            TZGifPhotoPreviewController *vc = [[TZGifPhotoPreviewController alloc] init];
//            TZAssetModel *model = [TZAssetModel modelWithAsset:asset type:TZAssetModelMediaTypePhotoGif timeLength:@""];
//            vc.model = model;
//            vc.modalPresentationStyle = UIModalPresentationFullScreen;
//            [self presentViewController:vc animated:YES completion:nil];}
         if (isVideo ) { // perview video / ????????????
            TZVideoPlayerController *vc = [[TZVideoPlayerController alloc] init];
            TZAssetModel *model = [TZAssetModel modelWithAsset:asset type:TZAssetModelMediaTypeVideo timeLength:@""];
            vc.model = model;
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:vc animated:YES completion:nil];
        } else { // preview photos / ????????????
            TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:_selectedPhotos index:indexPath.item];
            imagePickerVc.maxImagesCount = 9;
//            imagePickerVc.allowPickingGif = self.allowPickingGifSwitch.isOn;
            imagePickerVc.autoSelectCurrentWhenDone = NO;
            imagePickerVc.allowPickingOriginalPhoto = YES;
            imagePickerVc.allowPickingMultipleVideo = NO;
            imagePickerVc.showSelectedIndex = YES;
            imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
            imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
            [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
                self->_selectedPhotos = [NSMutableArray arrayWithArray:photos];
                self->_selectedAssets = [NSMutableArray arrayWithArray:assets];
                self->_isSelectOriginalPhoto = isSelectOriginalPhoto;
                [self->_collectionView reloadData];
                self->_collectionView.contentSize = CGSizeMake(0, ((self->_selectedPhotos.count + 2) / 3 ) * (self->_margin + self->_itemWH));
            }];
            [self presentViewController:imagePickerVc animated:YES completion:nil];
        }
    }
}
#pragma mark - LxGridViewDataSource

/// ?????????????????????????????????????????????
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.item < _selectedPhotos.count;
}

- (BOOL)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath canMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    return (sourceIndexPath.item < _selectedPhotos.count && destinationIndexPath.item < _selectedPhotos.count);
}

- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath didMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    UIImage *image = _selectedPhotos[sourceIndexPath.item];
    [_selectedPhotos removeObjectAtIndex:sourceIndexPath.item];
    [_selectedPhotos insertObject:image atIndex:destinationIndexPath.item];
    
    id asset = _selectedAssets[sourceIndexPath.item];
    [_selectedAssets removeObjectAtIndex:sourceIndexPath.item];
    [_selectedAssets insertObject:asset atIndex:destinationIndexPath.item];
    
    [_collectionView reloadData];
}

#pragma mark - TZImagePickerController

- (void)pushTZImagePickerController {
//    if (self.maxCountTF.text.integerValue <= 0) {
//        return;
//    }
    // ??????languageBundle?????????????????????????????????TZImagePickerController?????????????????? / Set languageBundle to use other language
    // [TZImagePickerConfig sharedInstance].languageBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"tz-ru" ofType:@"lproj"]];

    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    
#pragma mark - ??????????????????????????????????????????????????????????????????????????????
    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    
//    if (self.maxCountTF.text.integerValue > 1) {
        // 1.???????????????????????????????????????
        imagePickerVc.selectedAssets = _selectedAssets; // ?????????????????????????????????
//    }
    imagePickerVc.allowTakePicture = YES; // ???????????????????????????
    imagePickerVc.allowTakeVideo = YES;   // ???????????????????????????
    imagePickerVc.videoMaximumDuration = 10; // ????????????????????????
    imagePickerVc.allowEditVideo = YES; // ??????????????????
    // imagePickerVc.saveEditedVideoToCollection = YES; // ?????????????????????????????????????????????
    // imagePickerVc.maxCropVideoDuration = 30; // ???????????????????????????
    // imagePickerVc.presetName = AVAssetExportPresetMediumQuality // ?????????????????????????????????
    [imagePickerVc setUiImagePickerControllerSettingBlock:^(UIImagePickerController *imagePickerController) {
        imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    }];
    // imagePickerVc.autoSelectCurrentWhenDone = NO;
    
    // imagePickerVc.photoWidth = 1600;
    // imagePickerVc.photoPreviewMaxWidth = 1600;
    
    // 2. Set the appearance
    // 2. ???????????????imagePickerVc?????????
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
    // 3. ??????????????????????????????/??????/??????
    imagePickerVc.allowPickingVideo = YES;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
//    imagePickerVc.allowPickingGif = self.allowPickingGifSwitch.isOn;
//    imagePickerVc.allowPickingMultipleVideo = self.allowPickingMuitlpleVideoSwitch.isOn; // ????????????????????????
    
    // 4. ?????????????????????????????????
//    imagePickerVc.sortAscendingByModificationDate = self.sortAscendingSwitch.isOn;
    
    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. ????????????,maxImagesCount???1????????????
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = YES;
//    imagePickerVc.needCircleCrop = YES;
    // ??????????????????????????????
    NSInteger left = 30;
    NSInteger widthHeight = self.view.tz_width - 2 * left;
    NSInteger top = (self.view.tz_height - widthHeight) / 2;
    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    imagePickerVc.scaleAspectFillCrop = YES;
    // ??????????????????????????????
    // imagePickerVc.cropRectLandscape = CGRectMake((self.view.tz_height - widthHeight) / 2, left, widthHeight, widthHeight);
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/
    
    // imagePickerVc.allowPreview = NO;
    // ????????????????????????????????????
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
    
    // ??????????????????????????????
    imagePickerVc.showSelectedIndex = YES;
    
    // ???????????????????????????????????????????????????????????????????????????????????????????????????demo????????????pushImagePickerController??????????????????????????????
    // imagePickerVc.allowCameraLocation = NO;
    
    // ?????????gif????????????
    [[TZImagePickerConfig sharedInstance] setGifImagePlayBlock:^(TZPhotoPreviewView *view, UIImageView *imageView, NSData *gifData, NSDictionary *info) {
        FLAnimatedImage *animatedImage = [FLAnimatedImage animatedImageWithGIFData:gifData];
        FLAnimatedImageView *animatedImageView;
        for (UIView *subview in imageView.subviews) {
            if ([subview isKindOfClass:[FLAnimatedImageView class]]) {
                animatedImageView = (FLAnimatedImageView *)subview;
                animatedImageView.frame = imageView.bounds;
                animatedImageView.animatedImage = nil;
            }
        }
        if (!animatedImageView) {
            animatedImageView = [[FLAnimatedImageView alloc] initWithFrame:imageView.bounds];
            animatedImageView.runLoopMode = NSDefaultRunLoopMode;
            [imageView addSubview:animatedImageView];
        }
        animatedImageView.animatedImage = animatedImage;
    }];
    
    // ?????????????????? / Set preferred language
    // imagePickerVc.preferredLanguage = @"zh-Hans";
    
#pragma mark - ???????????????
    
    // You can get the photos by block, the same as by delegate.
    // ???????????????block?????????????????????????????????????????????.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {

    }];
    
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

/*
// ?????????navLeftBarButtonSettingBlock????????????????????????????????????????????????????????????
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
 
    navigationController.interactivePopGestureRecognizer.enabled = YES;
    if (viewController != navigationController.viewControllers[0]) {
        navigationController.interactivePopGestureRecognizer.delegate = nil; // ????????????
    }
}
*/

#pragma mark - UIImagePickerController

- (void)takePhoto {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        // ??????????????? ????????????????????????
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"??????????????????" message:@"??????iPhone???""??????-??????-??????""?????????????????????" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"??????" style:UIAlertActionStyleCancel handler:nil]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"??????" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, ??????????????????????????????????????????????????????
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self takePhoto];
                });
            }
        }];
        // ???????????????????????????????????????
    } else if ([PHPhotoLibrary authorizationStatus] == 2) { // ???????????????????????????????????????????????????????????????
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"??????????????????" message:@"??????iPhone???""??????-??????-??????""?????????????????????" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"??????" style:UIAlertActionStyleCancel handler:nil]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"??????" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if ([PHPhotoLibrary authorizationStatus] == 0) { // ????????????????????????
        [[TZImageManager manager] requestAuthorizationWithCompletion:^{
            [self takePhoto];
        }];
    } else {
        [self pushImagePickerController];
    }
}

// ????????????
- (void)pushImagePickerController {
    // ????????????
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
        NSLog(@"?????????????????????????????????,?????????????????????");
    }
}
-(void)typeForVideoOrPhoto:(NSString*)type didFinishPickingMediaWithInfo:(NSDictionary *)info{
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    tzImagePickerVc.sortAscendingByModificationDate = YES;
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSDictionary *meta = [info objectForKey:UIImagePickerControllerMediaMetadata];
        // save photo and get asset / ????????????????????????asset
        [[TZImageManager manager] savePhotoWithImage:image meta:meta location:self.location completion:^(PHAsset *asset, NSError *error){
            [tzImagePickerVc hideProgressHUD];
            if (error) {
                NSLog(@"?????????????????? %@",error);
            } else {
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
//                if (YES) { // ????????????,?????????
//                    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initCropTypeWithAsset:assetModel.asset photo:image completion:^(UIImage *cropImage, id asset) {
//                        [self refreshCollectionViewWithAddedAsset:asset image:cropImage];
//                    }];
//                    imagePicker.allowPickingImage = YES;
//                    imagePicker.needCircleCrop = YES;
//                    imagePicker.circleCropRadius = 100;
//                    [self presentViewController:imagePicker animated:YES completion:nil];
//                } else
//                {
                    [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
//                }
            }
        }];
    } else if ([type isEqualToString:@"public.movie"]) {
        NSURL *videoUrl = [info objectForKey:UIImagePickerControllerMediaURL];
        if (videoUrl) {
            [[TZImageManager manager] saveVideoWithUrl:videoUrl location:self.location completion:^(PHAsset *asset, NSError *error) {
                [tzImagePickerVc hideProgressHUD];
                if (!error) {
                    TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                    [[TZImageManager manager] getPhotoWithAsset:assetModel.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
                        if (!isDegraded && photo) {
                            
                            [self refreshCollectionViewWithAddedAsset:assetModel.asset image:photo];
                        }
                    }];
                }
            }];
        }
    }
}
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    tzImagePickerVc.sortAscendingByModificationDate = YES;
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSDictionary *meta = [info objectForKey:UIImagePickerControllerMediaMetadata];
        // save photo and get asset / ????????????????????????asset
        [[TZImageManager manager] savePhotoWithImage:image meta:meta location:self.location completion:^(PHAsset *asset, NSError *error){
            [tzImagePickerVc hideProgressHUD];
            if (error) {
                NSLog(@"?????????????????? %@",error);
            } else {
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
//                if (YES) { // ????????????,?????????
//                    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initCropTypeWithAsset:assetModel.asset photo:image completion:^(UIImage *cropImage, id asset) {
//                        [self refreshCollectionViewWithAddedAsset:asset image:cropImage];
//                    }];
//                    imagePicker.allowPickingImage = YES;
//                    imagePicker.needCircleCrop = YES;
//                    imagePicker.circleCropRadius = 100;
//                    [self presentViewController:imagePicker animated:YES completion:nil];
//                } else
//                {
                    [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
//                }
            }
        }];
    } else if ([type isEqualToString:@"public.movie"]) {
        NSURL *videoUrl = [info objectForKey:UIImagePickerControllerMediaURL];
        if (videoUrl) {
            [[TZImageManager manager] saveVideoWithUrl:videoUrl location:self.location completion:^(PHAsset *asset, NSError *error) {
                [tzImagePickerVc hideProgressHUD];
                if (!error) {
                    TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                    [[TZImageManager manager] getPhotoWithAsset:assetModel.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
                        if (!isDegraded && photo) {
                            [self refreshCollectionViewWithAddedAsset:assetModel.asset image:photo];
                        }
                    }];
                }
            }];
        }
    }
}

- (void)refreshCollectionViewWithAddedAsset:(PHAsset *)asset image:(UIImage *)image {
    [_selectedAssets addObject:asset];
    [_selectedPhotos addObject:image];
    [_collectionView reloadData];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - TZImagePickerControllerDelegate

/// User click cancel button
/// ?????????????????????
- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    // NSLog(@"cancel");
}

// The picker should dismiss itself; when it dismissed these handle will be called.
// You can also set autoDismiss to NO, then the picker don't dismiss itself.
// If isOriginalPhoto is YES, user picked the original photo.
// You can get original photo with asset, by the method [[TZImageManager manager] getOriginalPhotoWithAsset:completion:].
// The UIImage Object in photos default width is 828px, you can set it by photoWidth property.
// ??????????????????????????????dismiss???????????????dismiss??????????????????????????????????????????
// ??????????????????autoDismiss?????????NO???????????????????????????dismis???
// ??????isSelectOriginalPhoto???YES??????????????????????????????
// ?????????????????????asset????????????????????????????????????[[TZImageManager manager] getOriginalPhotoWithAsset:completion:]
// photos????????????UIImage??????????????????828?????????????????????????????????photoWidth????????????????????????
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    _isSelectOriginalPhoto = isSelectOriginalPhoto;
    [_collectionView reloadData];
    // _collectionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));

    // 1.??????????????????
    [self printAssetsName:assets];
    // 2.??????????????????
    for (PHAsset *phAsset in assets) {
        NSLog(@"location:%@",phAsset.location);
    }

    // 3. ??????????????????????????????????????????????????????1?????????????????????
    self.operationQueue = [[NSOperationQueue alloc] init];
    self.operationQueue.maxConcurrentOperationCount = 1;
    for (NSInteger i = 0; i < assets.count; i++) {
        PHAsset *asset = assets[i];
        // ????????????operation????????????????????????operation??????start????????????????????????
        TZImageUploadOperation *operation = [[TZImageUploadOperation alloc] initWithAsset:asset completion:^(UIImage * photo, NSDictionary *info, BOOL isDegraded) {
            if (isDegraded) return;
            NSLog(@"????????????&????????????");
        } progressHandler:^(double progress, NSError * _Nonnull error, BOOL * _Nonnull stop, NSDictionary * _Nonnull info) {
            NSLog(@"?????????????????? %f", progress);
        }];
        [self.operationQueue addOperation:operation];
    }
}

/// ??????????????????????????????????????????????????????????????????
/// ??????isSelectOriginalPhoto???YES??????????????????????????????
/// ?????????????????????asset????????????????????????????????????[[TZImageManager manager] getOriginalPhotoWithAsset:completion:]
- (void)imagePickerController:(TZImagePickerController *)picker didSelectAsset:(PHAsset *)asset photo:(UIImage *)photo isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
//    [_selectedAssets addObject:asset];
//    [_selectedPhotos addObject:photo];
//    [self.collectionView reloadData];
}

/// ????????????????????????????????????????????????????????????????????????
/// ??????isSelectOriginalPhoto???YES??????????????????????????????
/// ?????????????????????asset????????????????????????????????????[[TZImageManager manager] getOriginalPhotoWithAsset:completion:]
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
// ????????????????????????????????????allowPickingMultipleVideo???NO????????????????????????????????????
// ??????allowPickingMultipleVideo???YES???????????????imagePickerController:didFinishPickingPhotos:sourceAssets:isSelectOriginalPhoto:
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(PHAsset *)asset {
    _selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
    // open this code to send video / ??????????????????????????????
    [[TZImageManager manager] getVideoOutputPathWithAsset:asset presetName:AVAssetExportPresetLowQuality success:^(NSString *outputPath) {
        // NSData *data = [NSData dataWithContentsOfFile:outputPath];
        NSLog(@"???????????????????????????,???????????????:%@",outputPath);
        // Export completed, send video here, send by outputPath or NSData
        // ??????????????????????????????????????????????????????????????????NSData??????
    } failure:^(NSString *errorMessage, NSError *error) {
        NSLog(@"??????????????????:%@,error:%@",errorMessage, error);
    }];
    [_collectionView reloadData];
    // _collectionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));
}

// If allowEditVideo is YES and allowPickingMultipleVideo is NO, When user picking a video, this callback will be called.
// If allowPickingMultipleVideo is YES, video editing is not supported, will call imagePickerController:didFinishPickingPhotos:sourceAssets:isSelectOriginalPhoto:
// ???allowEditVideo???YES???allowPickingMultipleVideo???NO???????????????????????????????????????????????????????????????????????????
// ??????allowPickingMultipleVideo???YES??????????????????????????????????????????imagePickerController:didFinishPickingPhotos:sourceAssets:isSelectOriginalPhoto:
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingAndEditingVideo:(UIImage *)coverImage outputPath:(NSString *)outputPath error:(NSString *)errorMsg {
    _isAllowEditVideo = YES;
    self->_selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
    self->_selectedAssets = [NSMutableArray arrayWithArray:@[[NSURL fileURLWithPath:outputPath]]];
    if (outputPath) {
        // NSData *data = [NSData dataWithContentsOfFile:outputPath];
        NSLog(@"???????????????????????????,outputPath???:%@",outputPath);
        // Export completed, send video here, send by outputPath or NSData
        // ??????????????????????????????????????????????????????????????????NSData??????
    } else {
        NSLog(@"??????????????????:%@",errorMsg);
    }
    [self.collectionView reloadData];
}

// If user fail to save edited, this callback will be called.
// ?????????????????????????????????????????????????????????
- (void)imagePickerController:(TZImagePickerController *)picker didFailToSaveEditedVideoWithError:(NSError *)error {
    NSLog(@"?????????????????????????????????????????????:%@",error.description);
}

// If user picking a gif image and allowPickingMultipleVideo is NO, this callback will be called.
// If allowPickingMultipleVideo is YES, will call imagePickerController:didFinishPickingPhotos:sourceAssets:isSelectOriginalPhoto:
// ???????????????????????????gif?????????allowPickingMultipleVideo???NO????????????????????????????????????
// ??????allowPickingMultipleVideo???YES???????????????imagePickerController:didFinishPickingPhotos:sourceAssets:isSelectOriginalPhoto:
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingGifImage:(UIImage *)animatedImage sourceAssets:(PHAsset *)asset {
    _selectedPhotos = [NSMutableArray arrayWithArray:@[animatedImage]];
    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
    [_collectionView reloadData];
}

// Decide album show or not't
// ????????????????????????
- (BOOL)isAlbumCanSelect:(NSString *)albumName result:(PHFetchResult *)result {
    /*
    if ([albumName isEqualToString:@"????????????"]) {
        return NO;
    }
    if ([albumName isEqualToString:@"??????"]) {
        return NO;
    }*/
    return YES;
}

// Decide asset show or not't
// ??????asset????????????
- (BOOL)isAssetCanBeDisplayed:(PHAsset *)asset {
    /*
    switch (asset.mediaType) {
        case PHAssetMediaTypeVideo: {
            // ????????????
            // NSTimeInterval duration = phAsset.duration;
            return NO;
        } break;
        case PHAssetMediaTypeImage: {
            // ????????????
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
// ???????????????????????????
- (BOOL)isAssetCanBeSelected:(PHAsset *)asset {
    /*
    switch (asset.mediaType) {
        case PHAssetMediaTypeVideo: {
            // ????????????
            // NSTimeInterval duration = phAsset.duration;
            return NO;
        } break;
        case PHAssetMediaTypeImage: {
            // ????????????
            if (asset.pixelWidth > 3000 || asset.pixelHeight > 3000) {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"???????????????????????????" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [alertController addAction:[UIAlertAction actionWithTitle:@"??????" style:UIAlertActionStyleDefault handler:nil]];
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

- (void)deleteBtnClik:(UIButton *)sender {
    if ([self collectionView:self.collectionView numberOfItemsInSection:0] <= _selectedPhotos.count) {
        [_selectedPhotos removeObjectAtIndex:sender.tag];
        [_selectedAssets removeObjectAtIndex:sender.tag];
        [self.collectionView reloadData];
        return;
    }
    
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    [_selectedAssets removeObjectAtIndex:sender.tag];
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [self->_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [self->_collectionView reloadData];
    }];
}
#pragma mark - Private

/// ??????????????????
- (void)printAssetsName:(NSArray *)assets {
    NSString *fileName;
    for (PHAsset *asset in assets) {
        fileName = [asset valueForKey:@"filename"];
        // NSLog(@"????????????:%@",fileName);
    }
}

#pragma mark ????????????
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}

@end
