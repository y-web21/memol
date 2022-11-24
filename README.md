# README

memol 自分用メモ

## Jekyll 専用ページとしてリポジトリを作成する

- [Creating a GitHub Pages site with Jekyll - GitHub Docs](https://docs.github.com/ja/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll#creating-a-repository-for-your-site)
- [Dependency versions \| GitHub Pages](https://pages.github.com/versions/)

## install

Generate .env for `compose` and run the docker container.

```sh
./make_dotenv.bash
docker compose up --build -d
```

```sh
# check the response from the local server
curl localhost:4000 --head
HTTP/1.1 200 OK
```

Make sure Live Reload is working by accessing it from your browser.
