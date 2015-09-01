# Deploy to docs.aplazame.com
scp -i ~/.ssh/id_rsa -prq source $DEPLOY_USER@docs.aplazame.com:$DOCS_PATH
