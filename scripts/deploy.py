from brownie import FrogxVerse
from scripts.helpful_scripts import get_account, get_publish_source


def deploy():
    account = get_account()
    frogxverse = FrogxVerse.deploy(
        {"from": account}, publish_source=get_publish_source()
    )
    return frogxverse


def main():
    deploy()
