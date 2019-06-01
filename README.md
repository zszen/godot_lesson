# Godot Lesson
______________________

# Navigation
躲避tilemap的障碍，简单寻路

![](navigation2d.gif)
______________________

# Follow Player
当检测到玩家在附近，则开始追逐玩家，碰到会扣血。当玩家逃离后不再追逐。

![](follow_player.gif)
______________________

# Camera Far Away
聚焦在多个对象上，镜头伸缩

![](camera_faraway.gif)
______________________

# Random Ground Map
### 随机地图贴图

![](random_ground_map.gif)
______________________

# Ship Control
### 学习通过vs和gd两种不同方式控制小船

![](ship.gif)
______________________

# dodge_the_creeps
### 躲避游戏，增加两种不同方式的幻影
1. 使用粒子效果，简单，但不能得到玩家当前动作效果，建议做成简单的同色色块跟随
2. 使用 Sprite 和 Tween 获取Player的动画当前贴图，设置起来相当麻烦，但可以获得精准的当前动作图，性能不如粒子效果，但对单个玩家不影响，可扩展性强

![](dodge_the_creeps.png)
______________________

