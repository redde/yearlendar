# Годовой календарь

Статический календарь на Astro с печатью в формате A1, альбомная ориентация.

```sh
mise trust
mise install
mise exec -- pnpm install --frozen-lockfile
mise exec -- pnpm dev
```

`mise exec -- pnpm test` проверяет календарь. `mise exec -- pnpm build` собирает сайт в `dist/`.

Годы с 1900 по 2100 доступны по адресам вроде `/2027/`. Для остальных лет используйте `/?year=1899`. В декабре главная страница автоматически показывает следующий год.

В настройках репозитория откройте **Settings → Pages** и выберите **GitHub Actions** в поле **Source**. Публикация запускается при изменении ветки `master` или вручную из вкладки **Actions**. До подключения домена сайт доступен по адресу [redde.github.io/yearlendar](https://redde.github.io/yearlendar/).

Для переноса `calendar.redde.ru` добавьте его в **Settings → Pages → Custom domain**, обновите DNS-запись `CNAME` на `redde.github.io` и заново запустите публикацию. При сборке GitHub Pages передаёт базовый путь для текущего домена. [Инструкция GitHub](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site).
