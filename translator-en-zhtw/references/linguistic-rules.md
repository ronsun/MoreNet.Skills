# 英→台灣繁體中文：語言規則手冊

本文是 `translator-en-zhtw` skill 的語言操作規格。對照範例的「自然中文」欄一律使用台灣繁體中文。

**衝突優先序**：語義忠實 > claim strength 忠實 > 術語一致 > 文化／語用適切 > 流暢度

**規則的性質**：以下規則是 heuristic，不是 law。多數中文現象都有兩三種自然說法，差別在焦點、節奏、語體。看到譯文命中某條規則的「翻譯腔範例」不代表必須改——先判斷新版是否真的更自然，**機械套用比保留原譯更糟**。最終判準永遠是「讀起來像不像台灣人自己寫的」。

## 目錄

| § | 主題 | 何時用 |
|---|---|---|
| 1 | 拆解長句 | 多層嵌套從句 |
| 2 | 刪除冗餘代詞與連接詞 | 代詞過量、連接詞密集 |
| 3 | 歐化中文症狀 | 的字連環、被動、空泛動詞、虛主詞、副詞位置、名詞化 |
| 4 | 調整語序 | 尾重→頭重；條件結果句的例外 |
| 5 | Idiom、諺語、非字面表達 | 文化比喻、片語動詞、委婉、反諷 |
| 6 | 四字格與韻律 | 概括性書面描述 |
| 7 | 英中典型結構差異 | 否定提升、話題優先、前置定語、時態與體標記 |
| 8 | 體裁適配 | 確認目標文體時 |
| 9 | 台灣用語 | 全程 |
| 10 | 術語與固有名詞 | 術語首次出現時 |
| 11 | 語氣映射 | must/should/may 等強制詞 |
| 12 | 學術 hedge 保留 | 學術文本 hedge 詞 |
| 13 | 歧義原文處理 | 原文有歧義或錯誤 |
| 14 | 實戰案例 | 高難度長句、商務、idiom 密集文本 |
| 15 | 自檢快查表 | 譯文寫完後最後一輪掃描 |

---

## 1. 拆解長句

英文長句靠從句嵌套承載多層資訊；中文不擅長嵌套，需拆成 2–4 個短句，靠語序傳達邏輯，不必每段都加連接詞。

按以下四步處理：

**步驟 A：辨識主幹**

找出句子核心 SVO（主語＋動詞＋受詞）。有多組 SVO（用 and / but / ; 連接）→ 每組都是一個主幹。

**步驟 B：抽離修飾成分並分類**

| 修飾類型 | 中文角色 |
|---|---|
| relative clause（which/that/who） | 獨立短句：補充說明主體 |
| participial phrase（-ing/-ed） | 獨立短句：說明動作或狀態 |
| purpose（in order to / to + V） | 前移為背景句 |
| result（thereby / thus / leading to） | 後置為結果句 |
| temporal（while / when / after） | 前移為時間框架 |

**步驟 C：決定資訊順序**

中文常見排序：背景→動作→結果；原因→判斷／決定；整體→局部→補充。

**步驟 D：決定切點**

一個中文短句承載一個訊息單元，約 15–25 字。修飾成分本身是完整事件 → 切成獨立句；只是個形容詞 → 留在句內；邏輯關係不明顯 → 切出來，用語序暗示關係。

| 自然英文 | 翻譯腔中文 | 自然中文 |
|---|---|---|
| The framework, which was originally designed for small-scale applications but has since been adapted to support enterprise-level deployments, requires careful configuration. | 該框架，它最初是為小規模應用程式所設計的但後來已經被調整以支援企業級部署，需要仔細的配置。 | 這套框架最初是為小型應用設計的，後來才擴展到企業級部署，因此在配置上需要特別留意。 |
| Although the initial results were promising, the team decided to postpone the launch because several critical issues that had been identified during testing still needed to be resolved. | 雖然初始結果是有希望的，但團隊決定推遲發佈，因為在測試期間被識別出的幾個關鍵問題仍然需要被解決。 | 初步結果雖然不錯，但測試階段發現了幾個關鍵問題尚未解決，因此團隊決定延後上線。 |

---

## 2. 刪除冗餘代詞與連接詞

中文不強制每句明示主語；上下文清楚時，反覆出現代詞反而生硬。中文邏輯關係多從語序浮現，硬加連接詞像在點名。

**規則**

- **代詞**：第一次點明主體，之後省略
- **連接詞**：只在邏輯轉折不明顯時才用
- **成對連接詞**（因為……所以……、雖然……但是……）：通常只保留後半
- **連接詞位置**：「因此／所以／於是」放主語之前（「**因此**團隊決定延後」）或主語之後（「團隊**因此**決定延後」）在台灣書面語都常見，看節奏取捨；只有當主語+連接詞+動詞讓句子拗口時才改

| 自然英文 | 翻譯腔中文 | 自然中文 |
|---|---|---|
| The manager reviewed the report. She found several inconsistencies. She then scheduled a meeting to discuss them with her team. | 經理審閱了報告。她發現了幾個不一致之處。她然後安排了一個會議來和她的團隊討論它們。 | 經理審閱報告後發現幾處不一致，隨即召集團隊開會討論。 |
| Furthermore, the system supports real-time monitoring. In addition, it provides automated alerts. Moreover, users can customize their dashboards. | 此外，系統支援即時監控。另外，它提供自動化警報。而且，使用者可以自訂他們的儀表板。 | 系統支援即時監控和自動警報，使用者也可以自訂儀表板。 |

---

## 3. 歐化中文症狀

歐化中文是英文語法結構滲透到中文寫作的產物。以下六種症狀涵蓋絕大部分病灶。

### A.「的」字連環

**策略**：拆成短句；用動詞取代名詞化的定語；調整語序減少「的」堆疊。

| 翻譯腔 | 自然中文 |
|---|---|
| 一個具有高度可擴展性的基於雲端的分散式的系統 | 一套可高度擴展的雲端分散式系統 |

### B. 被動濫用

中文的「被」字在傳統用法中帶有不幸／遭受色彩（被騙、被打），不宜當通用被動標記。

**策略**：
1. 還原主動語態
2. 用「獲／受／經／為……所」等更自然的被動標記取代「被」
3. 善用處置式「把／將」：「N 被 V」→「將 N V」（例：「測試被自動化了」→「將測試自動化」）

| 翻譯腔 | 自然中文 |
|---|---|
| 該方案已被核准並將被實施。 | 方案已獲核准，即將實施。 |
| 新功能被設計用來提升使用體驗。 | 新功能旨在提升使用體驗。 |
| 這個錯誤本來可以被更早發現。 | 本來可以更早發現這個錯誤。 |

### C. 空泛動詞

**策略**：去掉「進行／作出／給予」等空殼，直接用實質動詞。

| 翻譯腔 | 自然中文 |
|---|---|
| 進行一次全面的調查 | 全面調查 |
| 作出最終的決定 | 拍板定案／做出最終決定 |
| 對此事給予高度的關注 | 高度關注此事 |

### D. 虛主詞框架

英文用 `it is ... that`／`it should be noted that`／`it is worth mentioning that` 等虛主詞撐起評論框架。中文不需要這個架子。

**策略**：移除虛主詞架子；把評論詞改作副詞或語氣詞融入主句。

| 翻譯腔 | 自然中文 |
|---|---|
| 應該被注意的是，這項決定將影響全公司。 | 這項決定影響全公司，必須留意。 |
| 顯而易見的是，這項計畫無法如期完成。 | 這項計畫顯然無法如期完成。 |
| 不可否認的是，目前的進度落後預期。 | 目前進度確實落後預期。 |

### E. 名詞化傾向

英文偏好把動詞變名詞（improve → improvement, implement → implementation）。中文是動詞導向語言，名詞化堆疊會讓句子又長又悶。

**策略**：把名詞還原為動詞。

| 翻譯腔 | 自然中文 |
|---|---|
| 對系統的改進將帶來效能的提升。 | 改進系統可以提升效能。 |

---

## 4. 調整語序

**頭重原則（一般情況）**：英文尾重（主幹在前、修飾在後），中文頭重（背景／條件／時間在前、動作結果在後）。

| 自然英文 | 翻譯腔中文 | 自然中文 |
|---|---|---|
| The project was ultimately canceled due to budget constraints, regulatory changes, and a shift in strategic priorities. | 專案最終被取消了，由於預算限制、法規變更和戰略優先事項的轉移。 | 受到預算縮減、法規變動和策略方向調整的多重影響，這項專案最終決定中止。 |

---

## 5. Idiom、諺語、非字面表達

**核心原則**：先解碼出實際意涵，再用中文自然地重新表達——不要逐詞直譯。

| 類別 | 做法 | 範例 |
|---|---|---|
| Idiom | 找中文等價說法或用平實中文 | bite the bullet → 硬著頭皮做 |
| Proverb | 有對應諺語就用；無則平實重述 | The early bird catches the worm → 早起的鳥兒有蟲吃 |
| Phrasal verb | 整體理解，不能拆字翻 | bring up a point → 提出觀點（不是「帶上來」） |
| 文化比喻 | 提取功能，不保留文化意象 | hit a home run → 大獲成功；Monday morning quarterback → 事後諸葛 |
| 委婉語 | 用對等中文委婉語 | passed away → 過世；between jobs → 待業中 |
| 幽默／反諷／雙關 | **交際功能優先於形式**；保不住時加譯註，不為押韻犧牲訊息 | "Oh, great, another meeting." → 「哦，太好了，又開會。」 |

| 自然英文 | 直譯（錯） | 自然中文 |
|---|---|---|
| We need to break the ice with the new client before diving into negotiations. | 我們需要跟新客戶打破冰，然後再潛入談判。 | 正式談判之前，得先跟新客戶拉近關係、暖暖場。 |
| The regulator keeps moving the goalposts. | 主管機關一直在移動球門柱。 | 主管機關一直在改變評判標準。 |
| The product launch was a slam dunk — exceeded all targets. | 產品發佈是一個灌籃——超過了所有目標。 | 這次產品上線大獲成功，所有指標全數超標。 |
| This policy is grade inflation on steroids. | 這項政策是打了類固醇的成績膨脹。 | 這項政策把成績膨脹推到更誇張的程度。 |

### 常見字面誤譯字庫（看到就要警覺）

**體育比喻**：home run, slam dunk, touchdown, Monday morning quarterback, moving the goalposts, step up to the plate, ballpark figure, out of left field, kick the can down the road, hit it out of the park

**政治／法律制度詞**（多需「中文描述（English）」格式）：filibuster, pork barrel, gerrymandering, tenure-track, Ivy League, blue-chip, glass ceiling, revolving door, lame duck

**程度比喻**：on steroids, nuclear option, drinking the Kool-Aid, drinking from a firehose, boiling the ocean

**商業／科技俚語**：disruptive, pivot, synergy, bandwidth (metaphorical), circle back, low-hanging fruit, move the needle

**常見 idiom**：bite the bullet, break the ice, the elephant in the room, dead in the water, go back to the drawing board, think outside the box, miss the boat, the ball is in your court, under the weather, hit the ground running, burn bridges, read between the lines, cut corners, rock the boat, jump on the bandwagon, at the end of the day, touch base

---

## 6. 四字格與韻律

四字格適合概括性描述（態度、趨勢），不適合精確技術細節。**寧可不用，也不要為了好聽偏離原意**。一個段落最多兩三處，否則公文體嫌疑。

| 自然英文 | 翻譯腔中文 | 自然中文 |
|---|---|---|
| This is an extremely important issue that requires immediate attention. | 這是一個極其重要的需要立即關注的問題。 | 此問題至關重要，刻不容緩。 |
| The continuous improvement of operational efficiency and the optimization of resource allocation are key objectives. | 運營效率的持續改進和資源分配的優化是關鍵目標。 | 持續提升營運效率、優化資源配置，是目前的核心目標。 |

---

## 7. 英中典型結構差異（語言類型學基礎）

### 7.1 否定提升（Neg-raising）

英文認知動詞（think/believe/suppose/expect）後接從句時，否定詞語法上放主句，語義在從句。中文沒這個語用慣例：否定詞必須出現在語義所在位置。

| 英文 | 翻譯腔（否定錯位） | 自然中文 |
|---|---|---|
| I don't think this approach will scale. | 我不認為這個方法可以擴展規模。 | 我認為這個做法不能規模化。 |
| I don't believe the data supports that claim. | 我不相信資料支持那個說法。 | 我認為現有資料不支持這個說法。 |
| I don't expect the migration to take long. | 我不預期遷移會花很長時間。 | 我估計這次遷移不會太久。 |

### 7.2 話題優先 vs. 主語優先

中文是話題優先（topic-prominent）語言：句子起點可以是「最值得關注的資訊」（話題），不一定是文法主語。

| 英文 | 翻譯腔 | 自然中文 |
|---|---|---|
| Security considerations are central to the design. | 安全考量是設計的核心。 | 這套設計，安全是核心考量。 |
| Budget and timeline are the two main constraints. | 預算和時程是兩個主要限制。 | 預算和時程，是這次最主要的限制。 |

### 7.3 前置定語 vs. 後置修飾

中文修飾語**全部前置**於被修飾名詞。解法：化定語為動詞，或拆成獨立短句。

| 英文 | 翻譯腔 | 自然中文 |
|---|---|---|
| A solution designed to handle high-concurrency workloads in distributed environments | 一個被設計用來處理在分散式環境中的高並發工作負載的解決方案 | 專為分散式環境中的高並發場景設計的解決方案 |

### 7.4 時態標示 vs. 時間副詞 + 體標記

英文用語法時態強制標示時間；中文沒有語法時態，靠時間副詞和體標記（了／過／著／已）傳達。

| 情況 | 處理 |
|---|---|
| 時間副詞已明確 | 省略體標記 |
| 動作已完成、無明確時間 | 加「已」或動詞後加「了」 |
| 完成進行時 has been doing | 「一直在／持續／至今已」 |
| 反事實條件 would have / had... | 「如果⋯就會⋯／當初⋯本可以⋯」 |
| **並列動作（A and B 都完成）** | **共享一個體標記**：一個「已」涵蓋多個動詞，不必逐項重複 |

| 英文／翻譯腔 | 翻譯腔問題 | 自然中文 |
|---|---|---|
| The system has been running stable for six months. | 系統已經一直在穩定運行六個月了。 | 系統已經穩定運行六個月。 |
| The team would have caught the bug earlier if tests had been automated. | 如果測試已經被自動化了，團隊將會更早地抓到這個錯誤。 | 如果早就將測試自動化，本來可以更早發現這個錯誤。 |
| 該報告已被完成並已被提交。 | 體標記重複（兩個「已被」） | 報告已完成並呈送。 |

---

## 8. 體裁適配

翻譯前確認目標體裁，再選對應策略：

| 英文文體 | 中文體裁 | 語感要點 |
|---|---|---|
| Technical documentation | 技術文件 | 精確、簡潔、動詞為本、避免文學修辭 |
| Academic paper | 學術論文 | 客觀、保留 hedge、「筆者」「本文」等慣用語 |
| Business correspondence | 商務信函 | 用語正式、層次分明、訊息明確 |
| Policy report / white paper | 政策報告 | 數據佐證、論述嚴密、適度公文用語 |
| News article | 新聞文章 | 精簡、具體、時間資訊前置、無文學語氣 |

---

## 9. 台灣用語

全程使用台灣慣用詞彙。兩岸分歧時（軟體／軟件、資料庫／數據庫、伺服器／服務器、資訊／信息、行動／移動）一律用台灣形式。

**語法習慣**：少用「進行／作出」等空泛動詞；口語「蠻／還蠻」是常見程度副詞，正式文件避用。

**時間／指示詞**：表「現在這個時候」用「**目前**／現階段／現在」；「當前」帶大陸政治語體味，台灣自然文體避用。

**量詞**：直譯時容易一律用「個」，立刻露出翻譯腔。寫成「一個 X」覺得彆扭時就換量詞：

| 名詞類型 | 量詞 | 範例 |
|---|---|---|
| 條目、議題 | 項、則 | 三項建議、兩則新聞 |
| 文件、報告、合約 | 份 | 一份報告、兩份合約 |
| 軟體、產品、工具 | 套、款 | 一套系統、這款 App |
| 規則、標準、流程 | 組、套 | 一組規則、一套流程 |
| 機器、設備 | 部、台 | 一部主機、兩台伺服器 |
| 活動、會議、賽事 | 場 | 一場會議、兩場活動 |
| 案件、事件、事故 | 樁、起 | 一樁訴訟、兩起意外 |
| 交易、款項、訂單 | 筆 | 一筆訂單、三筆款項 |
| 故事、案例、研究 | 篇、則、項 | 一篇論文、一則案例 |
| 計畫、方案、提案 | 項、套、份 | 一項計畫、一份提案 |

---

## 10. 術語與固有名詞

| 條件 | 處理 | 範例 |
|---|---|---|
| 台灣業界有通行譯名 | 用台灣譯名 | machine learning → 機器學習 |
| 縮寫在台灣已通用 | 保留縮寫，首次出現附中文全名 | API（應用程式介面） |
| 產品名／商標 | 保留英文原文 | Kubernetes、Docker、Slack |
| 無通行譯名的新術語 | 保留英文＋括號中文說明 | RAG（檢索增強生成） |
| 一般概念有中文對應 | 用中文 | authentication → 驗證 |

**一致性**：首次出現定調後全篇統一；不同中文翻譯混搭比全英文更糟。

---

## 11. 語氣映射

| 英文 | 強度 | 台灣中文 | 使用語境 |
|---|---|---|---|
| must / shall | 強制義務 | 必須、應、須 | 法規、合約、技術規範 |
| is required to / is obligated to | 正式強制 | 須、應、有義務 | 政策、規章 |
| should / is expected to | 強烈建議 | 應、宜、建議 | 最佳實踐、操作指引 |
| is recommended | 一般建議 | 建議、宜 | 選用性指引 |
| may / can / is permitted to | 允許 | 可、得、得以 | 權限、選項 |
| might / could | 不確定可能 | 或許、可能、不排除 | 風險、推測 |
| is unlikely to | 低可能 | 不太可能、機率不高 | 風險評估 |

**失準範例**

| 英文 | 翻譯腔 | 修正 | 為何 |
|---|---|---|---|
| This should not be deployed in production. | 這不應該被部署到生產環境。 | 不宜部署至正式環境。 | should → 不宜（保留強烈建議的強度，避免「不應該被」歐化被動） |

---

## 12. 學術 hedge 保留

**鐵則**：學術文本的核心倫理是準確表達 claim strength（主張強度）。`suggest X` 與 `prove X` 在學術上意義完全不同。**流暢性永遠服從於 claim strength 的忠實**——不得因流暢而升格或降格 hedge。

| 英文 | 升格（錯） | 保留 hedge（對） |
|---|---|---|
| The results may partly reflect sampling bias. | 結果顯示抽樣偏誤的影響。 | 研究結果可能部分反映抽樣偏誤（sampling bias）。 |
| Our findings suggest that early intervention is beneficial. | 研究發現早期介入有益。 | 研究結果指出早期介入可能有益。 |
| This approach arguably improves outcomes. | 這種方法改善了結果。 | 這種方法在某種程度上可能有助於改善結果。 |

### Hedge 詞表（看到就警覺）

| 類別 | 詞 |
|---|---|
| 可能性 | may, might, could, would (conditional) |
| 弱主張動詞 | suggest, indicate, imply, appear, seem, tend, point to, be consistent with, be compatible with |
| 限定副詞 | partly, partially, somewhat, arguably, ostensibly, apparently, seemingly, potentially, presumably, possibly |
| 限定短語 | in some cases, under certain conditions, to some extent, to a degree, in a limited sense |
| 程度限定 | preliminary, tentative, exploratory, limited, inconclusive, mixed (evidence) |
| 顯著性限定 | marginally, slightly, modestly, weakly, at trend level |

### Hedge 升格禁止對位表

**禁止欄的譯法在學術文本中視同錯譯，發現就重翻該句。**

| 原文 hedge | 正確（保留弱） | 禁止（升格） |
|---|---|---|
| may / might | 可能、或許、不排除 | 會、將會、顯示、表明 |
| could（推測） | 可能、有機會 | 能夠、足以 |
| suggest / indicate | 顯示、指出、暗示 | 證明、確認、證實 |
| imply | 暗示、隱含 | 表明、證實 |
| appear / seem | 似乎、看起來、看似 | 確實是、顯然是、就是 |
| tend to | 傾向於、往往 | 必然、一定、總是 |
| arguably | 可以說、在某種程度上 | 毫無疑問、顯然、無可爭議 |
| partly / partially | 部分、部分地 | 完全、整體上 |
| somewhat | 在一定程度上、稍微 | 大幅、顯著 |
| potentially | 可能、潛在 | 必定、勢必 |
| apparently / ostensibly | 表面上、看似 | 實際上、確實 |
| presumably | 推測、據推測 | 確認、肯定 |
| marginally / slightly | 略微、稍微 | 大幅、顯著 |
| at trend level | 趨勢上、未達顯著 | 顯著、具統計意義 |
| is consistent with | 與⋯一致、不矛盾 | 證實⋯、證明⋯ |
| is compatible with | 與⋯相容、不衝突 | 等同於⋯、就是⋯ |

---

## 13. 歧義原文處理

判斷流程：

1. **先確認是不是語言差異**：英文有些結構在英文裡其實意思清楚，只是中文沒有對應結構——中文補上明確指代即可
2. **真正的歧義**：能向作者確認就先問；無法確認則選最合理解讀，加譯註標示「原文此處可能指⋯」
3. **原文有錯**：照實翻，不要在中文裡自行修正；用譯註標示問題所在

| 原文 | 問題 | 處理 |
|---|---|---|
| The manager told the engineer that he needed to update his report. | "he/his" 可指經理或工程師 | 依上下文判斷，中文寫出具體人名／職稱 |
| Ensure the system can handle up to 10000 concurrent users per second. | 「每秒 10000 名同時在線使用者」技術上不精確 | 照翻，加註「原文用語如此」 |

---

## 14. 實戰案例

### 案例 A：技術文件（多層從句＋被動＋術語）

> "The authentication module, which was initially implemented using a session-based approach that relied on server-side storage, has been refactored to leverage JSON Web Tokens (JWTs), which are self-contained tokens that can be verified without querying the database, thereby significantly reducing latency for API calls that require user validation."

→ 認證模組原本採用 session-based 做法，需要在伺服器端儲存狀態。重構後改用 JWT（JSON Web Token），由於 JWT 本身就夾帶驗證資訊，不必額外查詢資料庫，因此大幅降低了需要驗證使用者身分的 API 呼叫延遲。

**關鍵操作**：拆成三段短句（原本→改用→為何快）；術語 JWT 首次出現附全名；被動全部還原為主動。

### 案例 B：商務文件（虛主詞＋被動堆疊）

> "While it is acknowledged that the proposed timeline may be ambitious given the current resource constraints, it should be noted that failure to meet the Q3 deadline could potentially jeopardize our standing with key stakeholders who have already been briefed on the expected deliverables, and it is therefore recommended that all teams prioritize this initiative above other non-critical projects."

→ 就目前的資源狀況來看，這份時程確實偏趕。但必須正視的是，關鍵利害關係人已經知道我們預計在 Q3 交付哪些成果，一旦未能如期達成，恐怕會損及我們的信譽。因此建議各團隊將這項計畫列為最優先，其他非急迫的專案暫時往後排。

### 案例 C：Idiom 密集文本

> "At the end of the day, we need to bite the bullet and face the elephant in the room: our go-to-market strategy is dead in the water, and unless we go back to the drawing board and think outside the box, we're going to miss the boat entirely."

→ 說到底，有一件事大家心裡有數但一直沒人敢講，我們的上市策略根本走不動了。再不硬著頭皮打掉重來、跳出框架想新做法，就徹底錯過這波機會了。

---

## 15. 自檢快查表

譯文寫完後，逐項掃一遍。**這張表不是規則來源，只是 index**——發現命中徵兆，回對應節重看規則與範例。

| # | 症狀 | 命中徵兆（看到就警覺） | 對應節 |
|---|---|---|---|
| 1 | idiom 字面直譯 | 球在你的場地上了 | §5 |
| 2 | 尾重句未重組 | 我們決定採用微服務架構，基於可擴展性考量。 | §4 |
| 3 | 「的」字連環 | 一個由資深的跨部門的專案管理的團隊提出的計畫 | §3.A |
| 4 | 被動句濫用 | 該報告已被完成並已被提交。 | §3.B |
| 5 | 空泛動詞／名詞化 | 對系統進行升級；效能的提升 | §3.C / §3.E |
| 6 | 虛主詞框架 | 應該被注意的是，⋯ | §3.D |
| 7 | 代詞殘留 | 如果使用者忘記他的密碼，他可以重設它。 | §2 |
| 8 | 連接詞堆疊 | 首先⋯然後⋯接著⋯ | §2 |
| 9 | 否定錯置（neg-raising） | 我不認為這個做法可以擴展。 | §7.1 |
| 10 | 體標記重複 | 報告已被完成並已被提交。 | §7.4 |
| 11 | 陸式用語 | 信息安全、數據庫、移動端、當前 | §9 |
| 12 | 量詞萬用「個」 | 一個建議、一個會議、一個報告 | §9 |
| 13 | 語氣強度失準 | should → 應該被；must → 你必須 | §11 |
| 14 | hedge 升格（學術文本） | results may → 結果顯示；suggest → 證明 | §12 |
