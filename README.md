# EduSkillBench paper

论文协作仓库，初始版本为 V4.1（2026-10-13，已修正框架图分叉箭头）。正文 8 页，含参考文献及附录的当前 PDF 共 20 页。主文件为根目录的 `main.tex`。

当前正式协作仓库是公开仓库 [`kleeeeea/eduskillbench-paper1`](https://github.com/kleeeeea/eduskillbench-paper1)，协作分支为 `main`，已与老师的 Overleaf 项目绑定。原个人仓库 `Chansl-Lucky/EduSkillBench-paper` 仅保留为导入来源和备份，两个 GitHub 仓库不会自动同步；后续改稿以本仓库为准。

这是未定稿的论文协作版本，不是实验数据发布仓库。Qwen 最新汇总结果仍有逐题档案待核项，论文中的相应说明保留。源码导入与编译检查不代表独立复核或重跑了论文实验。

## 内容

```text
main.tex                 # 主文件，控制章节顺序
references.bib           # 参考文献
sections/                # 正文与附录
tables/                  # 论文实际引用的表格行
figures/                 # 四张预生成的矢量 PDF 图
acl.sty, acl_natbib.bst   # 原样保留的 ACL 模板文件
preview/main.pdf         # 最近一次人工确认的 PDF 快照
INITIAL_IMPORT.json      # 初始导入文件哈希与正文页码
AGENTS.md                # Codex 等协作代理的改稿约定
```

38 个编译依赖从已有论文原样导入。没有模型权重、实验日志、原始答卷、API key、服务器凭据或无关项目。四张 PDF 图已预生成，本仓库不含制图源代码。初始导入清单记录的是起点，不要求后续协作修改保持旧哈希。

## 在 Overleaf 中使用

1. 打开老师已经绑定本仓库的 Overleaf 项目。
2. 在项目 **Integrations → GitHub** 中手动 **Pull**，获取 GitHub 上刚推送的改稿。
3. 主文件选择 `main.tex`，编译器选择 **XeLaTeX**。导入验收使用 Tectonic（XeTeX 路径）；本地 TeX Live 的推荐命令使用 XeLaTeX。
4. 编译后检查正文是否仍在 8 页内。不同 TeX Live 版本可能影响分页。初始 V4.1 的正文为 8 页、总 PDF 为 20 页；`preview/main.pdf` 只是快照，不会随 `.tex` 自动更新。

使用现有绑定项目即可。GitHub 与 Overleaf 通过手动 Pull / Push 同步，刷新页面不会自动拉取修改。[Overleaf 官方说明](https://docs.overleaf.com/integrations-and-add-ons/git-integration-and-github-synchronization/github-synchronization)

## 日常协作顺序

首次在本地或其他 Codex 会话中改稿，克隆当前协作仓库并阅读 `AGENTS.md`：

```sh
git clone https://github.com/kleeeeea/eduskillbench-paper1.git
cd eduskillbench-paper1
```

**老师先在 Overleaf 修改时：**先用 Overleaf 的 GitHub 集成 **Push**，再在本地更新 `main`。开始任何改稿前都先检查本地状态与远端更新；若有未提交修改，先保留并处理，不要直接覆盖：

```sh
git status
git fetch origin
git pull --ff-only origin main
```

**本地改稿后：**先编译和检查差异，只暂存这次明确修改的文件，再提交、推送；随后在 Overleaf 的 GitHub 集成里 Pull。

```sh
git diff
git add sections/introduction.tex
git commit -m "Clarify the introduction"
git push origin main
```

不要强制推送或重置来覆盖老师或其他协作者的修改。遇到分叉或冲突先保留双方修改再协调合并。多个 Codex 会话并行时，先约定各自负责的文件；需要独立改稿时使用独立分支和工作目录。老师集中批注或开 Track Changes 时，先约定同步时点；跨 GitHub 拉取可能影响评论与修订标记的位置。[同步注意事项](https://docs.overleaf.com/integrations-and-add-ons/git-integration-and-github-synchronization/github-synchronization)

## 本地编译

有 TeX Live 和 `latexmk` 时：

```sh
make pdf
```

`make pdf` 使用 XeLaTeX。生成的工作 PDF 是根目录 `main.pdf`（不进入 Git）；确认正文仍在 8 页内且图表、引用正常后，可用 `make preview` 更新需要提交的预览快照。四张图直接使用 PDF，无须 Python、额外模型或 shell escape。

模板来自 [ACL 官方样式仓库](https://github.com/acl-org/acl-style-files)。保留模板原有版权和许可声明；本仓库未修改 ACL 字号、边距及样式文件。
