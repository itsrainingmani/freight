run: build
  ./target/bootstrap/freight
build:
  mkdir -p target/bootstrap
  # Build Crate Deps
  rustc src/lib.rs --edition 2021 --crate-type=lib --crate-name=freight \
    --out-dir=target/bootstrap
  # Create the executable
  rustc src/main.rs --edition 2021 --crate-type=bin --crate-name=freight -L target/bootstrap \
    --extern freight --out-dir=target/bootstrap
