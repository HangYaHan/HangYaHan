常用的宏
PROJECT_SOURCE_DIR
CMAKE_CURRENT_SOURCE_DIR

指定头文件目录，注意是指定目录，而不是指定具体的文件
include_directories
适用于源文件和头文件分开的情况


制作静态库、动态库
add_library
SHARED STATIC
动态库也叫共享库所以关键词是shared
动态库是有执行权限的，也因此它是绿色的字体
库发布给使用者需要两部分文件，头文件和库文件
库文件本质上和cpp文件上是类似的，前者是加密的二进制形式，而后者是文本格式，也因此需要头文件

链接静态库link_library, 可以是全名也可以掐头去尾
系统库可以直接链接，自己写的库需要手动链接
指定链接目录link_directories，注意有s说明可以指定很多个目录（也可以指定动态库的目录）
自定义的库一定要指定目录！！！