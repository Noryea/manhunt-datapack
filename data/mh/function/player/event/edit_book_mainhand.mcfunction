# 如果是空页直接返回
execute if items entity @s weapon.mainhand writable_book[minecraft:writable_book_content={"pages":[]}] run \
    return run advancement revoke @s only mh:detect/edit_book

# 
function mh:compass/select/choose_by_name with entity @s SelectedItem.components."minecraft:written_book_content".pages[0]


# 让进度可以重新触发
advancement revoke @s only mh:detect/edit_book

