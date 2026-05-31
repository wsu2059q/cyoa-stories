# author: Ink Tester
# image: https://http.cat/200

VAR hp = 100
VAR gold = 0
VAR visited_garden = false
VAR dragon_defeated = false

-> start

=== start
你站在一座神秘城堡的大门前。

{ visited_garden:
    你记得之前来过花园。
}

* 进入城堡大门 -> castle_hall
+ 探索花园 { not visited_garden } -> garden
* 离开这里 -> leave

=== garden
你走进花园，发现一口许愿井。
~ visited_garden = true
~ gold += 10
你得到了 10 枚金币！金币总数：{gold}

# image: https://http.cat/201

* 继续前进 -> start
* 再许一次愿 -> lucky_wheel

=== lucky_wheel
你的运气：{~大成功|成功|普通|失败|大失败}

{ true:
    ~hp -= 5
    你消耗了 5 点 HP。当前 HP：{hp}
}

-> garden

=== castle_hall
城堡大厅空旷而阴森。HP: {hp}

{ hp < 30:
    # image: https://http.cat/403
}
{
    hp >= 30:
    # image: https://http.cat/200
}

* 上楼 -> upper_floor
* 进入厨房 -> kitchen
* 回到大门 -> start

=== kitchen
你发现了一些食物。

{ gold >= 20:
    ~ gold -= 20
    ~ hp += 30
    你花了 20 金币买了魔法食物，恢复 30 HP。HP: {hp}
    -> castle_hall
}
{
    gold < 20:
    你太穷了，买不起食物。
    -> castle_hall
}

=== upper_floor
你来到了二层，有三扇门。
# image: https://http.cat/302

* 打开第一扇门 -> treasure_room
* 打开第二扇门 -> riddle_room
* 打开第三扇门 -> dragon_lair

=== treasure_room
# image: https://http.cat/202
满地金币！
~ gold += 50
金币：{gold}
-> castle_hall

=== riddle_room
一个幽灵问你："什么东西越洗越脏？"
# image: https://http.cat/418

* [水] 水 -> riddle_wrong
* [手] 手 -> riddle_wrong
* [答案] 答案？ -> riddle_wrong
* [时间] 时间 -> riddle_correct

=== riddle_wrong
幽灵摇摇头。
~ hp -= 15
HP: {hp}
-> castle_hall

=== riddle_correct
幽灵满意地消失了。
~ gold += 30
金币：{gold}
-> castle_hall

=== dragon_lair
{ dragon_defeated:
    巨龙已经死了，这里空荡荡的。
    -> castle_hall
}

巨龙苏醒！
# image: https://http.cat/500

-> fight_dragon

=== fight_dragon
VAR attack_count = 0

- (fight_loop)
  第 {attack_count + 1} 次攻击
  ~ attack_count++
  {
    attack_count <= 3:
      ~ dragon_defeated = true
      ~ gold += 100
      你击中了巨龙！击败巨龙获得 100 金币。
      金币：{gold}
      -> dragon_victory
  }
  {
    attack_count > 3:
      你躲开了攻击...
      -> fight_loop
  }

=== dragon_victory
巨龙倒下了。
# image: https://http.cat/204
-> castle_hall

=== leave
你离开了城堡，故事结束。
-> DONE

=== DONE
# image: https://http.cat/404
游戏结束。最终 HP：{hp}，最终金币：{gold}
-> END
