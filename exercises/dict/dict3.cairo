// dict3.cairo

#[derive(Destruct)]
struct Team {
    level: Felt252Dict<usize>,
    players_count: usize,
}

#[generate_trait]
impl TeamImpl of TeamTrait {
    fn new() -> Team {
        // Initialize an empty team with 0 players
        Team { level: Felt252Dict::new(), players_count: 0 }
    }

    fn get_level(ref self: Team, name: felt252) -> usize {
        // Use the `get` method of the Felt252Dict to retrieve the level
        *self.level.get(name).get()
    }

    fn add_player(ref self: Team, name: felt252, level: usize) -> () {
        // Use the `set` method of the Felt252Dict to add or update the level
        self.level.set(name, level);
        // Increment the players_count
        self.players_count += 1;
    }

    fn level_up(ref self: Team, name: felt252) {
        // Use the `get` and `set` methods of the Felt252Dict to increment the level
        let current_level = *self.level.get(name).get();
        self.level.set(name, current_level + 1);
    }

    fn players_count(self: @Team) -> usize {
        // Return the players_count
        self.players_count
    }
}

#[test]
#[available_gas(200000)]
fn test_add_player() {
    let mut team = TeamTrait::new();
    team.add_player('bob', 10);
    team.add_player('alice', 20);

    assert(team.players_count == 2, 'Wrong number of players');
    assert(team.get_level('bob') == 10, 'Wrong level for bob');
    assert(team.get_level('alice') == 20, 'Wrong level for alice');
}

#[test]
#[available_gas(200000)]
fn test_level_up() {
    let mut team = TeamTrait::new();
    team.add_player('bobby', 10);
    team.level_up('bobby');

    assert(team.get_level('bobby') == 11, 'Wrong level for bobby');
}
