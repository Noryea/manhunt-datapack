## 介绍

一个还原猎人游戏玩法的数据包，旧版本支持 `1.16-1.20.4`，最新版支持 `1.21-1.21.4`。

数据包会自动创建两个队伍：一是猎人（红），二是逃者（绿）。

所有玩家都可以用指令 `/trigger mh.join.<队伍>` 选择队伍（猎人或逃者），系统会自动给猎人发指南针（追踪器）。追踪器与一名玩家绑定，每次更新时指向目标的最新位置。与目标不在同一维度时，追踪器会指向目标在本维度的最后位置。

旧版本的追踪器只能手持更新，1.21.2以上则默认为右键更新。丢弃追踪器可以切换到下一个目标。

当逃者全部寄了后，会以标题显示猎人胜利。

## 配置（根据1.21及以上的版本撰写）

**允许自由选择队伍**：开/关

**逃者死亡处理**：复活/旁观/变为猎人

**猎人可追踪**：1. 逃者  2. 队友

**逃者可追踪**：1. 猎人  2. 队友

**指南针丢弃事件**：无动作/切换到下一个目标/手动指定目标。

**指南针显示敌人信息**：1. 距离  2. XZ坐标  3. Y坐标  4. 维度

**指南针显示队友信息**：1. 距离  2. XZ坐标  3. Y坐标  4. 维度

**指南针更新模式**：右键更新/快捷栏更新/手持更新/定期更新

**更新间隔**：一个整数

## 其他功能

**仅1.21+：**

- 玩家可以在背包合成格将追踪器转换为书与笔，手动输入玩家的游戏id来指定目标。

- 如果更新模式为定期更新，可以设置是否在每个玩家屏幕上以boss条的形式显示更新倒计时。

- 如果更新模式为手持更新，可以设置追踪器是否必须手持激活。（如果必须手持激活，那么追踪器没有被拿着时其指针会乱转）

**仅1.20及以下的版本：**

- 玩家可以在主手拿着追踪器时，按住潜行键丢弃以在聊天栏列出所有可以选择的目标，用鼠标单击目标的id进行选择。

**全部版本：**

- 冻结猎人。

- 重置所有玩家状态（血量，饥饿值，背包，进度，重生点等）。

## 指令

**见进度界面**
