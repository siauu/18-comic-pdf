# 18comic转pdf批处理

### 1. 前提

首先你需要安装 ImageMagic：

#### 1.1 什么是 ImageMagick？

ImageMagick 可以创建、编辑、合成或转换数字图像。它可以读取和写入各种格式（超过 200 种）的图像，包括 PNG、JPEG、GIF、WebP、HEIC、SVG、PDF、DPX、EXR 和 TIFF。ImageMagick 可以调整大小、翻转、镜像、旋转、扭曲、剪切和变换图像，调整图像颜色，应用各种特殊效果，或绘制文本、线条、多边形、椭圆和贝塞尔曲线。

ImageMagick 广泛应用于 Linux、Windows、Mac Os X、iOS、Android 等。例如 PHP 就内置了 ImageMagick 模块，你可以选择性的进行安装和使用。

#### 1.2 安装 ImageMagick

前往 [ImageMagick](http://www.imagemagick.org/) 官网下载自己合适的版本。例如对于 Windows 用户，你可以下载 *ImageMagick-7.x-Q16-x64-dll.exe*，这是一个动态链接库的 Windows 64 位版本，支持的像素是 16 位深度。使用 16 位深度在处理图片时比 8 位深度慢 15% 至 50%，占用的内存也为后者的 2 倍。

安装完成后，使用如下命令查看是否安装成功：

```shell
magick --version
```

### 2. 使用 18comic 下载器

使用基于 Github Actions 的 [18-comic-finder](https://github.com/jiayaoO3O/18-comic-finder)：

仓库：[https://github.com/jiayaoO3O/18-comic-finder](https://github.com/jiayaoO3O/18-comic-finder)

### 3. 使用批处理

批处理文件在本仓库的根目录下，名称为 `漫画生成PDF.bat`，使用方法如下：

1. 使用 **18comic 下载器**下载漫画；
2. 将下载的文件解压缩。你还可以重命名每一话文件夹的名称，这个名称对应之后生成 PDF 的名称。
3. 把 `漫画生成PDF.bat` 文件放在根目录（不是每一话漫画的目录）；
4. 双击执行 `漫画生成PDF.bat` 即可，会在根目录生成每一话的 PDF 文件。

### 4. 调整质量

你还可以使用 **-quality** 调整生成的 PDF 文件质量。**-quality** 参数可以调整的取值范围是 [0, 100]：

- 0 代表最低的图像质量（最高压缩率）
- 100 代表最佳质量（但最不有效的压缩）

你可以修改第 7 行的代码：

```shell
chcp 65001

@echo off

for /d %%i in (*) do (
    cd %%i
    magick convert -quality 100 "*.{jpg}" %~dp0\%%i.pdf
    cd..
)

pause
```