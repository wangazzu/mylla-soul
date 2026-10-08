# Design System — Mylla Soul (tema "Alegria") — v1.0

Guia interno. Versão viva em `design-system.html` (fora do menu, `noindex`).
Ao criar um componente novo, adicione-o nas duas.

## 1. Cores

| Token | Hex | Uso |
|---|---|---|
| `--roxo` | `#5B3DF5` | Selos, destaques, foco, selecionado |
| `--roxo-esc` | `#3F27B8` | Sombra dura do roxo |
| `--noite` | `#2A2356` | Footer, selo-ícone, fundo lightbox |
| `--tinta` | `#2B2350` | Texto principal |
| `--amarelo` | `#FFB800` | Sol, gradientes, filetes |
| `--laranja` | `#FF7A00` | Gradientes, detalhes |
| `--coral` | `#FF5A5A` | Play de vídeo, fechar lightbox |
| `--verde-wa` | `#25D366` | Botões WhatsApp |
| `--rosa-bg` | `#FFE9F1` | Card pastel |
| `--verde-bg` | `#E4F6EA` | Card pastel |
| `--lilas-bg` | `#EBE9FF` | Card pastel, hover |
| `--amarelo-bg` | `#FFF3D6` | Card pastel |
| `--creme` | `#FFFBF3` | Fundo do site |

Regra: fundo creme/branco + tinta; roxo para selos e destaques; pastéis só em cards; gradiente amarelo→laranja só em CTAs solares.

## 2. Tipografia

- Títulos: `--font-titulo` (Baloo 2). H1 `clamp(2.1rem, 8vw, 3.4rem)`, H2 `clamp(1.6rem, 5vw, 2.3rem)`, peso 800, nunca caixa alta em H1/H2.
- Corpo: `--font` (Nunito), 1rem/1.6.

## 3. Botões

```html
<a class="btn btn-wa" data-wa href="#">WhatsApp</a>
<a class="btn btn-sol" href="#">Orçamento</a>
<a class="btn btn-roxo" href="#">Press Kit</a>
<a class="btn btn-outline" href="#">Ver vídeos</a>
<!-- .btn-sm = versão compacta -->
```

Pill + sombra dura 4px (afunda no `:active`). Só um primário (`btn-wa`/`btn-sol`) por bloco. Botões de ícone do header (44px→36px) são injetados pelo JS.

## 4. Selos, cards, formulário

```html
<span class="badge">Serviços</span>
<span class="badge badge-sol">Agenda aberta</span>

<div class="card p-lilas"><!-- p-rosa / p-verde / p-amarelo -->
  <div class="emoji">🎤</div>
  <span class="pill">Pequenos & grandes</span>
  <h3>Título</h3><p>Texto</p>
  <a class="btn btn-sol btn-sm" href="#">Ação</a><!-- margin-top:auto: botões alinhados na base -->
</div>
```

- Select nativo é substituído pelo combo JS (lista do SO não aceita estilo); data usa calendário próprio com passados bloqueados.
- Envio: `.form-status.ok` / `.form-status.erro` + `aria-live`.

## 5. Espaçamento e raios

`--space-1…16` (4…64px, base 4). Seções: `padding: var(--space-16) 0`.
`--radius-sm/md/lg/xl/pill` = 12/14/16/24/100px. Sombra `--shadow`; botões/selos com sombra dura 4px.
Âncoras: `scroll-margin-top` por causa do header fixo.

## 6. Movimento

Sol do logo pulsa 2.4s • doodles flutuam 4–6s • reveal on scroll • contadores • lightbox com foco gerenciado. Tudo desliga em `prefers-reduced-motion`.

## 7. Acessibilidade (regras duras)

- Foco sempre visível (`:focus-visible` roxo).
- `alt` real em imagens; decorativas com `aria-hidden`.
- Popups: `role=dialog`, Escape fecha, foco retorna ao botão.
- Nunca inventar depoimento de cliente — voz da equipe ou convite.
