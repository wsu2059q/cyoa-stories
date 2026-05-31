# author: Ink Tester
# image: https://http.cat/200

VAR hp = 100
VAR gold = 0
VAR has_key = false

-> start

=== start
你站在一个神秘的森林入口。

# image: https://http.cat/200

* 进入森林 -> forest_path
* 离开这里 -> leave

=== forest_path
你在森林中走着，突然遇到一个岔路口。

# image: https://http.cat/201

* 向左走 -> left_path
* 向右走 -> right_path

=== left_path
你发现了一个宝箱！

{ gold >= 50:
    宝箱是空的，已经被拿走了。
    -> forest_path
}

~ gold += 50
你获得了 50 金币！现在有 {gold} 金币。

# image: https://http.cat/202

* 继续前进 -> forest_path
* 返回 -> start

=== right_path
你遇到了一个守卫。

# image: https://http.cat/403

* 战斗 -> fight
* 贿赂 { gold >= 30 } -> bribe
* 逃跑 -> forest_path

=== fight
~ hp -= 20
你损失了 20 HP，当前 HP：{hp}

{ hp <= 0:
    -> death
}

{ hp > 0:
    你打败了守卫！
    ~ gold += 30
    获得 30 金币！
    -> forest_path
}

=== bribe
~ gold -= 30
你给了守卫 30 金币，他让路了。剩余金币：{gold}
-> forest_path

=== leave
你离开了森林，故事结束。
-> DONE

=== death
你倒在了森林中...
# image: https://http.cat/500
-> DONE

=== DONE
# image: https://http.cat/404
游戏结束。最终 HP：{hp}，最终金币：{gold}
