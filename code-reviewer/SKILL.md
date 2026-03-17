---
name: code-reviewer
description: 審查 PR、diff、commit 或程式碼庫，聚焦需要人類判斷的高風險問題，例如需求與契約不一致、跨模組影響、資料與狀態演進、失敗與恢復、併發、安全、可觀測性，以及註解或命名與實作不一致；必要時搭配 typos 做拼字檢查。
---

# Code Reviewer

以中文回報，保留程式碼識別字、CLI 參數與必要術語原文。

## 審查方式

1. 從 diff、PR、commit 或指定檔案開始，先建立變更模型。
   釐清它改了什麼、為什麼改、碰到哪些邊界、可能影響哪些呼叫端、資料與執行路徑。大型專案中，只沿著受影響的資料流、呼叫鏈與系統邊界往外擴，不要平均掃描整個 repo。
2. 先看高風險面向，再看局部語意。
   高風險面向請讀 `references/review-checklist.md`。優先沿著資料流、呼叫鏈與系統邊界往外看，不要平均掃描所有細節。
3. 檢查註解與命名是否會誤導人。
   只回報會影響理解、修改、呼叫或維運判斷的語意落差。
4. 視需要執行 `typos`。
   讓 typo 成為輔助訊號，不要蓋過真正重要的問題。

預設忽略 generated、vendor、lockfile、格式化結果與其他可由工具穩定處理的雜訊，除非這次變更本身就在處理那些檔案或它們正是風險來源。

## 輸出格式

findings 一律用 Markdown 表格：

```md
| 級別 | 位置 | 面向 | 發現 | 建議 |
|---|---|---|---|---|
| 高 | src/order/service.ts:182 | 失敗路徑 | 付款失敗後仍更新訂單狀態，與函式名稱及註解描述不一致 | 拆分成功與失敗路徑，或延後狀態寫入 |
```

- `位置` 必須包含檔案與行數，格式優先用 `path/to/file:line`。
- `級別` 優先使用 `高`、`中`、`低`；證據不足但值得注意時使用 `風險`。
- 一列只放一個 root cause；同源問題合併，不要拆成一串細碎列。
- `發現` 直接寫「觀察到的行為 + 為何重要」。
- `建議` 只寫修正方向，不展開成教學文章。
- 依嚴重度與影響面排序；先放會破壞契約、資料正確性、恢復能力或維運判斷的問題。
- 若 findings 很多，只保留最重要的 root causes，其他同型問題在結尾做一句話彙總。
- 若沒有 findings，明確寫出未發現需回報事項，並附上審查範圍與殘餘風險。
- 不要輸出只有風格偏好、措辭偏好或工具已能穩定處理的意見。

typo 類問題量多時，改用附表：

```md
| 位置 | 原文 | 建議 |
|---|---|---|
| docs/api.md:48 | sucess | success |
```

## typos

`typos` 已隨 skill 內建於 `scripts/typos/`，包含可執行檔、README、授權檔與官方文件。

常用命令：

```powershell
scripts/typos/typos.exe path/to/target
scripts/typos/typos.exe --format brief path/to/target
scripts/typos/typos.exe --diff path/to/target
```

- 預設保持唯讀；除非使用者明確要求自動修正，否則不要使用 `--write-changes`。
- 專案若已有 `.typos.toml` 或既有設定，優先沿用。
- 重複 typo 要合併。
- 需要更多旗標時，再讀 `scripts/typos/README.md` 與 `scripts/typos/doc/reference.md`。
