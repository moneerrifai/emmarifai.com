build:
	rm -rf public
	hugo
deploy: build
	aws s3 sync public/ s3://www.emmarifai.com --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E2JYF5NFJAZCE5 --paths '/*'
	aws cloudfront create-invalidation --distribution-id E2Z5IN7LS6UX90 --paths '/*'
