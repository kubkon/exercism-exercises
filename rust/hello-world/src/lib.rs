pub fn hello(name: Option<&str>) -> String {
    let hello = "Hello";
    match name {
        None => format!("{}, World!", hello),
        Some(name) => format!("{}, {}!", hello, name),
    }
}
