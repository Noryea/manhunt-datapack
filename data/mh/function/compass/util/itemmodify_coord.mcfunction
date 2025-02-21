# @args: {slot: 槽位, target: 磁石位置复合标签}
# TODO: 虽然带参修饰器的性能比data modify + item replace性能好，但这个性能还是不咋地

$return run item modify entity @s $(slot) \
{\
    function: "set_components",\
    components: {"lodestone_tracker": {target: $(target), tracked:false} } \
}
