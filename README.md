NoterAI uses Azure Cognitive Services and Office 365 to help cope with ADHD (by the way, this means it would be helpful for non-ADHD folks too).

At this stage this is just experiments, but like all experiments it might turn into something real, at the very least we'll learn some stuff. We would love it if you are inspired and want to learn with us. Let's see where we go.

## README driven development

This project uses the documentation to drive development. That is, this README is the development plan. There are things described in this document that don't exist yet and there are know limitations within the things that do exist. You can tell which is which by reading tags in feature lists and headings, such as `TODO:` and `FIXME:`. 

`TODO:` means the feature has not yet been implemented. Discussion about how to implement it and pull requests that document these discussions or implement the feature are very welcome.

`IN PROGRESS:` means the feature is currently in development. Testing and feedback, along with discussion about how to implement it and pull requests that document these discussions or help implement the feature are very welcome.

`FIXME:` describes a known limitation or bug in the existing implementtion. Discussion about how to fix this and pull requests that document these discussions or implement the fix are very welcome.

The absence of a tag on a feature heading means the feature is considered mature enough to be useful. You may well find features within the parent feature that have status tags though.

Another commonly used tag is `REFACTOR` which records the need to change the way a feature is implemented based on the fact that the code smells. Having too many `REFACTOR` tags is a sign of technical debt, so please, please, help us remove these by submitting patches.

## Organization Features

One of the common challenges people with ADHD face is organizational skills. That said, being organized as an ADHD sufferer is not really different to being organized without ADHD. Tooling can help us all. The organization features of NoterAI are designed to help you take notes that are actually useful. For everyone, but especially ADHD people, staying focussed enough to take notes in a meeting, classroom or lecture hall is extremely difficult. The items in this section are designed to help with this task. 

### Note Taking

Being able to record audio of meetings is great, but all you have at the end is 60 minutes of talking. What we really need is an annotated recording that allows us to quickly find the part of the recording that is important. But annotation requires us to be focussed enough to be listening in the first place. We could, of course, go through the recording later but we still need to focus for 60 minutes (a second 60 minutes at that).

With modern Speech to Text services it is possible to have a computer take those recordings and turn them into text. That text can then be searched for keywords to automatically annotate and play back the appropriate part of the recording. For example, searching for the worda "Homework" or "Action Item" would be very useful. Later when doing the homework or actions we can search for the keywords in that item to find the point in the meeting or lecture at which it was discsussed.

Useful features might include:

  * TODO: Record audio and send it to OneNote
  * IN PROGRESS: Perform speech to text conversion
  * TODO: Perform near real-time speech to text conversion
  * TODO: Manualy annotate a recording with labels in real-time or on play-back

#### Speech to Text Recording

Using Azure Cognitive Services, specifically the speech services, we can easily convert speech to text.

  * IN PROGRESS: Live conversion of speech to on-screen text
  * TODO: Record audio to a file
  * TODO: Online access to recordings
  * TODO: Record converted text online and display in a web accessible timeline
  * TODO: Push converted text to OneNote
  * TODO: Single click annotation of live recording with commonly used tags
  * TODO: One-click recording of a meeting/lecture from within Outlook
  * TODO: Access to recordings/notes from Outlook

##### IN PROGRESS: Live conversion of speech to on-screen text

Anthony Chu has a great demo project called [CaptionR](https://github.com/anthonychu/captionr) that uses Cognitive Services to do live captioning and translation. Currently our implementation of speech to text uses his code (just the Speech to Text part). It's actually pretty simple. There's a Vue.js front-end that talks to Azure Cognitive Speech Services on the back-end. This app listens for the audio, sends it to the Speech Services and displays the response in the browser.

REFACTOR: The source for this can be found in the `src/SpeechToText` folder (currently we reuse CaptionR's full source code)

## Running NoterAI

Our goal is to make it as easy as possible to run NoterAI. But like all small projects there will almost certainly be "works on my machine" problems. Please don't hesitate to ask for help if things aren't working for you. We provide a set of scripts (currently developed on Debian Linux, pstches welcome for other operating systems). These scripts fall into two broad categories:

  * Environment Setup - Used to ensure all necessary dependencies are on your machine
  * Application Setup - Used to install specific parts of the overall NoterAI application

### Environment Setup

Install and configure the Azure `az` cli. This is usef to configure and manage Azure resources.

```
source ./scripts/azure.sh
installAzureCLI
azure login
```

Install .NET Core as some of the tooling is provided in C#, though none of the code in this project is C#.

```
source ./scripts/netCore.sh
installDotNETCore
```

Install Node. Many of the backend services are written in Node.

```
source ./scripts/node.sh
installNode
```

Some of the features we use are implemented in Azure Functions. During development (and sometimes at runtime) it is useful to be able to run these functions locally. Functions Core Tools allows us to do this.

```
source ./scripts/functions.sh
installFunctionsCoreTools
```

## Setup the application

Configure the evironment with common environment variables to make it easy to execute scripts in isolation:

```
./configuration.sh
```

Setup the Azure infrastructure needed for NoterAI.

```
./setupAzure.sh
```

Setup the Speech To Text features:

```
./setupFunction.sh
./setupNoraryai.sh
```