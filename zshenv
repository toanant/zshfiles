# set proxy
proxy=http://144.16.192.245:8080
http_proxy=$proxy
https_proxy=$proxy
ftp_proxy=$proxy
no_proxy="localhost,127.0.0.1,10.35.32.102,10.35.32.91,10.35.32.95,gymkhana.iitkgp.ernet.in,sit.iitkgp.ernet.in,erp.iitkgp.ernet.in"
export https_proxy http_proxy ftp_proxy socks_proxy no_proxy

# NCBI BLAST+:
# http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=Download
export PATH=$PATH:/$HOME/opt/ncbi-blast-2.2.25+/bin

export ZSH="$HOME/.zsh"
