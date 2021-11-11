//
//  BaseDataParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/6.
//

#import "BaseDataParser.h"
#import "Agro_loginModel.h"
#import "AFNetworking.h"
@implementation BaseDataParser
-(void)PostRequestDataWithControlParam:(NSDictionary *)param url:(NSString *)url BaseFinishBlock:(BaseFinishBlock)block
{
    
       
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
    //设置返回类型
     manager.securityPolicy.validatesDomainName =YES;
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 20.f;
//     [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"content-type"];
       [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"4:1507bfd3f715abecfa4:1.0.1" forHTTPHeaderField:@"ClientInfo"];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@%@",Agro_appDelegate.loginModel.tokenHead,Agro_appDelegate.loginModel.token] forHTTPHeaderField:@"Authorization"];
//    [manager.requestSerializer setValue:@"4:wdfv:1.0.1" forHTTPHeaderField:@"ClientInfo"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain",nil];
    NSLog(@"请求url%@=========%@",url,param);
    
    [manager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSError *error;
        NSData* data=[result dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        NSLog(@"成功=========%@",weatherDic);
        if ([weatherDic[@"code"] intValue]==200) {
            block(weatherDic);
        }else{
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"errorStates" object:nil userInfo:@{@"code":weatherDic[@"code"],@"message":weatherDic[@"message"]}];
        }
        
        [self parserDidRecevieData:weatherDic userInfo:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error========== %@",error.localizedDescription);
        [self parserFailedErr:error userInfo:nil];
        [[ChrysanthemumIndexView sharedMasterUser] remove];
        
    }];
}
-(void)PostRequestDataWithControArrlParam:(NSArray *)param url:(NSString *)url BaseFinishBlock:(BaseFinishBlock)block
{
    
       
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
    //设置返回类型
     manager.securityPolicy.validatesDomainName =YES;
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 20.f;
//     [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"content-type"];
       [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"4:1507bfd3f715abecfa4:1.0.1" forHTTPHeaderField:@"ClientInfo"];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@%@",Agro_appDelegate.loginModel.tokenHead,Agro_appDelegate.loginModel.token] forHTTPHeaderField:@"Authorization"];
//    [manager.requestSerializer setValue:@"4:wdfv:1.0.1" forHTTPHeaderField:@"ClientInfo"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain",nil];
    NSLog(@"请求url%@=========%@",url,param);
    
    [manager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSError *error;
        NSData* data=[result dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        NSLog(@"成功=========%@",weatherDic);
        if ([weatherDic[@"code"] intValue]==200) {
            block(weatherDic);
        }else{
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"errorStates" object:nil userInfo:@{@"code":weatherDic[@"code"],@"message":weatherDic[@"message"]}];
        }
        
        [self parserDidRecevieData:weatherDic userInfo:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error========== %@",error.localizedDescription);
        [self parserFailedErr:error userInfo:nil];
        [[ChrysanthemumIndexView sharedMasterUser] remove];
        
    }];
}
-(void)GetRequestDataWithControlParam:(NSDictionary *)param url:(NSString *)url BaseFinishBlock:(BaseFinishBlock)block
{
    
       
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
    //设置返回类型
     manager.securityPolicy.validatesDomainName =YES;
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 20.f;
//     [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"content-type"];
       [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"4:wdfv:1.0.1" forHTTPHeaderField:@"ClientInfo"];
//    [manager.requestSerializer setValue:@"4:wdfv:1.0.1" forHTTPHeaderField:@"ClientInfo"];
    Agro_loginModel * model =Agro_appDelegate.loginModel;
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@%@",model.tokenHead,model.token] forHTTPHeaderField:@"Authorization"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];

https://agrochemical-api.e2s4w.chinaharlan.com/open/news/item/{9}
    NSLog(@"请求=========%@",param);
//    NSString *str1 = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)url, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]{}", NULL, kCFStringEncodingUTF8));
   
    [manager GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSError *error;
        NSData* data=[result dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
         if ([weatherDic[@"code"] intValue]==200) {
             NSLog(@"成功=========%@",weatherDic);
            block(weatherDic);
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"errorStates" object:nil userInfo:@{@"code":weatherDic[@"code"],@"message":weatherDic[@"message"]}];
        }
         [self parserDidRecevieData:weatherDic userInfo:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error========== %@",error.localizedDescription);
        [self parserFailedErr:error userInfo:nil];
        [[ChrysanthemumIndexView sharedMasterUser] remove];
    }];
    
}
 

 
- (void)parserDidRecevieData:(NSDictionary *)data userInfo:(NSString *)userInfo
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(parser:didReceieData:userInfo:)])
    {
        [self.delegate parser:self didReceieData:data userInfo:userInfo];
    }
}

- (void)parserFailedErr:(NSError *)err userInfo:(NSString *)userInfo
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(parser:failedErr:userInfo:)])
    {
        [self.delegate parser:self failedErr:err userInfo:userInfo];
    }
}


@end
