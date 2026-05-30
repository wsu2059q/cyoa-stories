# CYOA Stories

ErisPulse-CYOA 互动小说合集。

## 目录

```
cyoa-stories/
├── index.json              # 仓库索引
├── source/                 # 源码 -> 作者提交 .ink 文件
│   └── <故事ID>/
│       └── story.ink
├── stories/                # 编译产物 -> CI 自动生成 .ink.json
│   └── <故事ID>/
│       └── story.ink.json
└── .github/workflows/      # GitHub Actions 自动编译
```

## 贡献故事

1. Fork 本仓库
2. 在 `source/` 下新建目录，目录名即故事 ID
3. 放入 `story.ink` 文件
4. 编辑 `index.json`，在 `stories` 数组添加你的故事信息
5. 提交 PR

CI 会自动编译 `.ink` → `.ink.json` 到 `stories/` 目录。

## 使用

在 ErisPulse 中：

```
/cyoa repo add official https://raw.githubusercontent.com/wsu2059q/cyoa-stories/main
/cyoa repo update
/cyoa play xpcheck
```

或直接导入编译产物：

```
/cyoa import https://raw.githubusercontent.com/wsu2059q/cyoa-stories/main/stories/xpcheck/story.ink.json
```
