# Repofolio Brand

**Repofolio** — *Repos in. Portfolio out.* A bright, developer‑friendly identity built around the colorful "language bar" you see on every GitHub repo.

## Logo

| Asset | File | Use |
|-------|------|-----|
| App mark | [`assets/branding/repofolio-mark.svg`](../assets/branding/repofolio-mark.svg) | Favicons, avatars, app tiles |
| Horizontal lockup | [`assets/branding/repofolio-logo.svg`](../assets/branding/repofolio-logo.svg) | Headers, READMEs, docs |
| Repo banner (1280×640) | [`assets/branding/repofolio-banner.svg`](../assets/branding/repofolio-banner.svg) | GitHub social preview, hero |

Clear space: keep at least half the mark's height clear on all sides. Don't recolor the wordmark to a single flat color, stretch it, or place it on a busy photo without a scrim.

## Color palette

A vibrant spectrum — the full set reads as a repo language bar; the purple→pink→orange run is the primary gradient.

| Token | Hex | Role |
|-------|-----|------|
| Iris | `#6C4CF1` | Primary brand / links |
| Violet | `#9B5CF6` | Primary tint |
| Pink | `#FF4D9D` | Accent / energy |
| Coral | `#FF7A3D` | Accent |
| Amber | `#FFC53D` | Highlight / stars |
| Lime | `#37E29A` | Success / "live" |
| Cyan | `#22CFEE` | Info / cool accent |
| Ink | `#17151F` | Text / dark surfaces |
| Slate | `#5A5676` | Secondary text |
| Paper | `#FFF9F5` | Light background |

### Gradients

```css
/* Primary */
background: linear-gradient(135deg, #6C4CF1 0%, #FF4D9D 55%, #FF7A3D 100%);

/* Spectrum bar (language-bar motif) */
background: linear-gradient(90deg,
  #6C4CF1 0%, #FF4D9D 28%, #FF7A3D 52%, #FFC53D 72%, #37E29A 88%, #22CFEE 100%);
```

### CSS variables

```css
:root {
  --rf-iris:  #6C4CF1;
  --rf-violet:#9B5CF6;
  --rf-pink:  #FF4D9D;
  --rf-coral: #FF7A3D;
  --rf-amber: #FFC53D;
  --rf-lime:  #37E29A;
  --rf-cyan:  #22CFEE;
  --rf-ink:   #17151F;
  --rf-slate: #5A5676;
  --rf-paper: #FFF9F5;
}
```

## Typography

- **Display / UI:** Outfit (fallback: Poppins, system‑ui) — weights 700–800 for headings.
- **Body:** system‑ui / Segoe UI.
- **Code / accents:** JetBrains Mono.

## Voice

Confident, concise, a little playful. Lead with the outcome ("your repos, live on your site"), avoid jargon, never overpromise. Tagline: **Repos in. Portfolio out.**
