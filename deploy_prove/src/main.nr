use dep::std;

fn main(
    reqDomain: Field,
    passcode: Field,
    serverHash: pub Field,
    domain: pub Field,
    chainId: pub Field
) {
    let hash = std::hash::pedersen_hash([passcode, chainId]);

    assert(hash == serverHash);
    assert(domain == reqDomain);
}

#[test]
fn test_main() {
    let reqDomain = 0x123;
    let passcode = 0x12345;
    let serverHash = 0x272812d9e75c98fa2a66982adb36b921c1e7c1f5c14a4b6ff213c75745ff4113;
    let domain = 0x123;
    let chainId = 0x34567;

    main(reqDomain, passcode, serverHash, domain, chainId);
}
