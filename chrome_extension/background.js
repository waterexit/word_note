// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Add a listener to create the initial context menu items,
// context menu items only need to be created at runtime.onInstalled
chrome.runtime.onInstalled.addListener(async () => {
  chrome.contextMenus.create({
    id: "add",
    title: "add word_note",
    type: "normal",
    contexts: ["selection"],
  });
});

// Open a new search tab when the user clicks a context menu
chrome.contextMenus.onClicked.addListener((item, tab) => {
  //TODO user can set rails server url
  const url = new URL(`http://localhost:3000/words`);
  let data = { word: { word: item.selectionText } };
  fetch(url, {
    method: "post",
    headers: { "content-type": "application/json" },
    body: JSON.stringify(data),
  }).then((res) => console.log(res)).catch((e) => console.log(e));
});
