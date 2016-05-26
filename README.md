# DKStatusBarHUDController
一个非常简单的状态指示器小测试框架

## 显示成功信息
```objc
[DKStatusBarHUDController showMessage:@"加载成功" andImage:[UIImage imageNamed:@"DKStatusBarHUDController.bundle/success"]];
```

## 显示失败信息
```objc
[DKStatusBarHUDController showMessage:@"加载失败" andImage:[UIImage imageNamed:@"DKStatusBarHUDController.bundle/error"]];
```

## 显示加载信息
```objc
[DKStatusBarHUDController showLoading:@"正在加载"];
```

## 隐藏
```objc
[DKStatusBarHUDController hideStatusBar];
```
