# CV Maker App

## Overview
In this project we were tasked with making a full CV Maker app that allows users to create thier own CV's, modify them as they like and choose wether to share them publicly or keep them private, all by using Supabase/Flutter.
So I introduce Mocolate, make your CV as easy as a cup of hot <b>M<b>ilk cho<b>Colate<b>.

## Signup Page
In this page the user can create a new account for themselves, by entering their full name, job field, email and password.
<br><br>

<img width="199" alt="Project7_p1" src="https://github.com/hmody360/Project-7/assets/98014312/1411c056-4d76-4cc0-8a91-998e88781997">
<br><br>

There are many states that could occur in this page like:

- State 1: The user clicked signup with one or all fields being empty:

<img width="201" alt="Project7_p2" src="https://github.com/hmody360/Project-7/assets/98014312/7b98dfcc-6d67-49e5-af82-1f50f9c3e0cc">
<br><br>

- State 2: The user inputted a wrong email format, or a password less than 6 digits:

<img width="200" alt="Project7_p3" src="https://github.com/hmody360/Project-7/assets/98014312/aef2cfbf-dd5f-4ee2-8c1a-e5bb3f5fd798">
<img width="200" alt="Project7_p4" src="https://github.com/hmody360/Project-7/assets/98014312/b6899a1b-d0f9-49f8-9d6b-0ab39ac9edb0">
<br><br>

- State 3: The user enters their info correctly and is able to make a new account(also the user can go straight into log in page if they already have an account.):

<img width="201" alt="Project7_p5" src="https://github.com/hmody360/Project-7/assets/98014312/88f9c556-387c-4104-94ef-42090f899b2e">
<img width="202" alt="Project7_p6" src="https://github.com/hmody360/Project-7/assets/98014312/442f34aa-9769-47dd-a105-6605d6ec5a8a">
<br><br>

## Login Page
In this page the user can log into their account and access all of the app's features.
<br><br>

<img width="203" alt="Project7_p7" src="https://github.com/hmody360/Project-7/assets/98014312/58541f14-0787-452d-8b34-a85dd9fae59d">
<br><br>

like the signup page, the log in page has it's own states as well, like:

- State 1: The user didn't input, or made empty field in one or both of the text fields:

<img width="203" alt="Project7_p8" src="https://github.com/hmody360/Project-7/assets/98014312/0e104a2f-38fd-45a3-a090-9bfdd04f0843">
<br><br>

- State 2: The user inputted an email that is not in email format, or a non-signed up email, and/or an invalid/incorrect password:

 <img width="201" alt="Project7_p9" src="https://github.com/hmody360/Project-7/assets/98014312/7f31592c-6bfc-436d-bc54-58b799d7281d">
<br><br>

- State 3: The user inputted thier login info and were able to log in:

<img width="200" alt="Project7_p10" src="https://github.com/hmody360/Project-7/assets/98014312/9e26a99e-aff1-4d7a-aaa3-9d34ca4f9c25">
<img width="200" alt="Project7_p11" src="https://github.com/hmody360/Project-7/assets/98014312/468879b5-7d6e-4e68-8fa6-73842b7f8e00">
<br><br>

## Home Page
In this page the user can view thier own CVs' (Yes they can have multiple CVs'), and are able to add new CVs' to thier list, as well as access thier profile page, community page, or simply sign out of thier account.
<br><br>

<img width="201" alt="Project7_p12" src="https://github.com/hmody360/Project-7/assets/98014312/31d4d60f-3ac8-475f-b550-745aeee10d1b">
<br><br>

### Profile Page
In the profile page the user can view their info
<br><br>

<img width="200" alt="Project7_p13" src="https://github.com/hmody360/Project-7/assets/98014312/0d137f9e-ed85-4d8c-9ab5-4ad9af552144">
<img width="200" alt="Project7_p14" src="https://github.com/hmody360/Project-7/assets/98014312/a77c3125-7243-4174-94e3-ee2567cd5869">
<br><br>

### Adding a new CV
The user is able to add a new CV by clicking on the '+' button at the bottom, a bottom sheet will appear and the user will be asked to fill in thier personal info, there are two states for this functionality:
<br><br>

- State 1: The user didn't fill any or all of the textfields, and clicked on 'Add CV':

<img width="203" alt="Project7_p15" src="https://github.com/hmody360/Project-7/assets/98014312/3eca68ab-87d6-4973-86dd-ebc1d0435bd7">
<img width="201" alt="Project7_p16" src="https://github.com/hmody360/Project-7/assets/98014312/a880227c-54d9-4204-8ba2-429d1822e1bc">
<img width="201" alt="Project7_p17" src="https://github.com/hmody360/Project-7/assets/98014312/3cd0f5f2-204f-466f-94f4-97aee9131d1c">
<br><br>

- State 2: The user correctly inputted all of the info, and clicked on 'Add CV':

<img width="200" alt="Project7_p18" src="https://github.com/hmody360/Project-7/assets/98014312/5fa80d9b-e018-4099-8e79-f52258c45c86">
<img width="201" alt="Project7_p19" src="https://github.com/hmody360/Project-7/assets/98014312/12e22945-6552-49a1-9fbd-032400beb2b7">
<br><br>

Now Let's go into one of the CVs' and see what's inside!

## CV Details Page
In this page the user is able to edit their selected CV, as they please, they can delete it, public/private it, edit personal info, add new sections(as many of any section), edit a section item and remove a section's item.
<br><br>

<img width="201" alt="Project7_p20" src="https://github.com/hmody360/Project-7/assets/98014312/9513e75b-e28f-4daa-9c9d-03d729d0096b">
<br><br>

### Publicsizing/Privating a CV
The user is able to see the current publication status of their CV, by looking at the eye icon on top, if the eye is crossed, it's private(default), otherwise it's public.
If the user clicks on it it's status will change between (Public <=> Private).
<br><br>

<img width="199" alt="Project7_p21" src="https://github.com/hmody360/Project-7/assets/98014312/3c578a81-671b-4132-965d-e8f4aec2ba91">
<br><br>

### Removing a CV
The user is able to remove thier CV by clicking on the trash icon at the top.
<br><br>

<img width="200" alt="Project7_p22" src="https://github.com/hmody360/Project-7/assets/98014312/910063a5-07b5-4a14-a673-194956215d0e">
<img width="200" alt="Project7_p23" src="https://github.com/hmody360/Project-7/assets/98014312/4fa335ee-3762-4234-b6dc-40626c1bae2a">
<br><br>

### Editing Personal Info
Within the CV Details page, in the personal info card, the user can click on an 'edit' button, when clicked it will display a bottom sheet with the current personal info in this CV, the user can change and Save it, if any fields is left empty, the user will get a warning message, and the info won't be editied.
<br><br>

- State 1: The user forgot to input any of the fields or inputted empty text, and clicked 'Edit':


<img width="201" alt="Project7_p24" src="https://github.com/hmody360/Project-7/assets/98014312/3f0da364-9104-485a-bac0-fa26f62486d0">
<img width="201" alt="Project7_p25" src="https://github.com/hmody360/Project-7/assets/98014312/fc73c1dd-ae44-4c66-ab89-c58965b614b4">
<img width="201" alt="Project7_p26" src="https://github.com/hmody360/Project-7/assets/98014312/1c77b057-ec6e-453f-b407-64f478ddb020">
<br><br>

- State 2: The user correctly inputted info, and the personal info is updated:

<img width="200" alt="Project7_p27" src="https://github.com/hmody360/Project-7/assets/98014312/f8ededf9-51ec-47be-95e0-d8ea2ae37aaf">
<img width="202" alt="Project7_p28" src="https://github.com/hmody360/Project-7/assets/98014312/c349e227-e563-446a-9f5a-b019683005f3">
<br><br>

### Adding a new section item
As we can currntly see, the CV only contains personal info, since the user hasn't added any section items yet, if any section item is added, its section will appear in the CV, so let's add some sections.
<br><br>

<img width="201" alt="Project7_p29" src="https://github.com/hmody360/Project-7/assets/98014312/702363d3-abd8-4697-acd5-afdb7f61c3d0">
<img width="202" alt="Project7_p30" src="https://github.com/hmody360/Project-7/assets/98014312/e4291186-9d01-495b-b712-0c7a8d7a5bcf">
<br><br>

In this example we'll be adding an education section item, the same rules apply to all other section items, when <b>adding or editing<b>:

- State 1: The user forgot to input, or inputted empty text in a textfeild or more, and tried to add:

<img width="201" alt="Project7_p31" src="https://github.com/hmody360/Project-7/assets/98014312/b8672ea0-aa3e-4916-82a9-f23535178efb">
<img width="199" alt="Project7_p32" src="https://github.com/hmody360/Project-7/assets/98014312/f9e6a8a2-ed0e-40a5-b86c-4690b79c20ab">
<br><br>

- State 2: The user inputted start date that is after the end date:

<img width="200" alt="Project7_p33" src="https://github.com/hmody360/Project-7/assets/98014312/a6b2a125-1740-44de-a7a5-b5fa2a6f77c1">
<img width="201" alt="Project7_p34" src="https://github.com/hmody360/Project-7/assets/98014312/d4601fee-263e-4d6c-b1a0-8c07762d8432">
<br><br>

- State 3: The user correctly inputted the section item's info and clicked on add:

<img width="199" alt="Project7_p35" src="https://github.com/hmody360/Project-7/assets/98014312/0afe52cd-0d5e-4ba2-b584-84e370dec76f">
<img width="200" alt="Project7_p36" src="https://github.com/hmody360/Project-7/assets/98014312/a80b5667-6a89-4e47-83df-81512afebf62">
<br><br>

### Browsing your own CV
After adding a bunch of sections with thier items, we can see the full CV, with each section seperatly, and the ability to edit or remove any one of them, also we can see a number beside each section, telling us how many items are currntly in the section, where we can scroll left and right to see all of them.
<br><br>

<img width="200" alt="Project7_p37" src="https://github.com/hmody360/Project-7/assets/98014312/cf1a5a29-2855-4767-9230-fbd877249a4c">
<br><br>

### Removing a section item
The user can click on the 'delete' button on any section item, and reomve it.
<br><br>

<img width="199" alt="Project7_p38" src="https://github.com/hmody360/Project-7/assets/98014312/83acce9a-6e73-464b-aef7-e78fdaa96b58">
<br><br>

### Editing a section item
When the user clicks on an 'edit' button on any of the section items, its respective bottom sheet, with all of its current info already inputted.
<br><br>

<img width="200" alt="Project7_p39" src="https://github.com/hmody360/Project-7/assets/98014312/64e9f4e9-8932-4fb4-9600-11dfacd4e1c9">
<br><br>

<img width="200" alt="Project7_p40" src="https://github.com/hmody360/Project-7/assets/98014312/675f2eef-9cf9-4e00-bf7b-357035e074a7">
<img width="200" alt="Project7_p41" src="https://github.com/hmody360/Project-7/assets/98014312/bf9ecbf9-0d1e-4bc4-912c-1233c6071b18">
<br><br>

## Community Page
In this page the user is able to see other user's CVs'(theirs are hidden from thier own view even if its public, it'll only show to other users in thier community page), only CVs' publcized by the user who created it, will be displayed.
<br><br>

<img width="199" alt="Project7_p42" src="https://github.com/hmody360/Project-7/assets/98014312/58c02ea6-40d8-4506-b2ab-c4142a3f4279">
<img width="200" alt="Project7_p43" src="https://github.com/hmody360/Project-7/assets/98014312/65c30975-f67e-4939-8411-ee6ab8c01790">
<br><br>

We can notice the absence of any edit/remove/add button within the community CV page view, since it's not owned by the user themselves.

### Signing out
The user can sign out by clicking on the 'signout' button on the top left of the screen, in the home page, and community page, when signed out the user has to sign in again to be able to access the app, and if the user signed in, they'll be signed in until thier token expires.
<br><br>

<img width="201" alt="Project7_p44" src="https://github.com/hmody360/Project-7/assets/98014312/51d7f4d6-1f12-4fd4-addd-1d9668d8490f">
<img width="200" alt="Project7_p45" src="https://github.com/hmody360/Project-7/assets/98014312/82f3e643-e3f0-4d31-ba1b-3397e1f663c5">
<br><br>

## Used Packages
- date_picker_plus (for a customisible date picker)
- flutter_bloc
- flutter_dotenv
- font_awesome_flutter (for cool icons)
- get_it
- get_storage
- intl (for date formatting)
- supabase_flutter

  
## P.S
Thank you for reading this, and I hope you enjoy using the app, your feedback is important, and have a great day.
