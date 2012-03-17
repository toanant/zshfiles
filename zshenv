# rbenv: https://github.com/sstephenson/rbenv
export PATH="$HOME/.zsh/rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ruby-build: https://github.com/sstephenson/ruby-build
export PATH="$HOME/.zsh/ruby-build/bin:$PATH"

# NCBI BLAST+:
# http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=Download
export PATH=$PATH:/$HOME/opt/ncbi-blast-2.2.25+/bin
