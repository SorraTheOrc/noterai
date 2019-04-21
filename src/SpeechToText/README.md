# Speech to Text Recording

Using Azure Cognitive Services, specifically the speech services, we can easily convert speech to text.

  * Live conversion of speech to on-screen text
  * TODO: Record audio to a file
  * TODO: Online access to recordings
  * TODO: Record converted text online and display in a web accessible timeline
  * TODO: Push converted text to OneNote
  * TODO: Single click annotation of live recording with commonly used tags
  * TODO: One-click recording of a meeting/lecture from within Outlook
  * TODO: Access to recordings/notes from Outlook

# Live conversion of speech to on-screen text

Anthony Chu has a great demo project called [CaptionR](https://anthonychu.ca/post/realtime-captioning-translation-cognitive-services-signalr-azure-functions/) that uses Cognitive Services to do live captioning and translation. This was the initial inspiration for our code. It's actually pretty simple. There's a Vue.js front-end that talks to Azure Cognitive Speech Services on the back-end. This app listens for the audio, sends it to the Speech Services and displays the response in the browser.

  * TODO: don't clear the caption every time it is completed, instead append it to the results.

# Environment Setup

The following command will setup your environment and create a free tier Cognitive Services account.

```
./setup.sh
```

Note that this scriupt will output the Key you need to access your Cognitive Services account. You will need that later. You can run this script anytime to retrieve the key.

  * TODO: put the key into a configuration file so that it can later be injected into the WebApp automatically

# Running

The following script will start the WebApp on your local machine.

```
./run.sh
```

Once running you will need to copy the Cognitive Services key provided by the setup script above into the text box provided and then click start.