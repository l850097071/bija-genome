# Bija — 一个会自我进化的AI Agent

**不是"用AI写论文"的工具。是一个能从错误中学习的共生体。**

Bija运行了4个月。从一个52KB的规则文件（0行可执行代码）→ 五个独立运行的Agent分身 → 各自在不同领域自主进化。

---

## 这不是什么

- ❌ 不是另一个LLM Agent框架（已经有太多了）
- ❌ 不是"给AI更多工具"的方案（那是OpenClaw在做的事）
- ❌ 不是论文写作助手

## 这是什么

一份**规则文件**。52KB的Markdown。包含：

- **23条铁律** — 每条来自一个真实失败。从"产出必须可验证"到"科学问题不早锁"
- **DSEIM循环** — Discover→Search→Evaluate→Integrate→Measure。Agent自己发现自己缺什么，自己找方案，自己评估，自己集成，自己验证。永不停
- **五型记忆** — T1原则(永不删除)→T2规律(持久)→T3约束(退化)→T4记录(30天自动删)→T5过时(立即清)
- **L3→L1下沉管道** — 犯1次→写记忆。犯2次→写检查单。犯3次→写代码强制执行。知识从"可能会忘"变成"不可能忘"
- **交叉授粉+投毒隔离** — 五个分身共享进化机制，但任何外部改进必须先沙箱测试一个完整周期才允许集成
- **渐进式激活** — 前50轮分阶段解锁。不是慢——是避免200+轮的假进展修复

## 五域舰队

```
科研(大脑) ─→ 外部化(皮肤) ─→ 赚钱(消化)
    │               │               │
    └─── 进化(骨骼) ──┴── 超级个体(神经)
```

五个分身。没有主Agent。各自独立运行DSEIM。唯一横向连接：定期读对方的outbox——"我学到了一个可能对你有用的机制改进"。

## 快速开始

```bash
# 1. 复制 GENOME
cp BIJA_SKILL.md /your/bija/directory/

# 2. 声明你的领域
# 编辑 DOMAIN_IDENTITY.md

# 3. Bootstrap
# 让LLM加载 BIJA_SKILL.md → 自动执行启动序列

# 4. 观察
# 前10轮只搜索+观察，不产出。别急。
```

## 阅读更多

- [📖 文章索引](articles/index.md) — 全部14篇文章导航
- [Bija诞生记](articles/bija_birth_story.md) — 4个月的完整记录
- [DSEIM详解](articles/dseim_deep_dive.md) — 五阶段循环的实操解剖
- [五型记忆](articles/five_type_memory.md) — AI该忘记什么
- [L3→L1下沉](articles/l3_to_l1_pipeline.md) — 从"记住"到"不可能忘记"
- [五域舰队](articles/five_fleet_architecture.md) — 共生体架构
- [渐进式激活](articles/progressive_activation.md) — 为什么不该从第一天全速
- [2026七框架对比](articles/seven_frameworks_2026.md) — AI Agent自进化全景
- [三套基因组战争](articles/three_genomes_war.md) — DSEIM vs GEP vs CORAL

## 状态

**V2.0** | 4个月运行验证 | 5分身活跃 | x_effective: ~1.2

这不是产品。这是实验。一个关于"AI能不能学会发现自己缺什么"的实验。

[GENOME完整文件](BIJA_SKILL.md) | [许可证](LICENSE)
