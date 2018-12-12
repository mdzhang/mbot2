# install Node and Python requirements
install:
	yarn
	pip install -r requirements.txt

# setup AWS credentials
config-deploy:
	serverless config credentials --provider aws --key $$AWS_ACCESS_KEY_ID --secret $$AWS_SECRET_ACCESS_KEY --profile $$AWS_PROFILE

# deploy lambdas etc.
deploy:
	serverless deploy --stage $$NODE_ENV

# remove any AWS resources created via this serverless service
destroy:
	serverless remove

# get all info on existing serverless resources
info:
	serverless info --stage $$NODE_ENV

sample-curl:
	http -f POST $$ENDPOINT 'Content-type:application/x-www-form-urlencoded' token=gIkuvaNzQIHg97ATvDxqgjtO team_id=T0001 team_domain=example enterprise_id=E0001 enterprise_name=Globular%20Construct%20Inc channel_id=C2147483705 channel_name=test user_id=U2147483697 user_name=Steve command=/weather text=94070
