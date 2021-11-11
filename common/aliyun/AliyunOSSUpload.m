//
//  AliyunOSSUpload.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/25.
//

#import <AliyunOSSiOS/OSSService.h>
#import <AliyunOSSiOS/OSSCompat.h>
#import "AliyunOSSUpload.h"

//#import "IHUtility.h" //就是对图片名字的操作
//#import "NSObject+SBJSON.h"

NSString * const endPoint = @"";

OSSClient * client;
@implementation AliyunOSSUpload
static AliyunOSSUpload *_uploader;

+ (AliyunOSSUpload *)aliyunInit {
    @synchronized(self) {
        if (_uploader == nil) {
            [OSSLog enableLog];
            _uploader = [[AliyunOSSUpload alloc] init];
            NSString *endpoint = @"oss-cn-hangzhou.aliyuncs.com";
            NSData *data= [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@ossModel",Agro_appDelegate.loginModel.myId]];
            NSMutableArray * arr =[NSKeyedUnarchiver unarchiveObjectWithData:data];
            Agro_appDelegate.ossModel =[arr lastObject];
            ossModel* model =Agro_appDelegate.ossModel;
            // 移动端建议使用STS方式初始化OSSClient。
            id<OSSCredentialProvider> credential = [[OSSFederationCredentialProvider alloc] initWithFederationTokenGetter:^OSSFederationToken * _Nullable{
                OSSFederationToken *token = [OSSFederationToken new];
                // 从STS服务获取的临时访问密钥（AccessKey ID和AccessKey Secret）。
                token.tAccessKey = model.accessKeyId;
                token.tSecretKey = model.accessKeySecret;
                // 从STS服务获取的安全令牌（SecurityToken）。
                token.tToken = model.securityToken;
                // 临时访问凭证的过期时间。
        //        token.expirationTimeInGMTFormat = @"Expiration";
                return token;
            }];

          client = [[OSSClient alloc] initWithEndpoint:endpoint credentialProvider:credential];
            
        }
    }
    return _uploader;
}


- (void)uploadImage:(NSArray <UIImage *>*)imgArray success:(void (^)(NSArray <NSString *> * nameArray))success {
    
    dispatch_group_t group = dispatch_group_create();
    
    //名字数组
    NSMutableArray *nameArray = [NSMutableArray array];
    
    for (int i = 0; i < imgArray.count; i ++) {
        
        dispatch_group_enter(group); //进入组

        NSString *s = [NSString stringWithFormat:@"photo_name_%d_%@.jpeg",i,[NSUUID UUID].UUIDString];
                
        OSSPutObjectRequest * put = [OSSPutObjectRequest new];
        // 填写Bucket名称，例如examplebucket。
        put.bucketName = @"harlan-storage";
        // 填写Object完整路径。Object完整路径中不能包含Bucket名称，例如exampledir/testdir/exampleobject.txt。
        put.objectKey = [NSString stringWithFormat:@"agrochemical/images/%@/%@",[commonMethod getCurrentTimeStr],s];
        // 直接上传NSData。
        
        put.uploadingData = UIImagePNGRepresentation(imgArray[i]);
        put.uploadProgress = ^(int64_t bytesSent, int64_t totalByteSent, int64_t totalBytesExpectedToSend) {
            NSLog(@"%lld, %lld, %lld", bytesSent, totalByteSent, totalBytesExpectedToSend);
        };
        OSSTask * putTask = [client putObject:put];
        [putTask continueWithBlock:^id(OSSTask *task) {
            if (!task.error) {
                task = [client presignPublicURLWithBucketName:@"harlan-storage"
                                                           withObjectKey:[NSString stringWithFormat:@"agrochemical/images/%@/%@",[commonMethod getCurrentTimeStr],s]];
                NSLog(@"%@",task.result);
                NSLog(@"upload object success!");
                [nameArray addObject:task.result];
               
            } else {
                NSLog(@"upload object failed, error: %@" , task.error);
            }
            dispatch_group_leave(group);
            return nil;
        }];
 //        OSSTask * putTask = [client putObject:put];
//        [putTask continueWithBlock:^id(OSSTask *task) {
//            if (!task.error) {
//                NSLog(@"图片上传成功!");
//                [nameArray addObject:s];
//            } else{
//                NSLog(@"图片上传失败: %@" , task.error);
//            }
//            dispatch_group_leave(group);  //不论是成功或者失败,都离开组
//            return nil;
//        }];
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        success(nameArray);
        NSLog(@"任务全部完成,当前线程 %@",[NSThread currentThread]); //收到任务全部完成的通知
     });
}

/// 上传视频

- (void)uploadVideo:(NSData*)videoData success:(void (^)(NSArray <NSString *> * nameArray))success {
    
    dispatch_group_t group = dispatch_group_create();
    
    //名字数组
    NSMutableArray *nameArray = [NSMutableArray array];
    
    
        
        dispatch_group_enter(group); //进入组

        NSString *s = [NSString stringWithFormat:@"video_name_%@.MOV",[NSUUID UUID].UUIDString];
                
        OSSPutObjectRequest * put = [OSSPutObjectRequest new];
        // 填写Bucket名称，例如examplebucket。
        put.bucketName = @"harlan-storage";
        // 填写Object完整路径。Object完整路径中不能包含Bucket名称，例如exampledir/testdir/exampleobject.txt。
        put.objectKey = [NSString stringWithFormat:@"agrochemical/images/%@/%@",[commonMethod getCurrentTimeStr],s];
        // 直接上传NSData。
        
        put.uploadingData = videoData;
        put.uploadProgress = ^(int64_t bytesSent, int64_t totalByteSent, int64_t totalBytesExpectedToSend) {
            NSLog(@"%lld, %lld, %lld", bytesSent, totalByteSent, totalBytesExpectedToSend);
        };
        OSSTask * putTask = [client putObject:put];
        [putTask continueWithBlock:^id(OSSTask *task) {
            if (!task.error) {
                task = [client presignPublicURLWithBucketName:@"harlan-storage"
                                                           withObjectKey:[NSString stringWithFormat:@"agrochemical/images/%@/%@",[commonMethod getCurrentTimeStr],s]];
                NSLog(@"%@",task.result);
                NSLog(@"upload object success!");
                [nameArray addObject:task.result];
               
            } else {
                [[ChrysanthemumIndexView sharedMasterUser]remove];
                NSLog(@"upload object failed, error: %@" , task.error);
            }
            dispatch_group_leave(group);
            return nil;
        }];
 //        OSSTask * putTask = [client putObject:put];
//        [putTask continueWithBlock:^id(OSSTask *task) {
//            if (!task.error) {
//                NSLog(@"图片上传成功!");
//                [nameArray addObject:s];
//            } else{
//                NSLog(@"图片上传失败: %@" , task.error);
//            }
//            dispatch_group_leave(group);  //不论是成功或者失败,都离开组
//            return nil;
//        }];
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        success(nameArray);
        NSLog(@"任务全部完成,当前线程 %@",[NSThread currentThread]); //收到任务全部完成的通知
    });
}
@end
