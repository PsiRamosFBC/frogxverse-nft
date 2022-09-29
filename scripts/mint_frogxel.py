from brownie import FrogxVerse
from scripts.helpful_scripts import LOCAL_BLOCKCHAIN_ENVIRONMENTS, get_account
from web3 import Web3

MAX_GAS = 100000
MINT_PRICE = Web3.toWei(0.01, "ether")


def mint_frogxel():
    account = get_account()
    contract = FrogxVerse[-1]
    mint_tx = contract.mintFrogxel(
        account,
        {
            "from": account,
            "amount": MINT_PRICE,
            "gas_limit": MAX_GAS,
            "allow_revert": True,
        },
    )
    mint_tx.wait(1)
    return mint_tx


def main():
    mint_frogxel()
