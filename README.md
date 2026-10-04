# Mylla Soul — Pacote Presença Completa ☀️

Site estático mobile-first (HTML/CSS/JS puro) — rápido e grátis na Vercel/Netlify.

## Estrutura
- `index.html` — one-page: Início, Sobre, Serviços (3), Vídeos, Fotos, Depoimentos, Como Contratar + formulário→WhatsApp, FAQ, Contato
- `press-kit.html` — EPK para escolas/empresas (release, repertório, rider, contato corporativo)
- `blog.html` + `blog/*.html` — 2 artigos SEO iniciais
- `qrcode.html` — QR imprimível para eventos (usa domínio final)
- `js/config.js` — **arquivo central: trocar WhatsApp, links, domínio aqui**
- `css/style.css`, `js/main.js`, `sitemap.xml`, `robots.txt`

## Falta da cliente (checklist — Seção 7 da proposta)
1. [ ] WhatsApp comercial → trocar em `js/config.js` (atual: 5561999999999 placeholder)
2. [ ] 10 fotos boas → substituir blocos `TODO foto` em `index.html`
3. [ ] 3–5 vídeos (YouTube/Reels) → colar embeds em `#videos`
4. [ ] 6–10 depoimentos + nome/tipo → substituir em `#depoimentos`
5. [ ] Confirmar YouTube, e-mail, domínio final → `js/config.js` + `sitemap.xml`
6. [ ] Foco: definido como os 3 em equilíbrio (pode destacar 1 depois)

## Rodar local
Duplo clique em `index.html` ou `npx serve .`

## Publicar (grátis)
- **Vercel:** `vercel --prod` na pasta / arrastar pasta no painel / conectar GitHub
- **Netlify:** arrastar pasta em app.netlify.com/drop
- Depois: trocar `siteUrl` em `js/config.js` + `sitemap.xml` + `robots.txt` pelo domínio final
- Domínio .com.br ~R$40/ano (Registro.br) → apontar DNS p/ Vercel/Netlify

## Pós-publicação (incluso no pacote)
- [ ] Trocar link da bio do Instagram pelo domínio
- [ ] Cadastro no Google (Perfil da Empresa + Search Console + sitemap)
- [ ] Imprimir QR de `qrcode.html` para eventos
- [ ] 30 dias suporte prioritário

Pagamento: Pix à vista -5% ou 3x cartão. Entrada 50% + 50% entrega. Contato dev: (61) 98249-5498.
