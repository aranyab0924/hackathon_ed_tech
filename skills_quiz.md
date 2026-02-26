---
layout: page
title: Skills Quiz
permalink: /skills_quiz
---

<script src="https://cdn.tailwindcss.com"></script>

<div class="max-w-3xl mx-auto p-6 bg-slate-900 text-slate-100 rounded overflow-auto">
  <h1 class="text-2xl font-bold mb-2">Personal Skills Quiz</h1>
  <p class="text-sm text-slate-300 mb-4">Answer the questions below. Your responses are stored locally and used to update the stats radar.</p>

  <!-- Scale key -->
  <div class="mb-4 p-3 bg-slate-800 rounded text-sm text-slate-300">
    <div class="font-medium text-slate-100 mb-2">Answer scale</div>
    <div class="flex items-center gap-3">
      <div class="text-xs w-32">1 — Not at all</div>
      <div class="flex items-center gap-1">
        <div class="w-6 h-3 bg-slate-700 rounded"></div>
        <div class="w-6 h-3 bg-slate-600 rounded"></div>
        <div class="w-6 h-3 bg-indigo-600 rounded"></div>
        <div class="w-6 h-3 bg-indigo-500 rounded"></div>
        <div class="w-6 h-3 bg-emerald-500 rounded"></div>
      </div>
      <div class="text-xs ml-3">5 — Most</div>
    </div>
    <div class="text-xs text-slate-400 mt-2">Choose the number that best represents your frequency/comfort (1 low → 5 high).</div>
  </div>

  <form id="bigQuiz" class="grid gap-4">
    <!-- 12 Qs: 4 per skill (coding/agile/creativity) -->
    <div class="grid gap-3">
      <div class="text-lg font-semibold">Coding</div>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How comfortable are you reading unfamiliar code?</span>
        <select name="coding1" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How often do you write tests or check edge cases?</span>
        <select name="coding2" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How often do you refactor to improve clarity?</span>
        <select name="coding3" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How often do you contribute code reviews?</span>
        <select name="coding4" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
    </div>

    <div class="grid gap-3">
      <div class="text-lg font-semibold">Agile / Team</div>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How often do you attend sprint ceremonies?</span>
        <select name="agile1" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How comfortable are you estimating tasks?</span>
        <select name="agile2" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How often do you adapt to changing priorities?</span>
        <select name="agile3" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How often do you provide constructive feedback?</span>
        <select name="agile4" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
    </div>

    <div class="grid gap-3">
      <div class="text-lg font-semibold">Creativity</div>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How often do you propose unconventional solutions?</span>
        <select name="cre1" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How often do you prototype new ideas?</span>
        <select name="cre2" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How comfortable are you taking design risks?</span>
        <select name="cre3" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
      <label class="flex items-center justify-between bg-slate-800 p-3 rounded">
        <span>How often do you collaborate on ideation?</span>
        <select name="cre4" class="bg-slate-700 text-slate-100 rounded px-2 py-1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </label>
    </div>

    <div class="flex items-center gap-3 pt-4">
      <button id="submitBigQuiz" type="button" class="px-4 py-2 bg-indigo-600 text-white rounded">Save & Compute</button>
      <button id="clearBigQuiz" type="button" class="px-4 py-2 bg-slate-700 text-slate-100 rounded">Clear</button>
      <div id="bigQuizMsg" class="text-sm text-slate-300"></div>
    </div>
  </form>
</div>

<script>
  function normalizeAndSaveBigQuiz(formId, msgId){
    const f = document.getElementById(formId);
    const fd = new FormData(f);
    const sum = (keys) => keys.reduce((s,k)=> s + parseInt(fd.get(k)||0,10), 0);
    const coding = sum(['coding1','coding2','coding3','coding4']) / 20;
    const agile = sum(['agile1','agile2','agile3','agile4']) / 20;
    const creativity = sum(['cre1','cre2','cre3','cre4']) / 20;
    const payload = { coding, agile, creativity, savedAt: new Date().toISOString() };
    try{ localStorage.setItem('personal_skills_quiz', JSON.stringify(payload)); document.getElementById(msgId).textContent = 'Saved.'; }
    catch(e){ document.getElementById(msgId).textContent = 'Could not save.'; }
    // notify other page if open by using storage event or just reload
    setTimeout(()=> location.href = '{{ '/statspage' | relative_url }}', 300);
  }
  document.getElementById('submitBigQuiz').addEventListener('click', ()=> normalizeAndSaveBigQuiz('bigQuiz','bigQuizMsg'));
  document.getElementById('clearBigQuiz').addEventListener('click', ()=>{ localStorage.removeItem('personal_skills_quiz'); document.getElementById('bigQuizMsg').textContent='Cleared.'; setTimeout(()=> location.href='{{ '/statspage' | relative_url }}',300); });
</script>
