Original App Design Project - README Template
===
Sprint 1 GIF: https://submissions.us-east-1.linodeobjects.com/ios102/-yMlvPZ6.gif

# Memo

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Memo is an app that provides different flashcard sets to help users practice their skills.


## Initial Brainstorming Ideas
When coming up with an idea for this project, our group was able to quickly come to an agreement on the type of app we wanted to make. We were interested in making something educational but simple to interact with.
Some TOP ideas we came up with:
1. An educational game -- perhaps something like a game that allows users to play a variety of card games to teach them logic and strategy. We did find that many apps of this type exist on the app store, and it may be difficult to implement more complex features like networking into this app.
2. A typing practice app -- many programs/websites of this sort exist for computers, but apps to help people practice typing on their phones are not nearly as common. Again, we felt that this app might be too simple of a project to do.
3. FINAL APP IDEA: A flashcards app -- this is what we ultimately decided on. It is true that other apps of this sort exist, but the complexity of such an app, combined with networking features, was a good fit for our goals and for the scope of the project we wanted to make.

Other ideas:
1. Social app to share interesting internet articles with friends
2. More simple version of the flashcards app but catered to a smaller topic, like math or languages

We ended up choosing to make a flashcards app, deciding on the name Memo.

### App Evaluation

- **Category: Education**
- **Mobile: This is mainly developed for iPhones, but it does have the potential to be used by other devices as much of the user data is stored in our database.**
- **Story: As students, we have all used quizlet to study for upcomming quiz and test. However, since quizlet is mainly webbased app, we determind that a ios based Memo app is needed.**
- **Market: The app is directed towards students, as it is very useful for memorizing and studying course material.**
- **Habit: Users do not have to use this app everyday, but the more they use it, the more they benefit from it.**
- **Scope: This app has the potential to evolve into more educational features. For example, we could implement additional ways to use the flashcard material. It could also be distributed as a tool to classrooms, where teachers can see students' scores and use it to gauge their understanding of course content.**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can browse flashcard decks.
* User can click on individual flashcards and view the term and description.
* User can create an account.
* User can log in to a created account.

**Optional Nice-to-have Stories**

* User can create their own flashcard deck and share it with others.
* User can view and use others' flashcard decks.
* User can add their own customizations to the app look, such as a customized background or color scheme

### 2. Screen Archetypes

* Login Screen
   * User can log in to a created account.
* Sign-Up Screen
    * User can create an account.
* Flashcard Home Screen
   * User can browse flashcard decks.
   * [Optional] User can view and use others' flashcard decks.
* Flashcard View Screen
    * User can click on individual flashcards and view the term and description.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* If Optional features are implemented:
    * Flashcard Home Screen -- View only favorited/saved decks
    * Flashcard Browsing Screen -- View all decks from others

**Flow Navigation** (Screen to Screen)

* Login Screen
   => Flashcard Home Screen
* Sign-Up Screen
   => Flashcard Home Screen
* Flashcard Home Screen
    => Flashcard View Screen

## Wireframes
![Wireframe_Sketch](https://user-images.githubusercontent.com/22327307/226234496-7ca09b9c-80be-464d-9fb5-cb779abf3ca9.png)

### [BONUS] Digital Wireframes & Mockups
![Wireframe_Digital](https://drive.google.com/uc?export=view&id=1lO15p6fqpU4P5BrmkTI1tDEYpHxYKAuZ)

## Schema 
[This section will be completed in Unit 9]
### Models
![Model](https://drive.google.com/uc?export=view&id=1v31hXW8Xq93CjY3-fPT4P3Mogg6MIq05)
### Networking
- Log In Screen
    - Must make request to API to verify user credentials
- Sign Up Screen
    - Must make request to API to initialize new account
- Flashcard Home Screen
    - Must make request to API to download names of flashcard sets
- Flashcard View Screen
    - Must make request to API to download flashcard data
 
### Demo
![Kapture 2023-04-10 at 02 15 37](https://user-images.githubusercontent.com/22327307/230839757-3dbadace-a574-4915-9496-92e17c25a9ab.gif)
