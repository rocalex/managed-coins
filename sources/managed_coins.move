module orao_network::managed_coins {
    use aptos_framework::managed_coin;
    use aptos_std::signer;

    const E_NOT_ORAO: u64 = 0;

    struct BatiCoin {}

    struct HugoCoin {}

    fun init_module(sender: signer) {
        let creator_addr = signer::address_of(&sender);
        assert!(creator_addr == @orao_network, E_NOT_ORAO);

        managed_coin::initialize<BatiCoin>(
            &sender,
            b"Bati Coin",
            b"BATI",
            0,
            false,
        );

        managed_coin::register<BatiCoin>(&sender);

        managed_coin::initialize<HugoCoin>(
            &sender,
            b"Hugo Coin",
            b"HUGO",
            0,
            false,
        );

        managed_coin::register<HugoCoin>(&sender);
    }

    public entry fun mint_bati(sender: signer, receiver: address, amt: u64) {
        managed_coin::mint<BatiCoin>(&sender, receiver, amt);
    }

    public entry fun burn_bati(sender: signer, amt: u64) {
        managed_coin::burn<BatiCoin>(&sender, amt);
    }

    public entry fun register_bati(sender: signer) {
        managed_coin::register<BatiCoin>(&sender);
    }

    public entry fun mint_hugo(sender: signer, receiver: address, amt: u64) {
        managed_coin::mint<HugoCoin>(&sender, receiver, amt);
    }

    public entry fun burn_hugo(sender: signer, amt: u64) {
        managed_coin::burn<HugoCoin>(&sender, amt);
    }

    public entry fun register_hugo(sender: signer) {
        managed_coin::register<HugoCoin>(&sender);
    }
}
