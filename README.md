# KeyChainTest
学习keychain的使用
## 介绍
有用户就用用户名和密码，而现在的应用都少不了一个保存用户名和密码用于自动登录的功能。用过mac的人都不会对钥匙串感到陌生，这也是一个钥匙串，比起用数据库或者userdefault什么的来保存，这种方法会更安全一些，而且保存的内容不会随着应用的更新等删除，可以始终保存在沙盒中。这个方法还有一个优势，就是可以让用户名和密码在不同应用之间使用，一次保存，多次使用，这里推测一下，不知道使用第三方登录功能是不是用这个来实现的呢。一般自动登录不外乎对用户名和密码的保存、读取和修改，这里也主要讲这个三个功能的实现。

## 前期准备工作
1. 要使用keychain首先要导入secutity.framework框架，在左侧文件列表中选中项目名称，然后选中TARGETS，中间界面选中Build Phases，在Link Binary With Libraries中点击加号，搜索找到secutity.framework导入即可。  
2. 除了secutity.framework，我们还要添加一个东西到工程中，就是KeychainItemWrapper.h和KeychainItemWrapper.m文件，这两个也需要额外引入才能在我们自己的代码中引用，就当成是引用第三方类库一样吧，这两个文件直接复制进工程里面就好了，我的工程里也有这两个文件。  
3. 现在已经流行ARC机制，我们创建工程也是默认的全局使用ARC，但是这两个文件因为年代久远吧，还不是ARC而是MRC，可以在其代码中看到大量MRC的内容比如release之类的，如果不加修改，直接运行会报很多错误，所以有两个解决办法，第一个把所有报错的地方由MRC方式改成ARC方式，这种方法太麻烦，第二种就是直接禁用这个文件的ARC就好了。先在左侧文件列表中选中项目名称，然后选中TARGETS，中间界面选中Build Phases，然后在Compile Sources中找到要禁用的文件，这里是KeychainItemWrapper.m，然后双击修改其Compiler Flags值为 -fno-objc-arc。这样就不会报错了。

## 使用方法
### 保存用户名和密码
```Objective-C
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];// 1  
    [keychain setObject:username forKey:(__bridge id)(kSecAttrAccount)];// 2  
    [keychain setObject:password forKey:(__bridge id)(kSecValueData)];// 3  
```
解释：  
1. 这里是创建了一个keychain的对象，用来保存用户名和密码，创建的过程中有两个参数，一个是Identifier，这个参数是一个字符串，用来标识keychain，以后都根据这个标识来找到这里保存的内容；第二个是创建组，如果要在多个应用中使用Keychain，就要设置这个参数，是组的标识，这里我们只在本应用使用，就设为nil。Keychain还有很多属性可以设置，这里是最简单的用法，基本可以满足需求，如果想了解更多，可以继续查找资料了解。  
2. 我们的目的就是保存用户名和密码，Keychain保存非常简单，这一句代码就把用户名保存进去了，Keychain自己带有一些key值，各有各的用处，最常用的就是保存用户名和密码的，一般我们保存用户名就是放在这个Key中就好了。  
3. 同2一样，一般我们保存密码就是放在这个Key中的。除了这两个以外，还有一些其他的Key，有兴趣的可以继续了解。

### 获取用户名和密码
```Objective-C
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];// 通过同样的标志创建keychain  
    // 获取对应Key里保存的用户名和密码  
    NSString *username = [keychain objectForKey:(__bridge id)(kSecAttrAccount)];  
    NSString *password = [keychain objectForKey:(__bridge id)(kSecValueData)];  
```
一目了然。

### 修改keychain中的值
```Objective-C
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];// 找到keychain  
    [keychain setObject:newPassword forKey:(__bridge id)(kSecValueData)];// 设置密码对应Key的值  
```
其实基本和保存时一样。

详细说明见[我的博客](http://blog.csdn.net/cloudox_/article/details/48248651)
