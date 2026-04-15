---
name: epub-translator-en-zhtw
description: >
  製作 EPUB 電子書中英對照版的完整工作流程。當使用者提到要在 EPUB/XHTML 檔案中加入中文翻譯、製作雙語電子書、
  為 epub 章節加中文對照、或修改中英對照 .xhtml 段落時，務必使用此 skill。適用場景包含：
  新增中文到現有 EPUB 章節、修改既有中文的風格。
  重要：凡涉及英文→繁體中文翻譯，必須同時啟用 translator-en-zhtw skill 負責翻譯品質。
---

# EPUB 中英對照版製作指引

## 初始化

`epub` 目錄是電子書解壓後的根目錄。若該目錄不存在，嘗試從根目錄找到 epub 原檔並解壓縮；找不到則回報錯誤並結束。

---

## 雙語段落結構

英文段落之後**緊接**一個中文段落。中文段落使用 `translated` class，並沿用英文段落的排版 class：

```html
<p class="indent">英文原文段落。</p>
<p class="translated indent">中文譯文段落。</p>
```

### 雙語樣式設定（首次執行時）

需加入以下 CSS 樣式：

```css
.translated {
  margin-top: .15em;
  margin-bottom: .65em;
  color: #0f3d2e;
  font-family: 'Microsoft JhengHei', 'Noto Sans CJK TC', 'PingFang TC', 'PMingLiU', sans-serif;
  line-height: 1.65;
}

.translated-missing {
  color: #9f1239;
}
```

**加入方式（依序判斷）：**

1. **有獨立 CSS 檔**：找 xhtml `<head>` 中 `<link rel="stylesheet">` 引用的 `.css` 檔，將上方樣式附加到該檔案末尾。若引用多個 CSS 檔，附加到最後一個。
2. **沒有外部 CSS 檔**：在 epub 目錄中找合適位置新建 `bilingual.css`（通常與其他 xhtml 同層，或放在 `Styles/` 若該目錄存在），再於每個相關 xhtml 的 `<head>` 末尾加入：
   ```html
   <link href="bilingual.css" rel="stylesheet" type="text/css" />
   ```
   （路徑依實際相對位置調整）

### 保留內文樣式

英文段落中的 `<strong>`、`<em>`、`<code>` 等樣式元素，在中文段落中要對應保留在對應詞彙上。即使中文結構和英文不同，樣式位置也要反映語意，而非對齊原文位置：

```html
<p class="indent">This is an <strong>important</strong> point.</p>
<p class="translated indent">這點很<strong>重要</strong>。</p>
```

---

## 跳過雙語的條件

以下內容**不加**中文對照：
- 非正文內容（目錄、版權頁等）
- 大小標題
- 圖表說明標題（若判定為句子而非標題則加）
- 表格內文字數不多且結構簡單時

其他情況由你根據書籍內容自主判定。

---

## 特殊元素：註腳

英文註腳的 `id` 和 `href` 屬性，中文版要加 `-tw` 後綴，讓兩組連結各自獨立運作：

```html
<!-- 英文 -->
<p class="footnote"><a id="ch02fn1" href="ch02.xhtml#ch02fn1a">1</a>.</p>
<sup><a id="ch02fn1a" href="ch02.xhtml#ch02fn1">1</a> This is Detail.</sup>

<!-- 中文 -->
<p class="translated footnote"><a id="ch02fn1-tw" href="ch02.xhtml#ch02fn1a-tw">1</a>.</p>
<sup><a id="ch02fn1a-tw" href="ch02.xhtml#ch02fn1-tw">1</a> 這是細節。</sup>
```

---

## 中文表達風格

翻譯品質（去翻譯腔、語態轉換、分句合句、四字格、術語策略等）由 **`translator-en-zhtw` skill** 全權負責，本 skill 不重複列出通用翻譯規則。

> **整章/整本翻譯時**：可請使用者啟用 `translator-en-zhtw` 的**多代理模式**（並行翻譯各段再由整合者統一全章術語/風格），對長章節的跨段一致性特別有效。整合者回傳的每段定稿，仍照本 skill 的雙語 HTML 結構與標點限制插入。

**EPUB 情境特有補充：**
- 技術詞彙、人名、專有縮寫直接保留英文，不強行音譯
- **標點符號限制：** 除非原文已使用，否則禁止使用冒號（`：`）、分號（`；`）、破折號（`——`）
- **禁止濫用書名號/引號：** 不得用 `「」` 框住子句或一般詞組；`「」` 僅限引述直接引語或強調特定術語時使用

---

## 工作流程

### 新增中文到章節

1. 讀英文段落，判斷是否需要跳過（見上方「跳過雙語的條件」）
2. 呼叫 **`translator-en-zhtw` skill** 執行翻譯（套用 EPUB 情境特有補充）
3. 插入緊接在英文段後，補上 HTML 結構與 class

### 修改現有中文

1. 逐段讀取中文段落，參照英文原文理解意思
2. 以 **`translator-en-zhtw` skill** 的診斷框架評估並重寫（套用 EPUB 情境特有補充）
3. 檢查 HTML 結構與 class 是否有誤並修正

### 輸出打包

將 `scripts/pack.bat` 複製到呼叫端工作目錄，執行後產出打包結果。

---

## 驗收

完成後逐項驗收，有問題則修改後再次驗收，直到全部通過：

1. **輸出驗收**：打包成功。
