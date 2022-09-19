from brownie import FrogxVerse
from scripts.helpful_scripts import LOCAL_BLOCKCHAIN_ENVIRONMENTS, get_account

MAX_GAS = 100000


def mint_frogxel():
    account = get_account()
    contract = FrogxVerse[-1]
    mint_tx = contract.mintFrogxel(
        account, {"from": account, "gas_limit": MAX_GAS, "allow_revert": True}
    )
    mint_tx.wait(1)
    return mint_tx


def main():
    mint_frogxel()
