// enums1.cairo

use debug::print;
use debug::PrintTrait;

enum Message {
    Quit,
    Echo,
    Move,
    ChangeColor,
}

fn main() {
    Message::Quit.print();
    Message::Echo.print();
    Message::Move.print();
    Message::ChangeColor.print();
}

impl MessagePrintImpl of PrintTrait<Message> {
    fn print(self: Message) {
        match self {
            Message::Quit => ("Quit").print(),
            Message::Echo => ("Echo").print(),
            Message::Move => ("Move").print(),
            Message::ChangeColor => ("ChangeColor").print(),
        }
    }
}
