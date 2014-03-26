require 'faker'

Topic.create(title: "Programming")
Topic.create(title: "Networking")
Topic.create(title: "Security")
Topic.create(title: "Unix")
Topic.create(title: "Computer Hardware")
Topic.create(title: "Raspberry Pi")

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