function run_n2n() {
    sudo edge -c name \
         -a ip:port \
         -k password \
         -A4 \
         -a 10.0.0.1 "$@"
}
alias nnn="run_n2n -f"
