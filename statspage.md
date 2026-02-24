---
Title: Individual Stats Page
permalink: /statspage
layout: default
---

<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap" rel="stylesheet">

<style>
  :root {
    --ice-blue:    #a8d8ea;
    --glacier:     #7ec8d8;
    --frost:       #d6eef5;
    --polar-teal:  #4aadbe;
    --aurora:      #62c6b0;
    --iceberg-mid: #5b9eb5;
  }

  #statspage-root,
  #statspage-root * { font-family: 'DM Sans', ui-sans-serif, system-ui, sans-serif !important; }

  .radar-dot { cursor: pointer; transition: r 0.2s; }
  .radar-dot:hover { r: 10; fill: #1e4d65; }
</style>

<div id="statspage-root">

<!-- Page heading -->
<div class="mb-8 border-b border-slate-700 pb-5">
  <h1 class="text-xl font-medium text-slate-100 tracking-tight">Skills Overview</h1>
  <p class="text-slate-500 text-sm font-light mt-1">Proficiency based on assignment & lesson completion</p>
</div>

<!-- Radar -->
<div class="flex justify-center">
  <svg id="radar-svg" viewBox="0 0 520 520" width="100%" style="max-width:460px"
       aria-label="Developer Skills Radar Chart">
    <defs>
      <radialGradient id="radarFill" cx="50%" cy="50%" r="50%">
        <stop offset="0%"   stop-color="#1a6a88" stop-opacity="0.30"/>
        <stop offset="100%" stop-color="#2a7a96" stop-opacity="0.12"/>
      </radialGradient>
      <radialGradient id="bgGrad" cx="50%" cy="50%" r="50%">
        <stop offset="0%"   stop-color="#e8f7fb" stop-opacity="1"/>
        <stop offset="100%" stop-color="#9dd8e8" stop-opacity="1"/>
      </radialGradient>
    </defs>
    <!-- Ice blue background circle -->
    <circle cx="260" cy="260" r="258" fill="url(#bgGrad)" />
    <g id="grid-lines"></g>
    <g id="axis-lines"></g>
    <polygon id="radar-shape"
             fill="url(#radarFill)"
             stroke="#2a7a96"
             stroke-width="3"
             stroke-linejoin="round"/>
    <g id="dots"></g>
    <g id="axis-labels"></g>
  </svg>
</div>

<!-- Score legend -->
<div id="legend" class="mt-8 grid grid-cols-2 sm:grid-cols-3 gap-2"></div>

</div><!-- #statspage-root -->

<script>
// ─────────────────────────────────────────────────────────
//  SKILLS DATA
//  To connect to a backend replace this object with:
//
//    const res = await fetch('/api/skills');
//    const SKILLS_DATA = await res.json();
//    drawRadar(SKILLS_DATA);
//
//  Expected shape: { "Skill Name": 0.0–1.0, ... }
// ─────────────────────────────────────────────────────────
const SKILLS_DATA = {
  "Git Management":          0.82,
  "Python APIs":             0.75,
  "Java OOP":                0.61,
  "SQL":                     0.88,
  "Documentation/Planning":  0.70,
  "Soft Skills":             0.91,
};

const CX = 260, CY = 260, R = 162, LEVELS = 5;

function angle(i, n) { return (Math.PI * 2 * i) / n - Math.PI / 2; }
function polar(v, i, n) {
  const a = angle(i, n);
  return { x: CX + v * R * Math.cos(a), y: CY + v * R * Math.sin(a) };
}
function svgEl(tag) { return document.createElementNS('http://www.w3.org/2000/svg', tag); }

function drawRadar(data) {
  const labels = Object.keys(data);
  const values = Object.values(data);
  const n = labels.length;

  // ── Grid rings ──────────────────────────────────────────
  const gridG = document.getElementById('grid-lines');
  gridG.innerHTML = '';
  for (let lvl = 1; lvl <= LEVELS; lvl++) {
    const frac = lvl / LEVELS;
    const pts = Array.from({ length: n }, (_, i) => {
      const p = polar(frac, i, n);
      return `${p.x},${p.y}`;
    }).join(' ');

    const poly = svgEl('polygon');
    poly.setAttribute('points', pts);
    poly.setAttribute('fill', 'none');
    poly.setAttribute('stroke', lvl === LEVELS
      ? 'rgba(30,90,120,0.45)'
      : 'rgba(30,90,120,0.18)');
    poly.setAttribute('stroke-width', lvl === LEVELS ? '2.5' : '1.5');
    gridG.appendChild(poly);
  }

  // ── Axis lines ──────────────────────────────────────────
  const axisG = document.getElementById('axis-lines');
  axisG.innerHTML = '';
  for (let i = 0; i < n; i++) {
    const p = polar(1, i, n);
    const line = svgEl('line');
    line.setAttribute('x1', CX); line.setAttribute('y1', CY);
    line.setAttribute('x2', p.x); line.setAttribute('y2', p.y);
    line.setAttribute('stroke', 'rgba(30,90,120,0.25)');
    line.setAttribute('stroke-width', '2');
    axisG.appendChild(line);
  }

  // ── Data polygon ────────────────────────────────────────
  const pts = values.map((v, i) => {
    const p = polar(v, i, n);
    return `${p.x},${p.y}`;
  }).join(' ');
  document.getElementById('radar-shape').setAttribute('points', pts);

  // ── Vertex dots ─────────────────────────────────────────
  const dotsG = document.getElementById('dots');
  dotsG.innerHTML = '';
  values.forEach((v, i) => {
    const p = polar(v, i, n);
    const c = svgEl('circle');
    c.setAttribute('cx', p.x);
    c.setAttribute('cy', p.y);
    c.setAttribute('r', '7');
    c.setAttribute('fill', '#2a7a96');
    c.setAttribute('stroke', '#e8f7fb');
    c.setAttribute('stroke-width', '3');
    c.classList.add('radar-dot');
    c.setAttribute('aria-label', `${labels[i]}: ${Math.round(v * 100)}`);
    dotsG.appendChild(c);
  });

  // ── Axis labels (DM Sans via foreignObject) ─────────────
  const labG = document.getElementById('axis-labels');
  labG.innerHTML = '';
  labels.forEach((lbl, i) => {
    const a = angle(i, n);
    const p = {
      x: CX + (R + 40) * Math.cos(a),
      y: CY + (R + 40) * Math.sin(a),
    };
  const fo = svgEl('foreignObject');
    fo.setAttribute('x', p.x - 66);
    fo.setAttribute('y', p.y - 22);
    fo.setAttribute('width', '132');
    fo.setAttribute('height', '48');
    fo.innerHTML = `
      <div xmlns="http://www.w3.org/1999/xhtml"
           style="text-align:center;
                  font-family:'DM Sans',ui-sans-serif,system-ui,sans-serif;
                  font-size:13px;font-weight:400;letter-spacing:-0.01em;
                  color:#1e4d65;line-height:1.4;word-break:break-word;">
        ${lbl.replace('/', '/<br>')}
      </div>`;
    labG.appendChild(fo);
  });

  // ── Legend ───────────────────────────────────────────────
  const legendEl = document.getElementById('legend');
  legendEl.innerHTML = '';
  labels.forEach((lbl, i) => {
    const pct = Math.round(values[i] * 100);
    const div = document.createElement('div');
    div.className = 'flex flex-col gap-2 py-3 border-b border-slate-700';
    div.innerHTML = `
      <div class="flex items-center justify-between">
        <span class="text-slate-400 text-sm font-light">${lbl}</span>
        <span class="text-sm font-medium tabular-nums" style="color:#a8d8ea">${pct}</span>
      </div>
      <div class="h-0.5 w-full rounded-full bg-slate-700 overflow-hidden">
        <div class="h-full rounded-full"
             style="width:${pct}%;background:linear-gradient(to right,#4aadbe,#62c6b0)">
        </div>
      </div>`;
    legendEl.appendChild(div);
  });
}

drawRadar(SKILLS_DATA);
</script>