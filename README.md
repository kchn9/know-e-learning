![image](https://iili.io/Pbd47s.png)
# kNOW e-learning

Implementation of webapp connecting learners and mentors which want
to share their valuable knowledge by creating course and uploading it to server.


## Run Locally

Clone  from github and run it locally

```bash
  git clone https://github.com/kchn9/know-e-learning.git
  cd know-e-learning
  bin/rails s
```


## Features

- Course recording thumbnail automatic generation using **image-processing** gem and using **ffmpeg** and **libvips** on server side
- User authorization using **devise** gem
- Course searchbar created by **ransack** gem
- Every course has SEO friendly slug acheived by using **friendly_id** gem
- Categories bar allowing to filter all courses by category
- Author may mark course by many categories in more elegant way (*pillowbox*) - thanks to **select2** js lib - than using selectbox with multiple attribute
- The potential learner can see a simple (very) view of the course they are interested in
- **Active Storage** that storages all course recordings in database
## Lessons Learned

- Processing images & videos from Active Storage using image-processing gem
- Fixing turbo & devise conflicts in Rails 7, customizing devise error messages
- Many to many associations using foregin keys
- Developed my database migration skills
- Including particular modules using importmaps
- Creating search mechanism
- More in depth bootstrap knowledge
- Basic asset pipeline usage

