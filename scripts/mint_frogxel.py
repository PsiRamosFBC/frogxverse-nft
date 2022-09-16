from brownie import FrogxVerse
from scripts.helpful_scripts import LOCAL_BLOCKCHAIN_ENVIRONMENTS, get_account


def mint_frogxel(tokenid):
    account = get_account()
    contract = FrogxVerse[-1]
    mint_tx = contract.mintFrogxel(account, tokenid, {"from": account})
    mint_tx.wait(1)
    return mint_tx


def main():
    mint_frogxel(2)
