# godot_dodge_demo

Dodge The Creeps

做了两种跟随幻影效果

1. 使用粒子效果，简单，但不能得到玩家当前动作效果，建议做成简单的同色色块跟随

2. 使用 Sprite 和 Tween 获取Player的动画当前贴图，设置起来相当麻烦，但可以获得精准的当前动作图，性能不如粒子效果，但对单个玩家不影响，可扩展性强


![](snap.png)