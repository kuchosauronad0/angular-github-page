# angular-gihub-page                                                                                                                                                                                      [334/1877]

I want an easy way to deploy an angular application as a github page to render
and sort some markdown files.

# Steps to reproduce this repo

```
git init
git remote add origin git@github.com:kuchosauronad0/angular-github-page.git
ng new sample
git add -A
git commit -m "chore: initial commit"
git push
```

# Deploy with angular-cli-ghpages

```
cd sample
ng add angular-cli-ghpages
ng deploy --base-href=/angular-app/
```
Next go to https://github.com/<username>/<repositoryname> Settings and enable
github pages for the repository. The site can be found under this url:
https://<username>.github.io/<repositoryname>

# Deploy manually

```
cd sample
# build the site with: ng build --output-path docs --base-href /repository-name/
# ie
ng build --output-path docs --base-href /angular-app/
```
The build output can be found in `sample/docs/`

# Build, push and run Docker container
```
#Example
docker build -t kuchosauronad0/sample:latest .
docker login
docker push kuchosauronad0/sample:latest
docker run -d -p 80:80 kuchosauronad0/sample:latest
```
