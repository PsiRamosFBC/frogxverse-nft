from scripts.mint_frogxel import mint_frogxel


def test_correct_tokenid():
    # Arrange
    account = get_account()
    contract = deploy()
    tokenid = 2
    # Act
    mint_tx = mint_frogxel(tokenid)
    # Assert
    assert contract.