use dep::std;

fn main(
    password: Field,
    flagged_message: [u8; 32],
    hashed_message: pub [u8; 32],
    password_hash: pub Field
) {
    let hash = std::hash::poseidon::bn254::hash_1([password]);

    assert(hash == password_hash);

    assert(flagged_message == hashed_message);
}

#[test]
fn test_main() {
    let password : Field = 0x12345678;

    let password_hash : Field = 0x091ee5332166a8f64710423d58d89cb39991be009823f7f2fa9e1869fb6df51c;

    let flagged_message:[u8;32] = [
        161, 222, 152, 134, 0, 164, 44, 75, 74, 176, 137, 182, 25, 41, 124, 23, 213, 60, 255, 174, 93, 81, 32, 216, 45, 138, 146, 208, 187, 59, 120, 242
    ];

    let hashed_message:[u8;32] = [
        161, 222, 152, 134, 0, 164, 44, 75, 74, 176, 137, 182, 25, 41, 124, 23, 213, 60, 255, 174, 93, 81, 32, 216, 45, 138, 146, 208, 187, 59, 120, 242
    ];

    main(password, flagged_message, hashed_message, password_hash);
}
