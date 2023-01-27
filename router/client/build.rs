use std::fs;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("cargo:rerun-if-changed=../../proto/generate.proto");
    println!("cargo:rerun-if-changed=src/pb/mod.rs");
    println!("cargo:rerun-if-changed=src/pb/generate.v1.rs");
    fs::create_dir("src/pb").unwrap_or(());
    tonic_build::configure()
        .build_client(true)
        .build_server(false)
        .out_dir("src/pb")
        .include_file("mod.rs")
        .compile(&["../../proto/generate.proto"], &["../../proto"])
        .unwrap_or_else(|e| panic!("protobuf compilation failed: {}", e));

    Ok(())
}
