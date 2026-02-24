---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: default
---

<div class="space-y-12 py-8">
  <!-- Hero -->
  <header class="text-center pb-12">
    <div class="mx-auto max-w-4xl bg-gradient-to-r from-slate-900 via-slate-800 to-slate-900 rounded-3xl p-10 shadow-2xl ring-1 ring-black/10">
      <h1 class="text-4xl sm:text-5xl font-extrabold tracking-tight text-slate-100">
        The Elite Data Science & Engineering Intensive
      </h1>
      <p class="mt-4 text-lg sm:text-xl text-indigo-200 uppercase tracking-wide font-medium">
        Advanced Technical Training in Full-Stack Data Solutions
      </p>
      <p class="mx-auto mt-6 max-w-3xl text-base sm:text-lg text-slate-300 leading-relaxed">
        A project-based incubator moving beyond basic scripting to focus on modular architecture, data integrity, and scalable systems.
      </p>
      <div class="mt-8 flex items-center justify-center gap-4">
        <a href="{{ '/submission' | relative_url }}" class="inline-flex items-center bg-indigo-600 text-white font-semibold py-3 px-6 rounded-full hover:bg-indigo-700 transition-shadow shadow-lg">
          Submit Your Final Project
        </a>
        <a href="{{ '/discover' | relative_url }}" class="inline-flex items-center bg-white/10 text-indigo-100 font-medium py-2 px-4 rounded-lg hover:bg-white/20 transition">
          Learn more
        </a>
      </div>
    </div>
  </header>

  <!-- Highlights -->
  <section class="grid md:grid-cols-2 gap-8">
    <div class="bg-slate-800 text-slate-100 rounded-2xl p-8 shadow-inner ring-1 ring-black/20">
      <h2 class="text-2xl font-bold text-indigo-200 mb-4">The Collaborative Hackathon</h2>
      <p class="text-slate-300 leading-relaxed">
        The program culminates in a technical hackathon where teams solve real problems using high-fidelity datasets, managed through <strong>Agile methodologies</strong>, Kanban boards, and version-controlled repositories.
      </p>
    </div>
    <div class="bg-slate-800 text-slate-100 rounded-2xl p-8 shadow-inner ring-1 ring-black/20">
      <h2 class="text-2xl font-bold text-indigo-200 mb-4">Outcome-focused Curriculum</h2>
      <p class="text-slate-300 leading-relaxed">
        Modular architecture, repeatable data pipelines, and production-ready interfaces. Students build measurable, deployable projects with attention to observability and maintainability.
      </p>
    </div>
  </section>

  <!-- Competencies -->
  <section>
    <h2 class="text-3xl font-bold text-slate-100 mb-8 border-b border-slate-700 pb-2">Technical Competencies</h2>
    <div class="grid md:grid-cols-2 gap-8">
      <div class="bg-slate-800 rounded-2xl p-6 shadow-md ring-1 ring-black/20">
        <h3 class="text-xl font-bold text-indigo-300 mb-4">Data Science & Analytics</h3>
        <ul class="space-y-3 text-slate-300">
          <li><strong class="text-slate-100">Statistical Modeling:</strong> NumPy and Pandas for EDA and data manipulation.</li>
          <li><strong class="text-slate-100">Machine Learning:</strong> Neural networks and model training via Keras.</li>
          <li><strong class="text-slate-100">Database Management:</strong> Schema design and complex SQL querying.</li>
        </ul>
      </div>

      <div class="bg-slate-800 rounded-2xl p-6 shadow-md ring-1 ring-black/20">
        <h3 class="text-xl font-bold text-indigo-300 mb-4">Software Engineering</h3>
        <ul class="space-y-3 text-slate-300">
          <li><strong class="text-slate-100">Modular Code:</strong> Peer reviews and clean code to minimize technical debt.</li>
          <li><strong class="text-slate-100">Cloud Architecture:</strong> Mastering AWS Cloud Essentials.</li>
          <li><strong class="text-slate-100">Full-Stack:</strong> Connecting data backends to functional interfaces.</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- Features row -->
  <section class="grid md:grid-cols-3 gap-6 text-center">
    <div class="p-6 bg-slate-800 rounded-xl shadow-sm ring-1 ring-black/15">
      <div class="text-indigo-300 font-semibold uppercase mb-2 text-sm">Documentation</div>
      <p class="text-slate-300 text-sm">System flowcharts and data-flow diagrams.</p>
    </div>
    <div class="p-6 bg-slate-800 rounded-xl shadow-sm ring-1 ring-black/15">
      <div class="text-indigo-300 font-semibold uppercase mb-2 text-sm">Demos</div>
      <p class="text-slate-300 text-sm">Presenting MVPs and Proof of Concepts.</p>
    </div>
    <div class="p-6 bg-slate-800 rounded-xl shadow-sm ring-1 ring-black/15">
      <div class="text-indigo-300 font-semibold uppercase mb-2 text-sm">Analysis</div>
      <p class="text-slate-300 text-sm">Formal post-mortem reflection and scaling.</p>
    </div>
  </section>

  <!-- Evaluation -->
  <section class="bg-slate-800 text-slate-100 rounded-2xl p-8 shadow-xl">
    <h2 class="text-2xl font-bold mb-6">Evaluation & Industry Review</h2>
    <div class="grid sm:grid-cols-2 gap-6">
      <div class="flex gap-4 items-start">
        <span class="text-indigo-300 font-black text-2xl">01</span>
        <p><strong class="block text-indigo-200">Data Integration</strong> High-fidelity cleaning and live application usage.</p>
      </div>
      <div class="flex gap-4 items-start">
        <span class="text-indigo-300 font-black text-2xl">02</span>
        <p><strong class="block text-indigo-200">System Functionality</strong> Verified UI-to-Cloud connectivity.</p>
      </div>
      <div class="flex gap-4 items-start">
        <span class="text-indigo-300 font-black text-2xl">03</span>
        <p><strong class="block text-indigo-200">Collaborative Proof</strong> Git logs and Kanban contribution metrics.</p>
      </div>
      <div class="flex gap-4 items-start">
        <span class="text-indigo-300 font-black text-2xl">04</span>
        <p><strong class="block text-indigo-200">Deployment</strong> A live, accessible project URL.</p>
      </div>
    </div>
  </section>

  <!-- Footer / CTA -->
  <footer class="text-center pt-8">
    <p class="text-slate-400 italic mb-6">Designed to build competitive portfolios for top-tier university programs and internships.</p>
    <a href="{{ '/submission' | relative_url }}" class="inline-block bg-indigo-600 text-white font-bold py-3 px-8 rounded-full hover:bg-indigo-700 transition shadow-lg">
      Submit Final Project for Assessment
    </a>
  </footer>
</div>
