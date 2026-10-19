#!/usr/bin/env bash
# 安装本 skill 到技能目录。用法: ./install.sh [目标技能根目录](默认 ~/.zcode/skills)
set -euo pipefail
dest_root="${1:-$HOME/.zcode/skills}"
dest="$dest_root/yujun-product-methodology"
if [ -e "$dest" ] && [ "${FORCE:-0}" != "1" ]; then
  echo "错误: $dest 已存在;覆盖请用 FORCE=1" >&2; exit 1
fi
mkdir -p "$dest_root"; [ "${FORCE:-0}" = "1" ] && rm -rf "$dest"
cp -R "$(cd "$(dirname "$0")" && pwd)/." "$dest" && rm -rf "$dest/.git" "$dest/install.sh"
rm -f "$dest/BUILD_MANIFEST.json"   # 构建元数据不随安装分发
echo "已安装: $dest"
