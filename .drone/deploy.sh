# Deploy files
scp -prq source $DEPLOY_USER@docs.aplazame.com:$DOCS_PATH

# Build it
ssh $DEPLOY_USER@aplazame.com "zsh -c 'source ~/.zshrc;cd $DOCS_PATH;rake'"
