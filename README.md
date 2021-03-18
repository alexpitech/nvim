# vimrc

---
## vim-plug

* 安装插件管理器 vim-plug，对于 Neovim，在 Linux 或 macOS 中执行：

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
<https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim>'
```

* 或在 Windows 中执行：

```
iwr -useb <https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim> |`
ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

---
## Reference

---
* [使用 Neovim 和 vimtex 高效撰写 LaTeX 学术论文](https://sspai.com/post/64080)
* [高效做笔记:vim + markdown](https://zhuanlan.zhihu.com/p/84773275)
* [Vim 8 中 C/C++ 符号索引：GTags 篇](https://zhuanlan.zhihu.com/p/36279445)
* [知乎Vim](https://www.zhihu.com/column/vimrc)
* [Vim有哪些曾经有名但是现在过时插件](https://www.zhihu.com/question/31934850)
* [neovim 下 defx 的安装与使用](https://learnku.com/articles/34885)

## 设置hosts

查询ip地址

* [github.global.ssl.fastly.net](https://fastly.net.ipaddress.com/github.global.ssl.fastly.net#ipinfo)
* [github.com](https://github.com.ipaddress.com/#ipinfo)

`C:\Windows\System32\drivers\etc\hosts` 添加

```
     199.232.69.194     github.global.ssl.fastly.net
       140.82.113.4     github.com
```
