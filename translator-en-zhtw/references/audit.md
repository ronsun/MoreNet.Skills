# 查核規程：第三遍「對照查核」的操作規格

進入本檔時，你的身分是**校訂者**，不是作者。工作是把譯文和原文逐句對照，抓出失真與不一致。兩條紀律：

1. **只查，不順手潤稿。** 風格問題（節奏平、用詞悶）記下來，回到語意重寫該句——那是作者的工作，用作者的腦袋做。
2. **發現失真，重寫，不打補丁。** 在字面上換一兩個詞去「修正」失真，會把英文骨架縫回譯文。正確動作永遠是：弄清這句真正的意思，整句重寫。

查核順序：語義 → claim strength → 術語與一致性 → 台灣用語 → 翻譯腔殘跡 → 誦讀終檢。

---

## 1. 語義忠實清單

逐句對照，每句問：

| 檢查 | 失真樣態 |
|---|---|
| 遺漏 | 原文的限定語、例外、副句在譯文消失（尤其第二遍合併句子時最容易掉） |
| 增添 | 譯文出現原文沒有的判斷、比喻、因果 |
| 主體錯置 | 動作主體張冠李戴（尤其原文被動句還原主動時） |
| 因果／條件 | 因果顛倒；條件句變成事實陳述（if → 直述）；反事實丟失虛擬性（would have／had... → 要譯出「當初⋯本可以⋯」「如果⋯就會⋯」）；充分／必要混淆 |
| 否定 | 否定範圍錯位；neg-raising 直搬（"I don't think X will work" 的語意是「我認為 X 行不通」，否定要放語意所在） |
| 數字／時間／單位 | 數值、日期、幣別、單位換算、倍數（double = 變成兩倍，不是增加兩倍） |
| 指代 | 代名詞在譯文中指向錯的先行詞 |
| 反諷與言外之意 | 原文的反諷、保留態度、弦外之音在譯文變成字面意思 |

**第二遍重寫幅度愈大，這一步愈重要。** 重寫的自由是用這一步的嚴格換來的。

---

## 2. Claim strength：hedge 一字不可動（學術與論證文本的鐵則）

`suggest X` 和 `prove X` 在學術上是兩個不同的主張。流暢永遠服從 claim strength——不得因為中文讀起來順而升格或降格。

### 看到就要對照的 hedge 詞

may, might, could, would（條件）; suggest, indicate, imply, appear, seem, tend, point to, be consistent with; partly, somewhat, arguably, apparently, seemingly, potentially, presumably; in some cases, under certain conditions, to some extent; preliminary, tentative, inconclusive, mixed; marginally, slightly, modestly, at trend level

### 禁止對位表（右欄視同錯譯，命中即重寫該句）

| 原文 hedge | 正確（保留弱） | 禁止（升格） |
|---|---|---|
| may / might | 可能、或許、不排除 | 會、將會、顯示、表明 |
| could（推測） | 可能、有機會 | 能夠、足以 |
| suggest / indicate | 顯示、指出、暗示 | 證明、確認、證實 |
| appear / seem | 似乎、看起來 | 確實是、顯然是、就是 |
| tend to | 傾向、往往 | 必然、一定、總是 |
| arguably | 可以說、某種程度上 | 毫無疑問、顯然 |
| partly / partially | 部分 | 完全、整體上 |
| somewhat / slightly | 稍微、略微 | 大幅、顯著 |
| potentially | 可能、潛在 | 必定、勢必 |
| apparently / ostensibly | 表面上、看似 | 實際上、確實 |
| at trend level | 趨勢上、未達顯著 | 顯著、具統計意義 |
| is consistent with | 與⋯一致、不矛盾 | 證實、證明 |

反向（降格）同樣是錯譯：demonstrate／establish 不得弱化成「暗示」「似乎」。

### 義務與許可的語氣映射

| 英文 | 台灣中文 | 語境 |
|---|---|---|
| must / shall | 必須、應、須 | 法規、合約、規範 |
| should / is expected to | 應、宜、建議 | 最佳實踐、指引 |
| is recommended | 建議、宜 | 選用性指引 |
| may / can / is permitted to | 可、得 | 權限、選項 |
| might / could | 或許、可能、不排除 | 推測、風險 |
| is unlikely to | 不太可能、機率不高 | 風險評估 |

例：*This should not be deployed in production.* → 「不宜部署至正式環境」（不是「不應該被部署」）。

---

## 3. 術語與全篇一致性

| 條件 | 處理 |
|---|---|
| 台灣業界有通行譯名 | 用通行譯名（machine learning → 機器學習） |
| 縮寫在台灣已通用 | 保留縮寫，首次出現附中文全名：API（應用程式介面） |
| 產品名／商標 | 保留英文：Kubernetes、Docker、Slack |
| 無通行譯名的新術語 | 中文說明＋原文括註：檢索增強生成（RAG），並記入術語表 |
| 一般概念 | 用中文：authentication → 驗證 |

一致性檢查：同一術語、人名、稱謂、組織名，全篇同一譯法；語氣層級（你／您、敬語等級）全篇一致；首次出現「中文譯名（English）」、之後只用中文譯名。**同篇混用不同譯名比全部保留英文更糟。**

---

## 4. 台灣用語

- **兩岸分歧詞一律用台灣形式**：軟體（軟件）、資料庫（數據庫）、伺服器（服務器）、資訊（信息）、行動（移動）、程式（程序）、介面（界面）、最佳化（優化，濫用時）、預設（默認）、登入（登錄）、品質（質量）、影片（視頻）、網路（網絡）。
- 「現在這個時候」用**目前／現階段**；「當前」帶大陸公文腔，避用。
- 正式文件避用「蠻／還蠻／超」。
- **量詞**：萬用「個」是翻譯腔的招牌。常用對照——項（建議、議題）、份（報告、合約、提案）、套（系統、流程）、款（產品、App）、場（會議、活動）、則（新聞、案例）、筆（訂單、款項）、部／台（主機、設備）、篇（論文、文章）、樁／起（訴訟、意外）。

---

## 5. 翻譯腔殘跡快掃

第二遍寫得好，這張表理應全部落空；命中任何一項 → 這句沒寫完，回到語意重寫（不是就地改字）。

| 症狀 | 看到就警覺 |
|---|---|
| idiom 字面直譯 | 移動球門柱、球在你的場地、房間裡的大象（若中文語境讀不懂） |
| 虛主詞架子 | 應該被注意的是、顯而易見的是、它值得一提的是 |
| 被動僵硬 | 被完成、被核准並將被實施（中文被動用「獲／受／經」或還原主動） |
| 「的」字連環 | 一個具有高度可擴展性的基於雲端的系統 |
| 空殼動詞／名詞化 | 進行調查、作出決定、效能的提升 |
| 代名詞鏈 | 使用者忘記他的密碼，他可以重設它 |
| 連接詞點名 | 首先…然後…此外…因此…（邏輯能靠語序浮現就不用接詞） |
| 尾重未重排 | 「我們決定採用 X，基於 Y 與 Z 的考量」 |
| 體標記重複 | 已被完成並已被提交（一個「已」管到底） |
| 句句等長同構 | 連續多句「主語＋動詞＋賓語。」——英文句界的化石 |
| 1:1 句對齊 | 中文句數＝英文句數且斷點全同——第二遍根本沒重寫 |
| 「作為」開頭 | 作為一名工程師，我…（台灣人不這樣說話） |
| 翻譯腔感嘆 | 哦，天哪；我的老天；好吧（"well" 的直譯） |

### 字面陷阱字庫（原文命中這些詞 → 檢查譯文是否誤直譯）

- **體育比喻**：home run, slam dunk, Monday morning quarterback, moving the goalposts, step up to the plate, ballpark figure, out of left field, kick the can down the road, hit it out of the park
- **政治／制度詞**（多需「中文描述（English）」）：filibuster, pork barrel, gerrymandering, tenure-track, Ivy League, blue-chip, glass ceiling, revolving door, lame duck
- **程度比喻**：on steroids, nuclear option, drinking the Kool-Aid, drinking from a firehose, boiling the ocean
- **商業俚語**：pivot, synergy, bandwidth（比喻用法）, circle back, low-hanging fruit, move the needle, touch base
- **常見 idiom**：bite the bullet, break the ice, the elephant in the room, dead in the water, go back to the drawing board, miss the boat, the ball is in your court, hit the ground running, read between the lines, cut corners, rock the boat, at the end of the day

---

## 6. 歧義與原文錯誤

1. **先分辨是不是語言差異**：英文結構在英文裡意思明確、只是中文沒有對應 → 中文直接寫明（代名詞歧義依上下文寫出具體人名／職稱）。
2. **真歧義**：能問作者就問；不能問則取最合理解讀，加譯註「原文此處可能指⋯」。
3. **原文有誤**：照實翻，不代作者修正；加譯註標示。多代理流程中，疑點記入筆記交上游定奪，不要自己亂補。

---

## 7. 誦讀終檢（最後一關）

蓋上原文，只讀中文，用台灣讀者的耳朵：

- 有沒有哪句「隔著中文看見英文」——讀著讀著能反推出原文句型？
- 有沒有哪句要回頭讀第二次才懂？
- 段落節奏是不是平的（見 craft.md §3）？
- 對話唸出來像不像台灣人講話？

任何一項不過 → 回到語意重寫該句。全部通過，這個單位才算完成。
