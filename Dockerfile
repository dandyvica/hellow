ARG IMAGE
FROM $IMAGE

RUN <<EOF
apk add git
apk add curl
apk add gcc
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal
git clone https://github.com/dandyvica/hellow
echo "cd hellow" >compile.sh
echo "source ~/.cargo/env" >> compile.sh
echo "cargo build --release" >> compile.sh
chmod +x compile.sh
EOF

CMD /compile.sh