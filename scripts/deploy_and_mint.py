from scripts.deploy import deploy
from scripts.mint_frogxel import mint_frogxel


def deploy_and_mint():
    contract = deploy()
    mint_tx = mint_frogxel()


def main():
    deploy_and_mint()
