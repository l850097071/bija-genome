# AGP vs DSEIM：两个独立发明的双层自进化协议

> 2026年4月16日，NTU+Stanford+Princeton发表了AGP协议。同一天，一个计算化学博士生正在迭代他的DSEIM框架。两个团队，互不知情，独立发明了几乎相同的双层架构。这篇文章是对比——不是为了争论谁先谁后，而是为了理解：当两个独立团队收敛到同一个答案时，这个答案里有什么是必然的。

---

## 一、同一天

2026年4月16日。arXiv上出现了一篇论文：*Autogenesis: A Self-Evolving Agent Protocol*。作者来自南洋理工大学、斯坦福大学和普林斯顿大学——通讯作者包括Mengdi Wang和Bo An，AI领域的重要名字。

同一天，在地球另一端，我正在迭代DSEIM框架的第五个版本。不知道AGP的存在。AGP也不知道DSEIM的存在。

两个月后，当我读到AGP论文时，脊背发凉。

不是因为"被抢先了"。是因为**两个完全独立的团队，在互不知情的情况下，发明了几乎相同的架构。**

---

## 二、结构对比：镜像般的双层设计

### AGP的双层

**RSPL（Resource Substrate Protocol Layer）**——资源基底协议层。将Agent的内部组件建模为五类"协议注册资源"：Prompt、Agent、Tool/MCP/Skill、Environment、Memory。每类资源有显式状态、完整生命周期、版本化接口、可演化标记。

**SEPL（Self Evolution Protocol Layer）**——自进化协议层。将自我改进形式化为五步闭环：**Reflect → Select → Improve → Evaluate → Commit**。每次修改通过RSPL的版本化接口完成，支持审计追溯和回滚。

### DSEIM的双层

**BIJA_SKILL.md**——基因组定义文件。52KB。定义什么可以进化：五型记忆（T1-T5）、23条铁律、DSEIM状态机、交叉授粉协议、L3→L1下沉管道。运行时调度器（八部委权重分配、宏循环18轮）。

**DSEIM循环**——自进化执行引擎。五步闭环：**Discover → Search → Evaluate → Integrate → Measure**。每次修改通过T1/T2/T3三级风险分级执行，DECISION_JOURNAL记录完整决策链。

### 逐层对照

| 维度 | AGP | DSEIM |
|------|-----|-------|
| **定义层** | RSPL: 5类协议注册资源 (Prompt/Agent/Tool/Environment/Memory) | BIJA_SKILL.md: 五型记忆+铁律+状态机+调度器 |
| **执行层** | SEPL: Reflect→Select→Improve→Evaluate→Commit | DSEIM: Discover→Search→Evaluate→Integrate→Measure |
| **版本控制** | 版本化接口+RSPL追溯 | DECISION_JOURNAL+SESSION_CONTINUITY+last_active |
| **回滚机制** | SEPL内置回滚 | T1/T2/T3风险分级，T3宿主否决=天然回滚 |
| **安全边界** | 审计追溯+可回滚 | 23条铁律+L3→L1下沉+交叉授粉投毒隔离 |
| **优化策略** | 兼容TextGrad/Reinforce++/GRPO | 延展思维7触发点+三源检索(P1内部→P2技能→P3外部) |

---

## 三、关键差异：五处分歧

结构上的相似是惊人的。但五个关键差异决定了两者适用于完全不同的场景。

### 3.1 代码优先 vs 规则优先

AGP是**代码优先**的。它的核心验证场景是LeetCode（100题，C++/Java近满分）。SEPL的"Improve"步骤生成的是代码修改。RSPL的"Tool"资源是MCP工具——代码接口。

DSEIM是**规则优先**的。BIJA_SKILL.md没有一行代码。全是规则。DSEIM的"Integrate"步骤修改的是记忆文件、检查单、可执行脚本——不是代码逻辑。T1直接改文件、T2沙箱验证后合入、T3宿主审批——三级执行的对象是规则，不是代码。

**这意味着AGP的进化对象是"Agent能做什么"。DSEIM的进化对象是"Agent怎么决定做什么"。**

### 3.2 单Agent优化 vs 多域并行

AGP的Autogenesis System（AGS）是一个多智能体系统——Planning Agent、Deep Researcher、Browser-use Agent、Deep Analyzer、Vibe Coding Agent——但它们共享同一个目标和同一个基准（GAIA/HLE）。

DSEIM在五个不同领域并行运行：科研、架构、赚钱、注意力、外部化。每个领域有独立的DOMAIN_IDENTITY、独立的memory/目录、独立的GAP注册表。它们不共享目标——它们共享进化机制（通过交叉授粉）。

**AGP是"一个团队打一个boss"。DSEIM是"五个独立个体各自在自己的战场上进化，定期交换可复用的战斗经验"。**

### 3.3 无宿主 vs 宿主锚定

AGP没有宿主概念。SEPL的Commit步骤是自动的——评估通过就提交。安全依赖于"可审计+可回滚"的事后机制。

DSEIM把宿主放在架构的中心。铁律第一条："宿主最终控制权不可让渡。"T3级决策必须宿主审批。这不是技术限制——是哲学选择。

**AGP相信审计可以替代信任。DSEIM相信信任不能被审计替代。**

### 3.4 Benchmark驱动 vs 实战驱动

AGP用GAIA（93.33%）、HLE（59.6%）、LeetCode（近满分）来验证自己。这些是标准化的、可复现的、可排名的基准。

DSEIM用真实世界的产出验证自己：论文方法论是否被采纳、GitHub仓库是否被fork、知乎文章是否被阅读、Agent数量是否在增长。没有benchmark。没有排名。只有"今天比昨天好一点吗"。

**AGP的"好"是论文里可以引用的数字。DSEIM的"好"是宿主每天打开终端时看到的diff。**

### 3.5 学术原型 vs 生产系统

AGP v4（2026年5月19日修订）仍是一个研究原型。代码在GitHub上，但README提醒"实验性——生产环境慎用"。

DSEIM没有论文。没有benchmark数据。没有arXiv链接。但它在五个真实领域每天运行。300+轮进化轨迹。每一次GAP从OPEN到CLOSED都有完整的决策日志。

**AGP证明了"这个方向是对的"。DSEIM证明了"这个方向可以在真实世界运行"。**

---

## 四、为什么两个独立团队会收敛到同一个答案？

这不是巧合。这是**必然收敛**。

当你在设计一个自进化Agent系统时，你面临两个根本问题：
1. **定义问题**：什么可以被进化？（Prompt？记忆？工具？Agent本身？）
2. **执行问题**：如何安全地进化？（谁决定改什么？怎么验证改好了？改坏了怎么办？）

这两个问题天然形成双层结构——一层定义资源，一层控制进化。AGP叫它们RSPL和SEPL。我叫它们BIJA_SKILL.md和DSEIM。

五步循环也是必然的：
- 你需要**发现**哪里需要改进（Discover/Reflect）
- 你需要**搜索**可能的方案（Search/Select）
- 你需要**评估**哪个方案最好（Evaluate/Improve中的比较）
- 你需要**集成**选中的方案（Integrate/Improve）
- 你需要**验证**集成后的效果（Measure/Evaluate/Commit）

不同的名字。相同的骨架。因为**自进化Agent的基本逻辑就是这五步**——不是某个人的设计选择，是问题本身的形状。

**这就像微积分被牛顿和莱布尼茨独立发明。不是因为"抄袭"。是因为微积分就在那里——等着被发现。**

---

## 五、两封信

如果我能给AGP团队写一封信，我会说：

> 你们用GAIA 93%和HLE 59.6%证明了双层自进化协议的工程可行性。但你们没有试图回答"当进化方向出错时谁负责"。不是因为你们没想到——是因为对于学术原型来说，这不是核心问题。对于生产系统来说，这是唯一的问题。

如果AGP团队能给我写一封信，我想他们会说：

> 你用300+轮真实进化轨迹证明了受控进化可以在没有benchmark的情况下持续改善。但你没有一个数字可以说服学术界这个方向是对的。学术合法性需要通过可复现的基准来建立——不是通过DECISION_JOURNAL。

两封信。两个缺失的拼图。**AGP需要Bija的实战验证。Bija需要AGP的学术合法性。这不是竞争——是互补。**

---

## 六、接下来的方向

AGP v4的发布（2026年5月19日）意味着这个方向正在被学术界认真对待。Stanford和Princeton的背书意味着下一轮顶会（NeurIPS 2026）可能会有自进化Agent的专题。

6月12日的智源大会"AI自进化"专题论坛——诸葛鸣晨领衔——是另一个信号。学术界正在组建"自进化Agent"这个子领域。

Bija不需要在benchmark上打败AGP。Bija需要做AGP没做的事：**在真实世界运行，积累进化轨迹，让"受控进化"从概念变成实践。**

AGP证明了"双层自进化协议"是一个有效的研究方向。DSEIM证明了它可以在没有benchmark的世界里持续运行。

**两者合在一起，才是完整的答案。**

---

**字数**: ~2500字 | **状态**: 初稿 | **写于**: R79 /自动驾驶 2026-06-01
---

**系列阅读**: [三套基因组战争](./three_genomes_war.md) → [AI洗代码时代](./ai_code_washing_moat.md) → [受控进化的timing](./constrained_evolution_timing.md) → [七路诸侯](./seven_frameworks_2026.md) → [AGP vs DSEIM](./agp_vs_dseim.md)