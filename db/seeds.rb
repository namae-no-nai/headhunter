User.create([{email:'teste@teste.com', password: 'asdasd'},
             {email:'teste2@teste.com', password: 'asdasd'},
             {email:'teste3@teste.com', password: 'asdasd'}])

Head.create([{email:'teste4@teste.com', password: 'asdasd'},
             {email:'teste5@teste.com', password: 'asdasd'},
             {email:'teste6@teste.com', password: 'asdasd'}])

Applicant.create([{full_name: 'Nome 1', social_name: 'Nome1',
                   birthdate: '11/11/1991', academic: 'Ensino Superior', 
                   description: '5 anos na area de ensino',
                   experience: 'X anos', user: User.find(1),
                   photo: Rack::Test::UploadedFile.new('app/assets/images/download.jpeg', 
                                                        'download.jpeg')},
                  {full_name: 'Nome 2', social_name: 'Nome2',
                   birthdate: '11/11/1987', academic: 'Ensino Médio', 
                   description: 'técnico em assuntos aleatórios',
                   experience: 'Y anos', user: User.find(2),
                   photo: Rack::Test::UploadedFile.new('app/assets/images/duck.jpeg',
                                                       'duck.jpeg')},
                  {full_name: 'Nome 2', social_name: 'Nome2',
                  birthdate: '11/11/1987', academic: 'Ensino Médio', 
                  description: 'técnico em assuntos aleatórios',
                  experience: 'Y anos', user: User.find(3)}])
JobVacancy.create([{title: 'Vaga sem candidatura',
                  job_description: 'Ipsu Lorem',
                  desired_skills: 'Lorem ipsum dolor sit amet',
                  income_range: 'R$1000,00 a R$2000,00',
                  job_level: 'pleno', deadline: 3.days.from_now,
                  area: 'Lorem ipsum', head: Head.find(1)},
                  {title: 'Vaga com candidatura',
                  job_description: 'Ipsu Lorem',
                  desired_skills: 'Lorem ipsum dolor sit amet',
                  income_range: 'R$1000,00 a R$2000,00',
                  job_level: 'estágio', deadline: 3.days.from_now,
                  area: 'Lorem ipsum', head: Head.find(2)},
                  {title: 'Vaga com candidatura',
                  job_description: 'Ipsu Lorem',
                  desired_skills: 'Lorem ipsum dolor sit amet',
                  income_range: 'R$1000,00 a R$2000,00',
                  job_level: 'diretor', deadline: 3.days.from_now,
                  area: 'Lorem ipsum', head: Head.find(3)}])
JobOpening.create([{letter: 'Lorem ipsum dolor sit amet, consectetur adipiscing 
                            elit. Mauris quis risus sapien. Aliquam nec nisi 
                            tincidunt, sodales mauris at, vestibulum.',
                            status: 1, applicant: Applicant.find(1),
                            job_vacancy: JobVacancy.find(2)},
                   {letter: 'Lorem ipsum dolor sit amet, consectetur adipiscing 
                    elit. Mauris quis risus sapien. Aliquam nec nisi 
                    tincidunt, sodales mauris at, vestibulum.',
                    status: 1, applicant: Applicant.find(2),
                    job_vacancy: JobVacancy.find(3)}])
Post.create([{applicant: Applicant.find(1), head: Head.find(1), 
             content: 'Lorem ipsum dolor'},
             {applicant: Applicant.find(1), head: Head.find(1), 
             content: 'Lorem ipsum silet'},
             {applicant: Applicant.find(1), head: Head.find(1), 
             content: 'Lorem ipsum'},
             {applicant: Applicant.find(2), head: Head.find(1), 
             content: 'Lorem dolor'},
             {applicant: Applicant.find(2), head: Head.find(2), 
             content: 'Dolor'},
             {applicant: Applicant.find(2), head: Head.find(3), 
             content: 'Mauris quis risus'},
             {applicant: Applicant.find(3), head: Head.find(1), 
             content: 'Ipsum dolor'}])
Favorite.create([{applicant: Applicant.find(1), head: Head.find(1)},
                 {applicant: Applicant.find(3), head: Head.find(1)},
                 {applicant: Applicant.find(2), head: Head.find(2)}])
Feedback.create([{message:'infelizmente não foi dessa vez',
                  job_opening: JobOpening.find(2)}])
JobOffer.create([{initial_date: 3.day.from_now, salary: 9001.00,
                  benefits: 'Lorem ipsum dolor sit amet, consectetur adipiscing 
                             elit. Aliquam commodo interdum nunc non porttitor. 
                             Sed elementum a lectus accumsan malesuada',
                  expectatives: 'Nulla non magna purus. Vivamus auctor 
                                 condimentum nunc vel vulputate. Aliquam erat 
                                 volutpat. Proin vehicula velit id tristique
                                 lobortis. Cras ultricies dui eu eros convallis.',
                  description: 'Vestibulum lacinia ut mi eu rutrum. Sed in 
                                tortor vitae massa fringilla consectetur.',
                  head: Head.find(3), job_opening: JobOpening.find(3)}])
