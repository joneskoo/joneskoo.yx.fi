deploy:
	hugo --cleanDestinationDir
	gcloud app deploy --project joneskooyxfi
