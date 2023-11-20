// enums3.cairo

use debug::PrintTrait;

#[derive(Drop, Copy)]
enum Message {
    ChangeColor((u8, u8, u8)),
    Echo(felt252),
    Move(Point),
    Quit,
}

#[derive(Drop, Copy)]
struct Point {
    x: u8,
    y: u8,
}

#[derive(Drop, Copy)]
struct State {
    color: (u8, u8, u8),
    position: Point,
    quit: bool,
}

trait StateTrait {
    fn change_color(ref self: State, new_color: (u8, u8, u8));
    fn quit(ref self: State);
    fn echo(ref self: State, s: felt252);
    fn move_position(ref self: State, p: Point);
    fn process(ref self: State, message: Message);
}

impl StateImpl of StateTrait {
    fn change_color(ref self: State, new_color: (u8, u8, u8)) {
        // Update the color in a new State instance
        let new_state = State {
            color: new_color,
            position: self.position,
            quit: self.quit,
        };
        // Print the new state for demonstration purposes
        new_state.print();
    }

    fn quit(ref self: State) {
        // Update the quit flag in a new State instance
        let new_state = State {
            color: self.color,
            position: self.position,
            quit: true,
        };
        // Print the new state for demonstration purposes
        new_state.print();
    }

    fn echo(ref self: State, s: felt252) {
        // Print the received string
        s.print();
    }

    fn move_position(ref self: State, p: Point) {
        // Update the position in a new State instance
        let new_state = State {
            color: self.color,
            position: p,
            quit: self.quit,
        };
        // Print the new state for demonstration purposes
        new_state.print();
    }

    fn process(ref self: State, message: Message) {
        // Match on the message variant and call the corresponding method
        match message {
            Message::ChangeColor(new_color) => self.change_color(new_color),
            Message::Quit => self.quit(),
            Message::Echo(s) => self.echo(s),
            Message::Move(p) => self.move_position(p),
        }
    }
}

#[test]
fn test_match_message_call() {
    let mut state = State {
        quit: false,
        position: Point { x: 0, y: 0 },
        color: (0, 0, 0),
    };
    state.process(Message::ChangeColor((255, 0, 255)));
    state.process(Message::Echo('hello world'));
    state.process(Message::Move(Point { x: 10, y: 15 }));
    state.process(Message::Quit);

    assert(state.color == (255, 0, 255), 'wrong color');
    assert(state.position.x == 10, 'wrong x position');
    assert(state.position.y == 15, 'wrong y position');
    assert(state.quit == true, 'quit should be true');
}
