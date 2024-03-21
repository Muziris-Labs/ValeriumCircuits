use dep::std;

fn main(
    passcode: Field,
    reqChain: Field,
    reqToken: Field,
    serverHash: pub Field,
    chainId: pub Field,
    amount: pub Field,
    token: pub Field
) {
    let hash = std::hash::pedersen_hash([passcode, amount]);

    assert(hash == serverHash);
    assert(reqChain == chainId);
    assert(reqToken == token);
}

#[test]
fn test_main() {
    let passcode : Field = 0x12345;
    let reqChain : Field = 0x0000000000000000000000000000000000000000000000000000000000000763;
    let reqToken : Field = 0x0000000000000000000000000000000000000000000000000000000000000000;
    let serverHash : Field = 0x1ed20233b978011f56673ccc26a06f212400acd3cdf993d99edd66f4424844e4;
    let chainId : Field = 0x0000000000000000000000000000000000000000000000000000000000000763;
    let amount : Field = 0x000000000000000000000000000000000000000000000000016345785d8a0000;
    let token : Field = 0x0000000000000000000000000000000000000000000000000000000000000000;

    main(passcode, reqChain, reqToken, serverHash, chainId, amount, token);
}
