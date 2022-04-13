# The Interview Game

Topic 2 from `The iOS Interview Guide`

There are three things you need to do before you go on an interview:

- Job Search
- Marketing
- Preparation

## Job Search

There are several ways you can do this and they are not mutually exclusive.

### Job Boards and Company Websites:

The most straightforward approach to the job search is to put together a resume and portfolio and apply for positions posted on the internet. This includes online job boards and listings on Stack Overflow, LinkedIn and other profes- sional networking and recruitment websites. It is important, however, to have a good resume that makes you stand out.

Don’t blast the same resume and cover letter to every position and company you can find. To stand out you need to tweak them so that they specifically suit each job you are applying for.

### Referrals/Friends:

Having a friend or acquaintance refer you for a position is another good way to land a job. Ask everyone you know if they’ve heard of anyone who needs a developer with your skill set.

### Recruiters:

Recruiters do a great job of lifting the burden of searching for positions off your shoulders. After all, they are on your side. Sure, they get a nice payout when you land a job. It’s in their interests, though, to get you the best job they can because if you get a big salary, they can negotiate with your new employer for a bigger cut. Give them a good resume to use and make adjustments to it if they ask for them. Also, tell them what you are ideally looking for and your salary preference. Then sit back and relax and let them source new gigs for you.

Always remember, too, that if the recruiter you are working with is not produc- ing results, don’t be discouraged. Try a different one and keep searching for jobs on your own.

## Figure out what team/company size you want to work with

Team size matters. It should influence your expectations as a developer and will affect the way an interview is conducted.

### Small Company:

If they are a small startup/company (0-10 people in the engineering team) with “hackish” culture then they’ll most likely ask you about prototyping things and will expect you to “build shit quickly” disregarding quality and praising the speed. They won’t care much about good architecture and scalability or performance at early startup stage they care more about “time to market” which means quickly putting together something that works most of the time and shipping it.

The expectation on you as a developer (especially if you’ll be the sole iOS developer on the team) would be that you can deliver apps end to end - from the very first line of code down to the release submission to the app store with all the necessary provisioning profiles etc. You need to be able to figure things out quickly. Most likely you won’t be working with legacy codebases here.

### Large Company:

Interviewing at a large company (50+ people in the engineering team) you will probably be asked generic computer science questions and sometimes interviewers won’t even go into iOS-specifics.

Big organizations have typically already figured out what their product is and are scaling product and market- ing efforts. For you, this means that the interview is likely to revolve around hypothetical problem-solving and scalability.

Large organizations care about the performance impact of file downloads, network requests, and other compu- tations made on the client side. Unlike small organizations, there most likely will be time for doing optimizations.

Timelines in bigger organizations are longer and typically they are looking for people to fill specialized roles. You’ll often find that large organizations like Facebook or LinkedIn are looking for developers (and even entire teams) to focus on things like UI performance, net- working download speeds or other deeper specializations in iOS software that smaller companies can’t spend time on. Also expect to be working with legacy codebases.

### Mid-size Company:

When applying to a mid-size company (10 - 50 people), you should expect a mix of what small companies need and big companies expect. Mid-size com- panies are not big enough to spare resources on people who specialize in things like performance but aren’t small anymore to move super fast and risk breaking things. They’ll expect you to be a well-rounded and balanced developer.

As with a small company, in most cases you will be expected to build and ship things end-to-end but you will also have to keep an eye on performance, scal- ability, and architecture for future maintainability. If you interview at a good mid-size company, the questions are likely to encompass all of these areas as well as cover broad iOS, architecture and CS knowledge. They need someone whose talents go beyond shaving microseconds off networking performance or scrolling in table views.

> The main message here is that you should figure out what type of company and team you’d like to join ahead of time and prepare for your interview accord- ingly. Regardless of your choice, though, the advice in the following chapters about interview questions on UI, Networking, Storage, and other technical iOS topics will help you prepare for interviews at any company regardless of its size.

## Marketing

This is something that most developers neglect. When you’re aiming at your dream job, you need to stand out from the crowd if you want to get a foot in the door. The way to do this is through marketing yourself with your resume, your blog, your GitHub profile, and other links and resources that showcase you as a great developer and an appealing candidate.

### Resume

The main purpose of a resume is to briefly show that you have relevant experi- ence for the position you’re applying for. It won’t get you the job though, you will still have to interview but it will increase your application response rate.

HR departments and other people involved in hiring devs typically get hundreds of resumes a day and have very limited time to spend on each one. Therefore, keep your resume under two pages.

### Do's

If you’re applying to a US company, your resume structure should probably be as follows:

1. Your name and contact information, such as e-mail and phone number, should go at the very top. Below these you should add links to your blog and profiles on GitHub.
2. Your work experience. Include the names of companies you’ve worked at and your positions along with the dates of your employment. Also, add a very short (one or two sentence) description of what you did along the lines of, “I was working on the main iOS app and successfully imple- mented integration with internal JSON API”. You can also mention one or two big technologies or architectural concepts you used at each job.
3. Your personal projects. This would include any relevant interesting stuff you’ve done aside from paid work.
4. Your education. State the name of the college or university.
5. Optionally, you can also have a section with any special expertise you have that might be relevant. In my resume, for example, I have Functional Reactive Programming (FRP) and SOLID principles. This section is not essential and can be omitted if it makes your resume too long or complicated.

### Don’ts:

Do NOT include the following things in your resume:

- photo of yourself
- marital status
- date of birth
- career objective

The first three of these from your re- sume you can avoid sources of negative bias. As for stating your career objective, it’s just filler that no-one cares about in a resume. If an employer is interested, they’ll ask you at the interview.

### References:

Don’t include references in your resume but have a few available. Offer to provide them upon request.

### Cover Letter

Cover letters are important. When you apply directly for jobs, the cover letter will be the first impression you make. The company sees that you’ve taken the time to craft a cover letter for the company and the position you’re applying for, you’ll greatly increase your chances of getting an interview. In more general terms, keep your cover letter succinct, to the point and, for God’s sake, spell check!

Writing a good cover letter means doing your research. Unless you already know everything you need to know about the company you’re applying to, Google it a lot. Find out what their team size is and what tech they work with. Read any technical and product blogs they have. Most importantly of all, research and, if possible, try out the product they make. You can’t imagine how many developers are disregarded for jobs simply because they show no interest in the products made by the company they’re applying to.

### Github

Your code speaks more loudly about you than anything else. GitHub is the de facto standard for code version control nowadays. Not only should you know how to use git well enough, you should also have an up-to-date GitHub profile.

For some companies GitHub is the main tool used for filtering out applicants for developer jobs. Having an active GiHub account shows that you’re a part of the software developer tribe and active in that community.

Your GitHub profile should have a very short description of what you can do and showcase what you’ve worked on. Potential employers find it handy to go to someone’s GitHub profile and see their code before deciding whether to invite them for an interview.

### Blog

Your blog can also help you stand out. If you regularly blog, it’s easier for others to put you in a bucket of professionals. Share everything you learn. If you’ve just read an article about MVVM and tried it in your app, blog about it. If you found a new cool pod that helps with animation, blog about that. Just like your GitHub profile, your blog helps communicate your skills and your value to potential employer before you even meet the person who’s going to interview you. Trust me, there’s a special feeling you get when an interviewer casually says that they read something on your blog that they found useful or they want to talk about. Use blogging to your advantage!

## Preparation

Aside from the job search and marketing, the most important thing you need to do before every interview is to prepare and learn as much iOS stuff as you can. Tech skills and soft skills are actually what you’ll need day-to-day on your job so you’ve got to be ready.

### At The Interview

When you’re interviewing with a company you’ll actually have multiple inter- views at different stages of the process. Typically these break down into the following steps: **phone intro, phone/skype/hangout/voip interview, onsite interview,** and optional **negotiation interview.**

### Phone Intro

The phone intro is the first thing you’ll have after company you applied to ex- presses interest in you. Its purpose is to allow you and the company to get acquainted and see if your mutual goals are aligned. Generally speaking, a company will try to sell themselves to you as a great place to work and si- multaneously gauge your level of excitement and eagerness to work with them or in the field they specialize in. Don’t stress too much about this interview. There won’t be any technical questions and you’ll only be expected to briefly talk about your previous experience. Have a quick and short summary of it in mind and don’t get into lengthy details about what you’ve done before. You should have a few questions ready about the company interviewing you. They wouldn’t want to hire someone who’s not interested in them. Typically, this interview takes only 15 to 30 minutes.

### Phone and/or Skype/Hangout/Voip Interview

A second interview can take various forms. Typically it is a technical interview that could either be purely Computer Science-oriented (i.e., about algorithms, data structures, etc.), or iOS-oriented (iOS tech questions with short answers to gauge your overall knowledge). It might also have a mix of both. These in- terviews can be either over the phone, so you’d be expected to just talk, or they could be conducted via Skype, Google Hangouts or another VoIP service. You might be asked to use VoIP so you can share your screen and the interviewer can see what you’re typing while you solve a problem they’ve given you.

These interviews are typically not as crazy hard as you might think and they usually take from 30 minutes to an hour. If they take longer than this that can be a good sign.

It’s okay to ask the interviewer to repeat a question that you didn’t understand. If they give you a problem to solve, talk through your solution before typing it out. Usually, the interviewer just wants to understand how you think rather than see you get the right answer of the bat.

I have one other important piece of advice if you are asked to interview via a VoIP service: ensure that you have a stable internet connection (preferably through a cable because WiFi is unreliable) and a quiet spot to talk for an hour because you don’t want the interview to get interrupted or cut off in the middle.

### Onsite Interview

Onsite interviews are generally the hardest and longest. The interview style, questions, organization, and other details will vary from one company to another depending on their size and culture. In general, though, expect there to be at least one whiteboarding session (with or without CS and iOS questions, architectural discussion and problem solving), one or more pair programming sessions or a mix of each of these.

Dress well to make a good impression, even if you’re going to a hip startup in Silicon Valley.

Even if you’ve asked questions in a previous interview about the company and the team that you could be working with, prepare more. You will be given a chance to ask them and they will show the extent of your interest in working specifically for the company that is interviewing you.

### Whiteboarding

Whiteboarding can be intimidating for people but don’t get discouraged. It’s not an exam and you’re not in school anymore. What interviewers really want to see is how you tackle problems and how well you know iOS stuff. Take a deep breath, be calm, and talk your solutions through. Ask questions if you need to clarify something.

### Pair Programming

Pair programming is one of the best ways to gauge a candidate’s level of ex- perience and general cultural fit. That’s because it’s the closest thing possible to what the interviewee will actually be doing on the job if hired. The same advice applies here as with other types of interviews: be calm, don’t hesitate to ask questions, and talk your solutions through because your interviewer will want to know how and why you’ve decide to write a particular piece of code before you do it.

### Salary Negotiation Interview

A salary negotiation interview sometimes happens right after your on-site in- terview or might occur later over the phone or VoIP. Negotiating is usually the hardest thing for developers to do and many simply agree to whatever is of- fered. There’s a lot of benefit to be gained from discussing salary, though.

### Importance of Soft Skills

So called “soft skills” are a set of your skills such as people skills, communi- cation skills, productivity skills, organizational skills, attitudes and emotional intelligence (EQ). In other words, anything that is not directly related to, but is just as important as, your “hard skills” or technical knowledge. Sometimes teams will prefer someone who is a great communicator over a coding genius who can’t get along with others. So, in your interviews be at your best and smile to make a good impression on the people you’re interviewing with

### Keep Track of Progress

Finally, I highly recommend to have a Trello board for your job search to keep track of progress, e-mails, and phone calls about the jobs you’re interviewing for.
