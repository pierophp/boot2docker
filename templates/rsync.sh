docker exec rsync \
    rsync -av --include ".*" --delete --no-links \
  --exclude "tk-docker/workdir/www/inoserver/app/cache/*" \
  --exclude "tk-docker/workdir/www/inoserver/app/logs/*" \
  --exclude "tk-docker/workdir/www/inoserver/vendor/*" \
  --exclude "tk-docker/workdir/www/inoserver/.git/*" \
  --exclude "tk-docker/workdir/www/rocket-wms/.git/*" \
  /home/docker/. /home/docker_bkp/ 
