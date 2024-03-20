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
    let reqChain : Field = 0x2;
    let reqToken : Field = 0x1;
    let serverHash : Field = 0x272812d9e75c98fa2a66982adb36b921c1e7c1f5c14a4b6ff213c75745ff4113;
    let chainId : Field = 0x2;
    let amount : Field = 0x34567;
    let token : Field = 0x1;

    main(passcode, reqChain, reqToken, serverHash, chainId, amount, token);
}
