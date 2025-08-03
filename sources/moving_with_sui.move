module moving_with_sui::testnet_nft {

    use std::string;
    use sui::url::{Self, Url};
    use sui::event;
    use sui::object;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct TestnetNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    #[allow(lint(self_transfer))]
    public fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext,
    ) {
        let sender = tx_context::sender(ctx);
        let nft = TestnetNFT {
            id: object::new(ctx),
           name: string::utf8(b"witch"),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };
        transfer::public_transfer(nft, sender);
    }
}
