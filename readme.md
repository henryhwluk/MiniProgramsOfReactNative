# MiniProgramsOfReactNative

## 安装依赖

必须安装的依赖有：Node、Watchman 和 Xcode。


```
# node
brew install node 

# watchman
brew install watchman

# 使用nrm工具切换淘宝源
npx nrm use taobao

# 如果之后需要切换回官方源可使用
npx nrm use npm
```

### Yarn

[Yarn](http://yarnpkg.com/)是 Facebook 提供的替代 npm 的工具，可以加速 node 模块的下载。

```
npm install -g yarn
```

### 运行项目

```J
# clone
$ git clone https://github.com/henvyluk/MiniProgramsOfReactNative.git

$ cd MiniProgramsOfReactNative

# 安装依赖，会下载到 node_modules/中
$ yarn install

# 项目主要文件目录
├── ios 							//iOS 原生项目
├── index.js 					// RN 入口源码文件，根据这个入口可以本地编译成 jsbundle文件
├── node_modules 			// RN 第三方依赖库合集（包含 iOS 的依赖，可link到项目project）
├── package-lock.json // npm lock
├── package.json 			// 包管理文件
├── app.json 					// RN 模块名称声明文件
├── readme.md
├── yarn.lock 				// yarn lock
└── bundle 						// 本地编译成 jsbundle文件目录包含assets资源文件
```

### 调试阶段

```
# 可以先手动导入js文件导入到index.js的入口如：
import App from './components/App';

# 更改app.json中name，并在index.js中注册如：
AppRegistry.registerComponent(appName, () => App);

# 更改iOS 模块注册名称如tic-tac-toe：
	RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                  	 	moduleName:@"tic-tac-toe"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
```

### 打包bundle

```
# 根目录建立bundle目录
react-native bundle --entry-file index.js --bundle-output ./bundle/index.jsbundle --platform ios --assets-dest ./bundle/ --dev flase

# 构建js离线包常用参数说明
react-native bundle [参数]
Options:

    -h, --help                   输出如何使用的信息
    --entry-file <path>          RN入口文件的路径, 绝对路径或相对路径
    --platform [string]          ios 或 andorid
    --transformer [string]       Specify a custom transformer to be used
    --dev [boolean]              如果为false, 警告会不显示并且打出的包的大小会变小
    --prepack                    当通过时, 打包输出将使用Prepack格式化
    --bundle-output <string>     打包后的文件输出目录, 例: /tmp/groups.bundle
    --assets-dest [string]       打包时图片资源的存储路径
    --verbose                    显示打包过程
    --reset-cache                移除缓存文件
    --config [string]            命令行的配置文件路径

# bundle产物目录
├── index.jsbundle 	// 压缩的 JS 代码
└── assets 					// 资源文件

# 将bundle下文件拖到iOS项目添加引用

# 更改JS URL引用方式如：
  jsCodeLocation = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"index.jsbundle" ofType:nil]];

```

### 样例小程序

1、Mini_Demo_01（Ge89c3ed65bf141758aa240e30e9c67ec）

![](/Users/henvy/Desktop/henvy/rn_add_to_native/doc/Ge89c3ed65bf141758aa240e30e9c67ec.png)

2、Mini_Demo_02_TicTacToe（G604563f9155d463a8f405f09f7ac3dac）

![](/Users/henvy/Desktop/henvy/rn_add_to_native/doc/G604563f9155d463a8f405f09f7ac3dac.png)

3、Mini_Demo_03_HotUpdateDemo（G31f75ea1e3454e6b886ca6e4fe97971e）

![](/Users/henvy/Desktop/henvy/rn_add_to_native/doc/G31f75ea1e3454e6b886ca6e4fe97971e.png)