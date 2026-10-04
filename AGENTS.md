# Mylla Soul — site estático (HTML/CSS/JS puro, sem build)

Site da cantora Mylla Soul no ar em https://wangazzu.github.io/mylla-soul (repo `wangazzu/mylla-soul`, branch `main`).
Páginas: `index.html` (one-page) + `press-kit.html`, `blog.html`, `blog/*.html`, `qrcode.html`. CSS/JS compartilhados em `css/style.css`, `js/`.

## Publicar

Sem build: cada `push` na `main` gera redeploy automático no Vercel (~1 min).

```
git add -A && git commit -m "..." && git push
```

## Config central — `js/config.js`

WhatsApp, Instagram, YouTube, domínio: tudo sai daqui. Regras:

- Manter `window.SITE_CONFIG = {...}` (com prefixo `window.`). `const`/`let` quebra TODOS os links (vira `wa.me/undefined`) porque `main.js` lê via `window`.
- Links novos no HTML usam atributos, nunca URL hardcoded: `data-wa` (+ opcional `data-wa-msg`), `data-insta`, `data-yt`. O JS preenche `href`/`target` no `DOMContentLoaded`.
- `qrcode.html` lê `SITE_CONFIG.siteUrl` direto; ao trocar de domínio, atualize também `sitemap.xml` e `robots.txt`.

## Header é montado via JS (`js/main.js`)

Botões de ícone WhatsApp/Instagram e menu hambúrguer mobile são **injetados pelo JS** em `header .nav` (vale nas 5 páginas). Não duplique no HTML. Seletores que o JS espera: `.logo`, `.links`, `header .nav`.

## Verificação (sem testes automatizados)

1. `node --check js/main.js` (obrigatório após editar JS)
2. Recarregar a aba do navegador e checar console (0 erros) + `document.querySelectorAll` do que mudou
3. Interações com estado (lightbox, contadores, formulário) testar clicando de verdade, não só inspecionando DOM

## Armadilhas reais (já morderam antes)

- **Nunca quebrar string JS em duas linhas**: string de aspas simples com newline literal = `SyntaxError` que derruba o arquivo inteiro (menu, links, contadores, tudo para). Se o console mostrar erro de parse, cheque aspas antes das chaves.
- **`//` comenta o resto da linha**: não cole código após comentário de linha (já desativou um `forEach` inteiro sem erro óbvio — só `node --check` + teste revelam).
- Embeds YouTube dão erro 153 em `file://` (origem nula) — comportamento esperado local, funciona no https. Não "corrija" o que só falha local.
- Âncoras do menu usam `scroll-margin-top` no CSS por causa do header fixo; ao mudar a altura do header, ajuste junto.
- Player de vídeo: só um toca por vez (handler `play` pausa os outros); lightbox move o `<video>` para o palco e devolve ao fechar — preserve `video._frame`/`video._btn`.

## Mídias

- Fotos: `assets/fotos/foto-01..10.jpg`, largura máx 1200px JPEG q82. Galeria usa moldura 3:4 + `object-position` (fotos são verticais; moldura quadrada corta cabeças).
- Vídeos: `assets/videos/video-*.mp4` + `poster-*.jpg`. Requer FFmpeg: `powershell -ExecutionPolicy Bypass -File scripts\comprimir-videos.ps1` (backup em `originais/`, já gitignored). `preload="metadata"`: peso só baixa no play.
- `assets/fotos/tema.jpg` é referência de design, fica fora do commit.
