use std::io::Result;
use std::process::Command;
use std::str;

fn main() -> Result<()> {
    let output = Command::new("rustc").arg("-vV").output()?;
    let output = str::from_utf8(&output.stdout).unwrap();

    println!("target triple: {:?}", output);
    Ok(())
}
