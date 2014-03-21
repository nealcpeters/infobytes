# HEY DO SUB_CHAPTERS NEED AN ORDER NUMBER LIKE CHAPTERS?
# FYI CODE SNIPPETS ARE JUST THE INTERNAL BITS, NO NEED TO SAVE ALL THE DIVS I WAS WRONG

user = User.create(first_name: "Han", last_name: "Solo", user_name: "rebel_scum", email: "han@aliance.com", password: "password", password_confirmation: "password")

Topic.create(title: "Programming")
Topic.create(title: "Networking")
Topic.create(title: "Security")
Topic.create(title: "Unix")
Topic.create(title: "Computer Hardware")

Subtopic.create(title: "Ruby", description: "A dynamic, open source programming language with a focus on simplicity and productivity.", topic_id: 1)
Subtopic.create(title: "Python", description: "Python is a widely used general-purpose, high-level programming language.", topic_id: 1)
Subtopic.create(title: "Data Network", description: "A computer network or data network is a telecommunications network that allows computers to exchange data.", topic_id: 2)
Subtopic.create(title: "Network Nodes", description: "Network computer devices that originate, route and terminate the data are called network nodes.", topic_id: 2)

Tutorial.create(title: "How to Be Amara", description: "A detailed tutorial on how to be the most gnarly land lubber of a poodle", user_id: 1, rating: 3, subtopic_id: 1)
Tutorial.create(title: "How to Be Eric", description: "A detailed tutorial on how to be the most gnarly land lubber of a historian", user_id: 1, rating: 3, subtopic_id: 1)
Tutorial.create(title: "How to Be Matt", description: "A detailed tutorial on how to be the most gnarly land lubber of a freight train", user_id: 1, rating: 3, subtopic_id: 2)
tutorial = Tutorial.create(title: "How to Be Neal", description: "A detailed tutorial on how to be the most gnarly land lubber of a sailor", user_id: 1, rating: 3, subtopic_id: 2)
intro = Chapter.create(title: "Introduction", number: 0, tutorial_id: tutorial.id)
 
ch_one = Chapter.create(title: "Not Giving a Fuck", number: 1, tutorial_id: tutorial.id)
sub = SubChapter.create(title: "Emotion is Overated", chapter_id: ch_one.id)
 
x = Paragraph.create(body: "Seriously do not care. You should take more care in where the wind is blowing on Mars than if some is sad that you killed their puppy.")
Content.create(sub_chapter_id: sub.id, order_number: 1, attachable_type: "Paragraph", attachable_id: x.id)
x = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    careLevel: undefined\r\n}")
Content.create(sub_chapter_id: sub.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: x.id)
 
sub = SubChapter.create(title: "Ignoring Crying Babies", chapter_id: ch_one.id)
x = Paragraph.create(body: "Wear earbuds while listening to Billy Joel")
Content.create(sub_chapter_id: sub.id, order_number: 1, attachable_type: "Paragraph", attachable_id: x.id)
x = CodeSnippet.create(language: "Ruby", body: "class Neal \r\n    @billyJoelRating = 9000\r\n end\r\n")
Content.create(sub_chapter_id: sub.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: x.id)
 
ch_two = Chapter.create(title: "Sailing", number: 2, tutorial_id: tutorial.id)
sub = SubChapter.create(title: "Getting On A Boat", chapter_id: ch_two.id)
  
x = Paragraph.create(body: "Put on you big person underwear")
Content.create(sub_chapter_id: sub.id, order_number: 1, attachable_type: "Paragraph", attachable_id: x.id)
x = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    underwearStatus: 'Big Person'\r\n}")
Content.create(sub_chapter_id: sub.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: x.id)
 
sub = SubChapter.create(title: "Ignoring Crying Babies", chapter_id: ch_two.id)
x = Paragraph.create(body: "They will be on the seas....be prepared")
Content.create(sub_chapter_id: sub.id, order_number: 1, attachable_type: "Paragraph", attachable_id: x.id)
x = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    toughnessLevel: 'Ice and Blood in Beard'\r\n}")
Content.create(sub_chapter_id: sub.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: x.id)