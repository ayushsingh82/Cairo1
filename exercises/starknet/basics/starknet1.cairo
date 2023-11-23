#[starknet::interface]
trait IJoesContract<TContractState> {
    fn get_owner(self: @TContractState) -> felt252;
}

#[starknet::contract]
mod JoesContract {
    #[storage]
    struct Storage {}

    impl IJoesContractImpl of super::IJoesContract<ContractState> {
        fn get_owner(self: @ContractState) -> felt252 {
            "Joe"
        }
    }
}

// Rest of the code remains unchanged...
