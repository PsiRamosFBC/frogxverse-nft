from brownie import FrogxVerse, network, config
from scripts.helpful_scripts import (
    get_subId,
    get_contract,
    get_account,
    get_publish_source,
    add_consumer,
)


def deploy():
    account = get_account()
    vrf_coordinator = get_contract("vrf_coordinator")
    subId = get_subId(account)
    frogxverse = FrogxVerse.deploy(
        vrf_coordinator,
        config["networks"][network.show_active()]["keyhash"],
        subId,
        1000000,
        account,
        {"from": account},
        publish_source=get_publish_source(),
    )
    add_consumer(account, subId, frogxverse.address)
    return frogxverse


def main():
    deploy()
