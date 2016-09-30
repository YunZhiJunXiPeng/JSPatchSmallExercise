//
//  ViewController.m
//  JSPatch测试
//
//  Created by 云之君兮鹏 on 16/9/29.
//  Copyright © 2016年 云之君兮鹏. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

// 一定要继承于 JSExport
@protocol JS_OC_Delegate <JSExport>

@property (nonatomic, strong) NSString *name;

@end

@interface ViewController ()<UIWebViewDelegate, JS_OC_Delegate>

@end

@implementation ViewController

@synthesize name;

- (void)viewDidLoad {
    [super viewDidLoad];
//    // 服务器地址
//    // http://172.21.62.99/train/index4.html
//    UIWebView *webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:webview];
//    webview.delegate = self;
//    // 加载一个网址
//    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://172.21.62.99/train/index4.html"]]];
  
    self.name = @"云之君兮鹏";
    JSContext *context = [[JSContext alloc] init];
    context[@"OC_Object"] = self;
    [context evaluateScript:@"OC_Object.name = '小超人'"];
     NSLog(@"%s--->%@",__func__,self.name);
 
    
    //JSContext *context = [[JSContext alloc] init];
//    JSValue *value =  [context evaluateScript:@"1+2"];
//    NSLog(@"%s--->%@",__func__,value);
//    [context evaluateScript:@"var name = '张三'"];
//     NSLog(@"%s--->%@",__func__,context[@"name"]);
//    
//    context[@"log"] = ^(NSInteger value){
//        NSLog(@"-------->%ld",value);
//        // 处理参数
//        NSArray *arr = [JSContext currentArguments]; // 返回一个数组
//        for (id item in arr) {
//            NSLog(@"--->%@",item);
//        }
//    };
//    [context evaluateScript:@"log(11,2,3)"];
//
//
//    
//     [context evaluateScript:@"var numSum = function(n){var sum = 0;  for( i = 0;i <= n;i++ ){ sum += i; } return sum }; var factorial = function(n) { if (n < 0) return; if (n === 0) return 1; return n * factorial(n - 1) };"];
//    JSValue *function = context[@"numSum"];
//    // 计算从 0 到 N 和
//    JSValue *numSum = [function callWithArguments:@[@5]];
//    // 计算 N 的阶乘
//    JSValue *numFactorial = [context[@"factorial"] callWithArguments:@[@5]];
//    
//    NSLog(@"把 JS结果转化成 OC结果---->求和结果%d 阶乘结果%d",[numSum toInt32],[numFactorial toInt32]);
//    
//    UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectMake(10, 10, 300, 500)];
//    [self.view addSubview:webview];
//    webview.delegate = self;
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
//    NSString *urlStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//   
//    [webview loadHTMLString:urlStr baseURL:nil];
//    
// 
 
    
}
// 每次加载网页请求都会走该方法
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 获取 HTML 的标签信息
    //NSString *js = @"document.getElementsByTagName('body')[0].innerHTML";
    //NSString *content = [webView stringByEvaluatingJavaScriptFromString:js];
    //NSLog(@"%s--->%@",__func__,content);
//    NSString *jsImg = @"var img = document.getElementsByTagName('img')[0];var img = document.getElementsByTagName('body')[0];body.removeChild(img)";
//    [webView stringByEvaluatingJavaScriptFromString:jsImg];
    
//    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    context[@"log"] = ^(){
//        NSLog(@"点击了网页上那个的 Button");
//    };
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
