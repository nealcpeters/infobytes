require 'faker'
# HEY DO SUB_CHAPTERS NEED AN ORDER NUMBER LIKE CHAPTERS?
# FYI CODE SNIPPETS ARE JUST THE INTERNAL BITS, NO NEED TO SAVE ALL THE DIVS I WAS WRONG

user = User.create(first_name: "Abed", last_name: "Nadir", user_name: "abed", email: "abed@greendale.com", password: "password", password_confirmation: "password")
User.create(first_name: "Troy", last_name: "Barnes", user_name: "troy", email: "troy@greendale.com", password: "password", password_confirmation: "password")
User.create(first_name: "Jeff", last_name: "Winger", user_name: "jeff", email: "jeff@greendale.com", password: "password", password_confirmation: "password")
User.create(first_name: "Annie", last_name: "Edison", user_name: "annie", email: "annie@greendale.com", password: "password", password_confirmation: "password")
User.create(first_name: "Britta", last_name: "Perry", user_name: "britta", email: "britta@greendale.com", password: "password", password_confirmation: "password")


Topic.create(title: "Programming")
Topic.create(title: "Networking")
Topic.create(title: "Security")
Topic.create(title: "Unix")
Topic.create(title: "Computer Hardware")
Topic.create(title: "Raspberry Pi")

#Programming subtopics
Subtopic.create(title: "Ruby", description: "A dynamic, open source programming language with a focus on simplicity and productivity.", topic_id: 1)
Subtopic.create(title: "Python", description: "Python is a widely used general-purpose, high-level programming language.", topic_id: 1)
Subtopic.create(title: "Java", description: "Java is a class-based, object-oriented programming language developed by Sun Microsystems in the 1990s.", topic_id: 1)
Subtopic.create(title: "C", description: "A general-purpose, imperative programming language developed in the early '70s, C is the oldest and most widely used language, providing the building blocks for other popular languages, such as C#, Java, JavaScript and Python.", topic_id: 1)
Subtopic.create(title: "C++", description: "C++ is an intermediate-level language with object-oriented programming features, originally designed to enhance the C language.", topic_id: 1)
Subtopic.create(title: "C#", description: "Pronounced 'C-sharp', C# is a multi-paradigm language developed by Microsoft as part of its .NET initiative. ", topic_id: 1)
Subtopic.create(title: "Objective-C", description: "Objective-C is a general-purpose, object-oriented programming language used by the Apple operating system.", topic_id: 1)
Subtopic.create(title: "PHP", description: "PHP (Hypertext Processor) is a free, server-side scripting language designed for dynamic websites and app development.", topic_id: 1)
Subtopic.create(title: "Javascript", description: "JavaScript is a client and server-side scripting language developed by Netscape that derives much of its syntax from C.", topic_id: 1)
Subtopic.create(title: "SQL", description: "Structured Query Language (SQL) is a special-purpose language for managing data in relational database management systems.", topic_id: 1)

tutorial = Tutorial.create(title: "OOP in Ruby", description: "Everything in Ruby is an object, which makes object oriented programming in Ruby very intuitive and simple.", user_id: user.id, rating: 3, subtopic_id: 1)
intro = Chapter.create(title: "Introduction", number: 0, tutorial_id: tutorial.id)
 
chapter_one = Chapter.create(title: Faker::Lorem.word, number: 1, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(2).join(" "), chapter_id: chapter_one.id)
 
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(200))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    careLevel: undefined\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_one.id)
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(200))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Ruby", body: "class Neal \r\n    @billyJoelRating = 9000\r\n end\r\n")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
chapter_two = Chapter.create(title: Faker::Lorem.word, number: 2, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(4).join(" "), chapter_id: chapter_two.id)
  
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(150))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    underwearStatus: 'Big Person'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_two.id)
paragraph = Paragraph.create(body: Faker::Lorem.sentence(400))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    toughnessLevel: 'Ice and Blood in Beard'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)

chapter_three = Chapter.create(title: Faker::Lorem.word, number: 2, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(4).join(" "), chapter_id: chapter_three.id)
  
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(150))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    underwearStatus: 'Big Person'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_three.id)
paragraph = Paragraph.create(body: Faker::Lorem.sentence(400))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)







tutorial = Tutorial.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph(1), user_id: user.id, rating: 3, subtopic_id: 1)
intro = Chapter.create(title: Faker::Lorem.word, number: 0, tutorial_id: tutorial.id)
 
chapter_one = Chapter.create(title: Faker::Lorem.word, number: 1, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(2).join(" "), chapter_id: chapter_one.id)
 
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(200))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    careLevel: undefined\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_one.id)
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(200))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Ruby", body: "class Neal \r\n    @billyJoelRating = 9000\r\n end\r\n")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
chapter_two = Chapter.create(title: Faker::Lorem.word, number: 2, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(4).join(" "), chapter_id: chapter_two.id)
  
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(150))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    underwearStatus: 'Big Person'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_two.id)
paragraph = Paragraph.create(body: Faker::Lorem.sentence(400))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    toughnessLevel: 'Ice and Blood in Beard'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)

chapter_three = Chapter.create(title: Faker::Lorem.word, number: 2, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(4).join(" "), chapter_id: chapter_three.id)
  
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(150))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    underwearStatus: 'Big Person'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_three.id)
paragraph = Paragraph.create(body: Faker::Lorem.sentence(400))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)






tutorial = Tutorial.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph(1), user_id: user.id, rating: 3, subtopic_id: 1)
intro = Chapter.create(title: Faker::Lorem.word, number: 0, tutorial_id: tutorial.id)
 
chapter_one = Chapter.create(title: Faker::Lorem.word, number: 1, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(2).join(" "), chapter_id: chapter_one.id)
 
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(200))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    careLevel: undefined\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_one.id)
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(200))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Ruby", body: "class Neal \r\n    @billyJoelRating = 9000\r\n end\r\n")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
chapter_two = Chapter.create(title: Faker::Lorem.word, number: 2, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(4).join(" "), chapter_id: chapter_two.id)
  
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(150))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    underwearStatus: 'Big Person'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_two.id)
paragraph = Paragraph.create(body: Faker::Lorem.sentence(400))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    toughnessLevel: 'Ice and Blood in Beard'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)

chapter_three = Chapter.create(title: Faker::Lorem.word, number: 2, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(4).join(" "), chapter_id: chapter_three.id)
  
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(150))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    underwearStatus: 'Big Person'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_three.id)
paragraph = Paragraph.create(body: Faker::Lorem.sentence(400))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)






tutorial = Tutorial.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph(1), user_id: user.id, rating: 3, subtopic_id: 1)
intro = Chapter.create(title: Faker::Lorem.word, number: 0, tutorial_id: tutorial.id)
 
chapter_one = Chapter.create(title: Faker::Lorem.word, number: 1, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(2).join(" "), chapter_id: chapter_one.id)
 
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(200))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    careLevel: undefined\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_one.id)
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(200))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Ruby", body: "class Neal \r\n    @billyJoelRating = 9000\r\n end\r\n")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
chapter_two = Chapter.create(title: Faker::Lorem.word, number: 2, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(4).join(" "), chapter_id: chapter_two.id)
  
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(150))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    underwearStatus: 'Big Person'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_two.id)
paragraph = Paragraph.create(body: Faker::Lorem.sentence(400))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    toughnessLevel: 'Ice and Blood in Beard'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)

chapter_three = Chapter.create(title: Faker::Lorem.word, number: 2, tutorial_id: tutorial.id)
subchapter = SubChapter.create(title: Faker::Lorem.words(4).join(" "), chapter_id: chapter_three.id)
  
paragraph = Paragraph.create(body: Faker::Lorem.paragraph(150))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)
#code_snippet = CodeSnippet.create(language: "Javascript", body: "Neal = {\r\n    underwearStatus: 'Big Person'\r\n}")
#Content.create(sub_chapter_id: subchapter.id, order_number: 2, attachable_type: "CodeSnippet", attachable_id: code_snippet.id)
 
subchapter = SubChapter.create(title: Faker::Lorem.words(3).join(" "), chapter_id: chapter_three.id)
paragraph = Paragraph.create(body: Faker::Lorem.sentence(400))
Content.create(sub_chapter_id: subchapter.id, order_number: 1, attachable_type: "Paragraph", attachable_id: paragraph.id)