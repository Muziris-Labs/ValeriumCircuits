use dep::std;

fn main(x: Field, y: Field) -> pub Field {
    let hash = std::hash::pedersen_hash([x, y]);

    hash
}

#[test]
fn test_main() {
    let x : Field = 0x12345;
    let y : Field = 0x34567;

    std::println(main(x, y));
}
