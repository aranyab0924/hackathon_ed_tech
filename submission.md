---
Title: Hackathon Submission Page
Permalink: /submission
layout: default
---

<div class="block max-w-xl rounded-2xl border border-gray-500 bg-gray-700 p-8 text-center text-gray-100 shadow-lg">
  <h5 class="mb-4 text-3xl leading-9 font-semibold tracking-tight text-gray-100">Submit Your Project </h5>
  <p class="mb-6 text-lg text-gray-200">Submit your final project link to be assessed!</p>
  <form action="/submit-your-link-handler" method="POST" class="link-submission mt-4">
    <label for="user-link" class="sr-only">Paste your link</label>
    <div class="flex flex-col items-center justify-center gap-3 sm:flex-row">
      <input type="url" id="user-link" name="user-link" placeholder="https://example.com" required class="mx-auto w-full rounded-lg border border-gray-600 bg-gray-800 px-4 py-3 text-base text-gray-100 placeholder-gray-400 sm:w-3/4 md:w-2/3" />
      <button type="submit" class="inline-flex items-center rounded-lg bg-indigo-600 px-5 py-3 text-base leading-6 font-medium text-white shadow-md hover:bg-indigo-700 focus:ring-4 focus:ring-indigo-300 focus:outline-none">Submit</button>
    </div>
  </form>
</div>