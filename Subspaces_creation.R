# Description: 
# This script extracts specific words from pre-built semantic spaces. After re-ordering them, 
# it builds cosine similarity matrices for each language from the original vectorial representations.
# The words are manually selected trying to be the most comparable between languages.

# Note: 
# Adjust the script parameters, such as the directories, as needed for your specific use case.


#############################

# Import necessary libraries
# The package can be downloaded from Günther et al. (2015) https://sites.google.com/site/fritzgntr/software-resources/r_packages
install.packages("LSAfun")
library(LSAfun)

# The semantic spaces can be downloaded from https://sites.google.com/site/fritzgntr/software-resources/semantic_spaces
# English cbow space, 400 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/baroni.rda")

# Italian cbow space, 400 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/itwac_cbow.rda")

# French HAL space, 300 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/frwak100k.rda")

# German cbow space, 400 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/dewac_cbow.rda")

# Spanish cbow space, 400 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/es_cbow.rda")

# Croatian cbow space, 300 dimensions
load("/Users/francesca/PycharmProjects/HLT_project/Semantic_Spaces/hr_cbow.rda")

#############################

# # ENGLISH

# English sub-space vector with selected words
words_eng <- c('bimbo', 'nymphomaniac', 'mistress', 'slave', 'transvestite', 'masculinity', 'feminine', 'women', 'gay', 'transgender',
    'homosexuality', 'homosexual', 'intersex', 'bisexuality', 'homophile', 'cant', 'hermaphroditic', 'snoopy', 'bitchy',
    'invert', 'girl', 'boy', 'ms', 'mrs', 'mister', 'ball', 'vogue', 'sinful', 'religiosity',
    'chastity', 'fecundity', 'heaven', 'zina', 'hijra', 'employer', 'employee', 'manager', 'invisibility', 'subculture',
    'normative', 'abnormal', 'misleading', 'pronoun', 'oppression', 'suffragettes', 'wedding', 'parenthood', 'identity',
    'subordination', 'sexuality', 'sexism', 'authority', 'sweet', 'sweetness', 'violation', 'behavior', 'manner', 'cheat',
    'desire', 'objectification', 'abuse', 'assault', 'repression', 'harassment', 'traffic', 'fatherhood', 'maternity',
    'toxicity', 'manslaughter', 'beautiful', 'captivating', 'charming', 'attractive', 'glamorous', 'porn', 'sexual', 'priviledge',
    'power', 'body', 'career', 'stem', 'math', 'art', 'lgbt', 'lgbtq',
    'patriarchy', 'mutilation', 'queer', 'type', 'gender',
    'transsexual', 'lesbian', 'bisexual', 'heterosexual', 'asexual', 'male', 'female', 'fluid', 'masculine', 'effeminate',
    'woman', 'man', 'lass', 'sodomite', 'drag', 'androgynous', 'sex', 'transition', 'lad', 'postcolonial', 'equality',
    'lady', 'gentleman', 'miss', 'whore', 'slut', 'bitch', 'love', 'prostitute', 'sexy', 'curious', 'shrill',
    'sappy', 'sentimental', 'dramatic', 'invisible', 'trap', 'deviance', 'brothel', 'sin', 
    'immoral', 'sacrament', 'fruitful', 'natural', 'salvation', 'paradise', 'orgy', 'casino',
    'lesbianism', 'sappho', 'harem', 'sapphic', 'feminist', 'feminism', 'machismo', 'hierarchy', 'boss', 'worker',
    'homophobia', 'hiv', 'aids', 'violence', 'unnatural', 'illness', 'bad', 'disease', 'offensive', 'jargon', 'slang',
    'pride', 'insult', 'activism', 'activist', 'discrimination', 'regulatory', 'deviant', 'family', 'marriage', 'intolerance',
    'justice', 'misogyny', 'stereotype', 'naturalize', 'privilege', 'prostitution', 'deconstruction', 'segregation',
    'abortion', 'consent', 'genital', 'radical', 'vagina', 'status', 'fiancé', 'condemnation', 'condemn',
    'leave', 'divorce', 'pornography', 'ethics', 'subordinate', 'incest', 'legalize', 'contraceptive', 'self-awareness',
    'role', 'fantasy', 'parent', 'father', 'mother', 'remuneration', 'leadership', 'education', 'rape', 'attitude',
    'honor', 'betray', 'betrayal', 'victim', 'blame', 'anti-violence', 'hysteria', 'unwanted', 'crime', 'aggression', 'castration',
    'stalking', 'persecution', 'mistreatment', 'torture', 'delirium', 'monster', 'devil', 'adultery', 'dowry', 'old', 'powerful',
    'young', 'handsome', 'pretty', 'fascinating', 'rich', 'fresh', 'beauty', 'fluid', 'orgy', 'boyfriend', 'girlfriend', 'partner')

# Checking if the words are present in the semantic space 'baroni'
words_eng %in% rownames(baroni) 

# Removing duplicate words from 'words_eng'
words_eng <- words_eng[!duplicated(words_eng)] 

# Sorting the words in alphabetical order and creating a comma-separated string
sorted_categories_vector_eng <- paste0("'", sort(words_eng), "'", collapse = ', ') 

# Displaying the sorted categories vector
cat("c(", sorted_categories_vector_eng, ")\n")

# Creating a vector 'final_space_eng' with sorted and unique words
final_space_eng <- c(sorted_categories_vector_eng) 
print(final_space_eng)
final_words_eng <- c('abnormal', 'abortion', 'abuse', 'activism', 'activist', 'adultery', 'aggression', 'aids', 'androgynous', 'anti-violence', 'art', 'asexual', 'assault', 'attitude', 'attractive', 'authority', 'bad', 'ball', 'beautiful', 'beauty', 'behavior', 'betray', 'betrayal', 'bimbo', 'bisexual', 'bisexuality', 'bitch', 'bitchy', 'blame', 'body', 'boss', 'boy', 'boyfriend', 'brothel', 'cant', 'captivating', 'career', 'casino', 'castration', 'charming', 'chastity', 'cheat', 'condemn', 'condemnation', 'consent', 'contraceptive', 'crime', 'curious', 'deconstruction', 'delirium', 'desire', 'deviance', 'deviant', 'devil', 'discrimination', 'disease', 'divorce', 'dowry', 'drag', 'dramatic', 'education', 'effeminate', 'employee', 'employer', 'equality', 'ethics', 'family', 'fantasy', 'fascinating', 'father', 'fatherhood', 'fecundity', 'female', 'feminine', 'feminism', 'feminist', 'fiancé', 'fluid', 'fresh', 'fruitful', 'gay', 'gender', 'genital', 'gentleman', 'girl', 'girlfriend', 'glamorous', 'handsome', 'harassment', 'harem', 'heaven', 'hermaphroditic', 'heterosexual', 'hierarchy', 'hijra', 'hiv', 'homophile', 'homophobia', 'homosexual', 'homosexuality', 'honor', 'hysteria', 'identity', 'illness', 'immoral', 'incest', 'insult', 'intersex', 'intolerance', 'invert', 'invisibility', 'invisible', 'jargon', 'justice', 'lad', 'lady', 'lass', 'leadership', 'leave', 'legalize', 'lesbian', 'lesbianism', 'lgbt', 'lgbtq', 'love', 'machismo', 'male', 'man', 'manager', 'manner', 'manslaughter', 'marriage', 'masculine', 'masculinity', 'maternity', 'math', 'misleading', 'misogyny', 'miss', 'mister', 'mistreatment', 'mistress', 'monster', 'mother', 'mrs', 'ms', 'mutilation', 'natural', 'naturalize', 'normative', 'nymphomaniac', 'objectification', 'offensive', 'old', 'oppression', 'orgy', 'paradise', 'parent', 'parenthood', 'partner', 'patriarchy', 'persecution', 'porn', 'pornography', 'postcolonial', 'power', 'powerful', 'pretty', 'pride', 'priviledge', 'privilege', 'pronoun', 'prostitute', 'prostitution', 'queer', 'radical', 'rape', 'regulatory', 'religiosity', 'remuneration', 'repression', 'rich', 'role', 'sacrament', 'salvation', 'sapphic', 'sappho', 'sappy', 'segregation', 'self-awareness', 'sentimental', 'sex', 'sexism', 'sexual', 'sexuality', 'sexy', 'shrill', 'sin', 'sinful', 'slang', 'slave', 'slut', 'snoopy', 'sodomite', 'stalking', 'status', 'stem', 'stereotype', 'subculture', 'subordinate', 'subordination', 'suffragettes', 'sweet', 'sweetness', 'torture', 'toxicity', 'traffic', 'transgender', 'transition', 'transsexual', 'transvestite', 'trap', 'type', 'unnatural', 'unwanted', 'vagina', 'victim', 'violation', 'violence', 'vogue', 'wedding', 'whore', 'woman', 'women', 'worker', 'young', 'zina')

# Calculating cosine similarity matrix of the words within themselves (rows elements are the same of the columns' ones)
eng_similarity_matrix <- multicos(final_words_eng, final_words_eng, tvectors=baroni); #Creating a matrix with 

# Writing the similarity matrix to a CSV file
write.csv(eng_similarity_matrix, file.path('/Users/francesca/PycharmProjects/HLT_project/matrices/', "eng_similarity_matrix.csv"), row.names = TRUE)

# If you want to represent the neighbors of a target word in the sub-space graphically,
# you can use PCA or MDS in a 3 or 2-dimensional representation.
plot_neighbors('transgender', n = 20, tvectors = eng_similarity_matrix, method = "PCA", dims = 3)


# # ITALIAN
# # Applying the same procedure for the Italian semantic space

words_ita <- c('lgbt', 'queer', 'genere', 'gender', 'transessuale', 'lesbica', 'bisessuale', 'eterosessuale', 
  'asessuale', 'maschile', 'femminile', 'fluido', 'mascolino', 'effeminato', 'donna', 'uomo', 'ragazza', 
  'ragazzina', 'sodomita', 'drag', 'androgino', 'sesso', 'transizione', 'ragazzo', 'eterosessuale', 
  'postcoloniale', 'uguaglianza', 'signora', 'signore', 'signorina', 'puttana', 'troia', 'cagna', 
  'sgualdrina', 'mignotta', 'amore', 'prostituta', 'attraente', 'sexy', 'curioso', 'stridulo', 'prostituta', 
  'sdolcinato', 'melenso', 'sentimentale', 'drammatico', 'invisibile', 'trappola', 'tranello', 'devianza', 
  'bordello', 'peccato', 
  'immorale', 'fecondo', 'naturale', 'salvezza', 'peccato', 'paradiso', 'orgia', 'casino', 'lesbismo', 'saffo', 
  'harem', 'saffico', 'femminista', 
  'femminismo', 'maschilismo', 'uguaglianza', 'gerarchia', 'capo', 'lavoratore', 'omofobia', 'hiv', 'aids', 
  'violenza', 'innaturale', 'malattia', 'male', 'morbo', 'patriarcato', 'offensivo', 'gergo', 'slang', 'pride', 
  'insulto', 'attivismo', 'attivista', 'discriminazione', 'normativo', 'deviante', 'famiglia', 'matrimonio', 
  'intolleranza', 'giustizia', 'misoginia', 'stereotipo', 'naturalizzare', 'privilegio', 'discriminazione', 
  'prostituzione', 'decostruzione', 'segregazione', 'corpo', 'consultorio', 'stem', 'carriera', 'sport', 'aborto', 
  'consenso', 'genitale', 'radicale', 'vagina', 'status', 'fidanzato', 'omicidio', 'ex', 'condanna', 'condannare', 
  'lasciare', 'divorzio', 'divorziare', 'pornografia', 'etica', 'subordinare', 'subordinato', 'incesto', 'legalizzare', 
  'anticoncezionale', 'disagio', 'autocoscienza', 'ruolo', 'immaginario', 'fantasia', 'misoginia', 'genitore', 'padre', 
  'madre', 'retribuzione', 'leadership', 'educazione', 'stupro', 'atteggiamento', 'onore', 'flirtare', 'tradire', 
  'tradimento', 'vittima', 'colpevolizzazione', 'antiviolenza', 'isteria', 'indesiderato', 'incesto', 'crime', 
  'aggressione', 'castrazione', 'stalking', 'persecuzione', 'tratta', 'maltrattamento', 'tortura', 'delirio', 'mostro', 
  'diavolo', 'violentare', 'adulterio', 'dote', 'vecchia', 'vecchio', 'potente', 'giovane', 'bello', 'bella', 'attraente', 
  'affascinante', 'ricco', 'fresca', 'sessuale', 'porno', 'bellezza',
  'bimbo', 'ninfomane', 'padrona', 'schiavo', 'travestito', 'lesbica', 'maschile', 'femminile', 'donna',
  'uomo', 'gay', 'sodomita', 'queer', 'transgender', 'bisessuale', 'omosessuale', 'lagna',
  'androgino', 'genere', 'sesso', 'femminista', 'femminismo', 'transizione', 'asessuale',
  'postcoloniale', 'sexy', 'snoopy', 'stridulo', 'cagna', 'stronza', 'stronzo', 'drammatico', 'invertire', 'effeminato',
  'orso', 'offensivo', 'amore', 'ragazza', 'ragazzo', 'signorina', 'signora', 'signore', 'mancare', 'trappola',
  'ball', 'vogue', 'innaturale', 'malattia', 'peccaminoso', 'religione', 'immorale', 'sacramento',
  'salvezza', 'paradiso', 'zina', 'harem', 'hijra', 'orgoglio', 'stereotipo', 'uguaglianza', 'gerarchia',
  'dipendente', 'manager', 'capo', 'violenza', 'capo', 'manager', 'patriarcato',
  'sottocultura', 'insulto', 'attivismo', 'discriminazione', 'normativo', 'anormale', 'ingannevole', 'prostituzione',
  'decostruzione', 'pronome', 'naturale', 'oppressione', 'uguaglianza', 'aborto', 'consenso', 'famiglia', 'matrimonio',
  'nozze', 'genitale', 'mutilazione', 'radicale', 'vagina', 'stato', 'condannare', 'divorzio',
  'etica', 'subordinazione', 'subordinare', 'incesto', 'contraccettivo', 'autocoscienza', 'giustizia', 'misoginia', 'sessismo',
  'comando', 'dolce', 'dolcezza', 'stupro', 'violazione', 'atteggiamento', 'comportamento', 'maniera', 'imbroglione',
  'desiderio', 'colpa', 'vittima', 'oggettivazione', 'antiviolenza', 'isteria', 'indesiderato', 'abuso', 'incesto', 'crimine',
  'assalto', 'repressione', 'castrazione', 'mutilazione', 'stalking', 'oppressione', 'persecuzione', 'molestia', 'traffico', 'hiv',
  'aids', 'tortura', 'delirio', 'mostro', 'diavolo', 'adulterio', 'dote',
  'ricco', 'bellissimo', 'accattivante', 'affascinante', 'attraente', 'accattivante', 'affascinante', 'affascinante', 'porno',
  'sessuale', 'privilegio', 'energia', 'corpo', 'carriera', 'stelo', 'matematica', 'arte', 'patriarcato', 'mutilazione', 'partner')

words_ita %in% rownames(itwac)
words_ita <- words_ita[!duplicated(words_ita)]
sorted_categories_vector_ita <- paste0("'", sort(words_ita), "'", collapse = ', ')
cat("c(", unique(sorted_categories_vector_ita), ")\n")
final_space_ita <- c(sorted_categories_vector_ita)
print(final_space_ita)
final_words_ita <- c('aborto', 'abuso', 'accattivante', 'adulterio', 'affascinante', 'aggressione', 'aids', 'amore', 'androgino', 'anormale', 'anticoncezionale', 'antiviolenza', 'arte', 'asessuale', 'assalto', 'atteggiamento', 'attivismo', 'attivista', 'attraente', 'autocoscienza', 'ball', 'bella', 'bellezza', 'bellissimo', 'bello', 'bimbo', 'bisessuale', 'bordello', 'cagna', 'capo', 'carriera', 'casino', 'castrazione', 'colpa', 'colpevolizzazione', 'comando', 'comportamento', 'condanna', 'condannare', 'consenso', 'consultorio', 'contraccettivo', 'corpo', 'crime', 'crimine', 'curioso', 'decostruzione', 'delirio', 'desiderio', 'deviante', 'devianza', 'diavolo', 'dipendente', 'disagio', 'discriminazione', 'divorziare', 'divorzio', 'dolce', 'dolcezza', 'donna', 'dote', 'drag', 'drammatico', 'educazione', 'effeminato', 'energia', 'eterosessuale', 'etica', 'ex', 'famiglia', 'fantasia', 'fecondo', 'femminile', 'femminismo', 'femminista', 'fidanzato', 'flirtare', 'fluido', 'fresca', 'gay', 'gender', 'genere', 'genitale', 'genitore', 'gerarchia', 'gergo', 'giovane', 'giustizia', 'harem', 'hijra', 'hiv', 'imbroglione', 'immaginario', 'immorale', 'incesto', 'indesiderato', 'ingannevole', 'innaturale', 'insulto', 'intolleranza', 'invertire', 'invisibile', 'isteria', 'lagna', 'lasciare', 'lavoratore', 'leadership', 'legalizzare', 'lesbica', 'lesbismo', 'lgbt', 'madre', 'malattia', 'male', 'maltrattamento', 'manager', 'mancare', 'maniera', 'maschile', 'maschilismo', 'mascolino', 'matematica', 'matrimonio', 'melenso', 'mignotta', 'misoginia', 'molestia', 'morbo', 'mostro', 'mutilazione', 'naturale', 'naturalizzare', 'ninfomane', 'normativo', 'nozze', 'offensivo', 'oggettivazione', 'omicidio', 'omofobia', 'omosessuale', 'onore', 'oppressione', 'orgia', 'orgoglio', 'orso', 'padre', 'padrona', 'paradiso', 'partner', 'patriarcato', 'peccaminoso', 'peccato', 'persecuzione', 'porno', 'pornografia', 'postcoloniale', 'potente', 'pride', 'privilegio', 'pronome', 'prostituta', 'prostituzione', 'puttana', 'queer', 'radicale', 'ragazza', 'ragazzina', 'ragazzo', 'religione', 'repressione', 'retribuzione', 'ricco', 'ruolo', 'sacramento', 'saffico', 'saffo', 'salvezza', 'schiavo', 'sdolcinato', 'segregazione', 'sentimentale', 'sessismo', 'sesso', 'sessuale', 'sexy', 'sgualdrina', 'signora', 'signore', 'signorina', 'slang', 'snoopy', 'sodomita', 'sottocultura', 'sport', 'stalking', 'stato', 'status', 'stelo', 'stem', 'stereotipo', 'stridulo', 'stronza', 'stronzo', 'stupro', 'subordinare', 'subordinato', 'subordinazione', 'tortura', 'tradimento', 'tradire', 'traffico', 'tranello', 'transessuale', 'transgender', 'transizione', 'trappola', 'tratta', 'travestito', 'troia', 'uguaglianza', 'uomo', 'vagina', 'vecchia', 'vecchio', 'violazione', 'violentare', 'violenza', 'vittima', 'vogue', 'zina')
ita_similarity_matrix <- multicos(final_words_ita, final_words_ita, tvectors=itwac);
write.csv(ita_similarity_matrix, file.path('/Users/francesca/PycharmProjects/HLT_project/matrices/', "ita_similarity_matrix"), row.names = TRUE)


# # FRENCH

# # Applying the same procedure for the French semantic space

words_fr <- c(
  'lgbt', 'queer', 'gender', 'lesbienne', 'hétérosexuel', 'masculin', 'féminin', 'fluide', 'femme', 
  'homme', 'fille', 'dragueur', 'androgyne', 'sexe', 'transition', 'garçon', 'postcolonial', 'égalité', 
  'lady', 'sir', 'miss', 'pute', 'salope', 'bitch', 'amour', 'prostituée', 'attractive', 'sexy', 
  'curieuse', 'grinçante', 'sentimental', 'invisible', 'piège', 'déviance', 'bordel', 'péché', 'immoral', 'sacrement', 'fructueux', 
  'naturel', 'salut', 'péché', 'paradis', 'orgie', 'désordre', 'hindouisme', 'bouddhisme', 'religion', 
  'religieux', 'harem', 'féministe', 'féminisme', 'machisme', 'égalité', 'hiérarchie', 'patron', 'travailleur', 
  'homophobie', 'vih', 'sida', 'violence', 'maladie', 'mal', 'patriarcat', 'offensant', 'argot', 'fierté', 
  'insulte', 'activisme', 'activiste', 'discrimination', 'normatif', 'déviant', 'famille', 'mariage', 
  'intolérance', 'justice', 'misogynie', 'stéréotype', 'naturalisation', 'privilège', 'prostitution', 
  'déconstruction', 'ségrégation', 'corps', 'consultation', 'tige', 'carrière', 'sport', 'avortement', 
  'consentement', 'génital', 'radical', 'vagin', 'statut', 'meurtre', 'ex', 'sentence', 'condamner', 
  'quitter', 'divorce', 'pornographie', 'éthique', 'subordonné', 'inceste', 'légaliser', 'contraceptif', 
  'malaise', 'rôle', 'imaginaire', 'fantaisie', 'parent', 'père', 'mère', 'rémunération', 'leadership', 
  'éducation', 'viol', 'attitude', 'honneur', 'flirt', 'trahir', 'trahison', 'victime', 'blâme', 'hystérie', 
  'indésirable', 'inceste', 'crime', 'agression', 'castration', 'harcèlement', 'persécution', 'traite', 'torture', 
  'délire', 'monstre', 'diable', 'adultère', 'dot', 'vieux', 'puissant', 'jeune', 'beau', 'magnifique', 
  'attirant', 'charmant', 'riche', 'frais', 'sexuel', 'porno', 'beauté', 'bimbo', 'maîtresse', 'esclave', 
  'travesti', 'féministe', 'femmes', 'gay', 'pédé', 'homosexualité', 'homosexuel', 'traîner', 'genre', 
  'hermaphrodite', 'sexy', 'fouineur', 'aigu', 'chienne', 'vache', 'spectaculaire', 'inverser', 'ours', 
  'amour', 'manquer', 'piège', 'balle', 'vogue', 'maladie', 'coupable', 'religiosité', 'religion', 'immoral', 
  'sacrement', 'chasteté', 'fécondité', 'salut', 'paradis', 'harem', 'fierté', 'stéréotype', 'égalité', 
  'hiérarchie', 'employeur', 'employé', 'directeur', 'chef', 'invisibilité', 'violence', 'patriarcat', 'insulte', 
  'activisme', 'activiste', 'discrimination', 'réglementaire', 'normatif', 'anormal', 'déconstruction', 'pronom', 
  'naturel', 'oppression', 'égalité', 'avortement', 'consentement', 'famille', 'mariage', 'génital', 'mutilation', 
  'radical', 'vagin', 'statut', 'parentalité', 'condamner', 'divorce', 'identité', 'éthique', 'subordination', 
  'subalterne', 'inceste', 'contraceptif', 'justice', 'sexualité', 'misogynie', 'sexisme', 'direction', 'autorité', 
  'doux', 'douceur', 'râpé', 'violation', 'attitude', 'comportement', 'manière', 'tricher', 'désir', 'blâmer', 
  'victime', 'objectivation', 'hystérie', 'indésirable', 'abus', 'inceste', 'crime', 'agression', 'répression', 
  'castration', 'mutilation', 'traquer', 'oppression', 'persécution', 'harcèlement', 'trafic', 'hiv', 'sida', 
  'torture', 'paternité', 'maternité', 'toxicité', 'délire', 'monstre', 'diable', 'adultère', 'dot', 'riche', 
  'beau', 'captivant', 'charmant', 'attractif', 'glamour', 'porno', 'sexuel', 'privilège', 'pouvoir', 'corps', 
  'carrière', 'tige', 'mathématiques', 'art', 'judaïsme', 'hindouisme'
) 

words_fr %in% rownames(frwak100k)
words_fr <- words_fr[!duplicated(words_fr)]
sorted_categories_vector_fr <- paste0("'", sort(words_fr), "'", collapse = ', ')
cat("c(", sorted_categories_vector_fr, ")\n")
final_space_fr <- c(sorted_categories_vector_fr)
print(final_space_fr)
final_words_fr <- c('abus', 'activisme', 'activiste', 'adultère', 'agression', 'aigu', 'amour', 'androgyne', 'anormal', 'argot', 'art', 'attirant', 'attitude', 'attractif', 'attractive', 'autorité', 'avortement', 'balle', 'beau', 'beauté', 'bimbo', 'bitch', 'blâme', 'blâmer', 'bordel', 'bouddhisme', 'captivant', 'carrière', 'castration', 'charmant', 'chasteté', 'chef', 'chienne', 'comportement', 'condamner', 'consentement', 'consultation', 'contraceptif', 'corps', 'coupable', 'crime', 'curieuse', 'déconstruction', 'délire', 'désir', 'désordre', 'déviance', 'déviant', 'diable', 'directeur', 'direction', 'discrimination', 'divorce', 'dot', 'douceur', 'doux', 'dragueur', 'éducation', 'égalité', 'employé', 'employeur', 'esclave', 'éthique', 'ex', 'famille', 'fantaisie', 'fécondité', 'féminin', 'féminisme', 'féministe', 'femme', 'femmes', 'fierté', 'fille', 'flirt', 'fluide', 'fouineur', 'frais', 'fructueux', 'garçon', 'gay', 'gender', 'génital', 'genre', 'glamour', 'grinçante', 'harcèlement', 'harem', 'hermaphrodite', 'hétérosexuel', 'hiérarchie', 'hindouisme', 'hiv', 'homme', 'homophobie', 'homosexualité', 'homosexuel', 'honneur', 'hystérie', 'identité', 'imaginaire', 'immoral', 'inceste', 'indésirable', 'insulte', 'intolérance', 'inverser', 'invisibilité', 'invisible', 'jeune', 'judaïsme', 'justice', 'lady', 'leadership', 'légaliser', 'lesbienne', 'lgbt', 'machisme', 'magnifique', 'maîtresse', 'mal', 'maladie', 'malaise', 'manière', 'manquer', 'mariage', 'masculin', 'maternité', 'mathématiques', 'mère', 'meurtre', 'misogynie', 'miss', 'monstre', 'mutilation', 'naturalisation', 'naturel', 'normatif', 'objectivation', 'offensant', 'oppression', 'orgie', 'ours', 'paradis', 'parent', 'parentalité', 'paternité', 'patriarcat', 'patron', 'péché', 'pédé', 'père', 'persécution', 'piège', 'porno', 'pornographie', 'postcolonial', 'pouvoir', 'privilège', 'pronom', 'prostituée', 'prostitution', 'puissant', 'pute', 'queer', 'quitter', 'radical', 'râpé', 'réglementaire', 'religieux', 'religion', 'religiosité', 'rémunération', 'répression', 'riche', 'rôle', 'sacrement', 'salope', 'salut', 'ségrégation', 'sentence', 'sentimental', 'sexe', 'sexisme', 'sexualité', 'sexuel', 'sexy', 'sida', 'sir', 'spectaculaire', 'sport', 'statut', 'stéréotype', 'subalterne', 'subordination', 'subordonné', 'tige', 'torture', 'toxicité', 'trafic', 'trahir', 'trahison', 'traîner', 'traite', 'transition', 'traquer', 'travailleur', 'travesti', 'tricher', 'vache', 'vagin', 'victime', 'vieux', 'vih', 'viol', 'violation', 'violence', 'vogue')
fr_similarity_matrix <- multicos(final_words_fr, final_words_fr, tvectors=frwak100k);
write.csv(fr_similarity_matrix, file.path('/Users/francesca/PycharmProjects/HLT_project/matrices/', "fr_similarity_matrix"), row.names = TRUE)


# # GERMAN

# # Applying the same procedure for the German semantic space

words_ger <- c("flittchen", "nymphomanin", "sklave", "transvestit", "lesbisch", "maskulin", "feminin", "frauen", "mann", "schwul",
               "sodomit", "queer", "transgender", "bisexuell", "homosexuell", "drag", "androgyn", "homophil", "kantig", "geschlecht",
               "feminist", "feminismus", "asexuell", "postkolonial", "sexy", "schrill", "schlampe", "zickig", "dramatisch", "invertiert",
               "beleidigend", "liebe", "ms", "mrs", "mister", "miss", "trap", "ball", "vogue", "krankheit", "religion", "sakrament",
               "keuschheit", "fruchtbarkeit", "himmel", "zina", "harem", "hijra", "stolz", "stereotyp", "gleichheit", "hierarchie",
               "arbeitgeber", "arbeitnehmer", "manager", "chef", "unsichtbarkeit", "gewalt", "kippen", "manager", "patriarchat",
               "subkultur", "beleidigung", "aktivismus", "aktivist", "diskriminierung", "normativ", "abnormal", "prostitution",
               "pronomen", "gleichheit", "abtreibung", "einwilligung", "familie", "ehe", "hochzeit", "radikal", "vagina", "status",
               "elternschaft", "verurteilung", "scheidung", "ethik", "unterordnung", "untergeordnet", "inzest", "selbsterkenntnis",
               "gerechtigkeit", "misogynie", "sexismus", "vergewaltigung", "einstellung", "verhalten", "betrug", "begehren", "schuld",
               "opfer", "objektivierung", "hysterie", "verbrechen", "kastration", "stalking", "verfolgung", "verkehr", "hiv", "aids",
               "folter", "vaterschaft", "mutterschaft", "giftigkeit", "delirium", "ungeheuer", "teufel", "ehebruch", "mitgift", "totschlag",
               "reich", "fesselnd", "charmant", "attraktiv", "porno", "sexuell", "privileg", "macht", "karriere", "stamm", "mathe",
               "kunst", "patriarchat", 'seltsam', 'typ', 'geschlecht', 'transsexuelle', 'lesbisch', 'bisexuell', 'heterosexuell', 'asexuell',
               'weiblich', 'weibisch', 'frau', 'mann', 'sodomit', 'ziehen', 'androgyn', 'sex', 'junge',
               'heterosexuell', 'postkolonial', 'gleichwertigkeit', 'dame', 'gentleman', 'vermissen', 'hure', 'schlampe', 'schlampe', 'schlampe',
               'liebe', 'prostituierte', 'attraktiv', 'sexy', 'neugierig', 'schrillen', 'prostituierte', 'saftig', 'sentimental',
               'dramatisch', 'unsichtbar', 'fangen', 'fangen', 'abweichung', 'bordell', 'religion', 'islam', 'christian', 'christentum', 'orthodox',
               'mafia', 'unmoralisch', 'sakrament', 'fruchtbar', 'paradies', 'orgie', 'kasino',
               'sappho', 'harem', 'feminist', 'feminismus', 'machismo', 'gleichwertigkeit', 'hierarchie', 'chef',
               'arbeiter', 'homophobie', 'hiv', 'aids', 'gewalt', 'erkrankung', 'schlecht', 'krankheit', 'patriarchat', 'beleidigend',
               'jargon', 'slang', 'stolz', 'beleidigung', 'aktivismus', 'aktivist', 'diskriminierung', 'abweichend', 'familie',
               'hochzeit', 'intoleranz', 'gerechtigkeit', 'misogynie', 'stereotyp', 'naturalisieren', 'privileg', 'diskriminierung', 'prostitution',
               'dekonstruktion', 'abgrenzung', 'beratung', 'stengel', 'karriere', 'sport', 'abtreibung', 'zustimmung', 'genital', 'radikale', 'vagina',
               'status', 'ehemalig', 'verurteilung', 'verurteilen', 'verlassen', 'scheidung', 'pornographie', 'ethik', 'untergeordnet', 'untergeordnet',
               'inzest', 'legalisieren', 'unbehagen', 'rolle', 'fiktiv', 'fantasie', 'misogynie', 'elternteil', 'vater', 'mutter',
               'ausbildung', 'vergewaltigen', 'ehre', 'flirten', 'verraten', 'verrat', 'opfer', 'beschuldigen',
               'hysterie', 'inzest', 'verbrechen', 'aggression', 'kastration', 'stalking', 'verfolgung', 'misshandlung', 'folter',
               'delirium', 'monster', 'teufel', 'vergewaltigen', 'ehebruch', 'mitgift', 'alt', 'jung', 'gutaussehend', 'attraktiv', 'faszinierend',
               'frisch', 'sexuell', 'porno') 

words_ger %in% rownames(dewac)
words_ger <- words_ger[!duplicated(words_ger)]
sorted_categories_vector_ger <- paste0("'", sort(words_ger), "'", collapse = ', ')
cat("c(", sorted_categories_vector_ger, ")\n")
final_space_ger <- c(sorted_categories_vector_ger)
print(final_space_ger)
final_space_ger <- c('abgrenzung', 'abnormal', 'abtreibung', 'abweichend', 'abweichung', 'aggression', 'aids', 'aktivismus', 'aktivist', 'alt', 'androgyn', 'arbeiter', 'arbeitgeber', 'arbeitnehmer', 'asexuell', 'attraktiv', 'ausbildung', 'ball', 'begehren', 'beleidigend', 'beleidigung', 'beratung', 'beschuldigen', 'betrug', 'bisexuell', 'bordell', 'charmant', 'chef', 'christentum', 'christian', 'dame', 'dekonstruktion', 'delirium', 'diskriminierung', 'drag', 'dramatisch', 'ehe', 'ehebruch', 'ehemalig', 'ehre', 'einstellung', 'einwilligung', 'elternschaft', 'elternteil', 'erkrankung', 'ethik', 'familie', 'fangen', 'fantasie', 'faszinierend', 'feminin', 'feminismus', 'feminist', 'fesselnd', 'fiktiv', 'flirten', 'flittchen', 'folter', 'frau', 'frauen', 'frisch', 'fruchtbar', 'fruchtbarkeit', 'genital', 'gentleman', 'gerechtigkeit', 'geschlecht', 'gewalt', 'giftigkeit', 'gleichheit', 'gleichwertigkeit', 'gutaussehend', 'harem', 'heterosexuell', 'hierarchie', 'hijra', 'himmel', 'hiv', 'hochzeit', 'homophil', 'homophobie', 'homosexuell', 'hure', 'hysterie', 'intoleranz', 'invertiert', 'inzest', 'islam', 'jargon', 'jung', 'junge', 'kantig', 'karriere', 'kasino', 'kastration', 'keuschheit', 'kippen', 'krankheit', 'kunst', 'legalisieren', 'lesbisch', 'liebe', 'machismo', 'macht', 'mafia', 'manager', 'mann', 'maskulin', 'mathe', 'misogynie', 'miss', 'misshandlung', 'mister', 'mitgift', 'monster', 'mrs', 'ms', 'mutter', 'mutterschaft', 'naturalisieren', 'neugierig', 'normativ', 'nymphomanin', 'objektivierung', 'opfer', 'orgie', 'orthodox', 'paradies', 'patriarchat', 'porno', 'pornographie', 'postkolonial', 'privileg', 'pronomen', 'prostituierte', 'prostitution', 'queer', 'radikal', 'radikale', 'reich', 'religion', 'rolle', 'saftig', 'sakrament', 'sappho', 'scheidung', 'schlampe', 'schlecht', 'schrill', 'schrillen', 'schuld', 'schwul', 'selbsterkenntnis', 'seltsam', 'sentimental', 'sex', 'sexismus', 'sexuell', 'sexy', 'sklave', 'slang', 'sodomit', 'sport', 'stalking', 'stamm', 'status', 'stengel', 'stereotyp', 'stolz', 'subkultur', 'teufel', 'totschlag', 'transgender', 'transsexuelle', 'transvestit', 'trap', 'typ', 'unbehagen', 'ungeheuer', 'unmoralisch', 'unsichtbar', 'unsichtbarkeit', 'untergeordnet', 'unterordnung', 'vagina', 'vater', 'vaterschaft', 'verbrechen', 'verfolgung', 'vergewaltigen', 'vergewaltigung', 'verhalten', 'verkehr', 'verlassen', 'vermissen', 'verrat', 'verraten', 'verurteilen', 'verurteilung', 'vogue', 'weibisch', 'weiblich', 'zickig', 'ziehen', 'zina', 'zustimmung')
ger_similarity_matrix <- multicos(final_words_ger, final_words_ger, tvectors=dewac);
write.csv(ger_similarity_matrix, file.path('/Users/francesca/PycharmProjects/HLT_project/matrices/', "ger_similarity_matrix"), row.names = TRUE)


# # SPANISH

# # Applying the same procedure for the Spanish semantic space

words_esp <- c("barbie", "ninfómana", "ama", "mujer", "hombre", "gay", "queer", "drag", "andrógino", "cant",
  "género", "hermafrodita", "chillón", "zorra", "perra", "dramático", "invertido", "afeminado", "amor", "chica",
  "boy", "trap", "ball", "vogue", "religión", "inmoral", "fecundidad", "cielo", "zina", "harén",
  "orgullo", "igualdad", "jerarquía", "empleador", "empleado", "gerente", "jefe", "violencia", "jefe",
  "gerente", "patriarcado", "reglamentario", "anormal", 'pronombre', 'natural', 'igualdad', "aborto",
  'familia', 'matrimonio', 'boda', 'genital', 'mutilación', 'radical', 'vagina', "paternidad", 'condena',
  'divorcio', 'identidad', 'ética', 'anticonceptivo', 'autoconciencia', 'liderazgo', 'autoridad', 'dulce', 'dulzura',
  'violación', 'actitud', "comportamiento", 'manera', 'engañar', 'culpa', 'víctima', 'crimen', 'mutilación', 'acecho',
  'tráfico', 'vih', 'paternidad', 'maternidad', 'toxicidad', 'delirio', "demonio", 'adulterio', 'dote', 'homicidio',
  'rico', 'bella', 'cautivadora', 'encantadora', 'atractiva', 'cautivadora', "encantadora", 'porno', 'privilegio', 'poder',
  'cuerpo', 'carrera', 'tallo', "arte", 'lgbt', 'patriarcado', 'mutilación', 'femme', "garçon",
  'lady', 'bitch', "amour", "inmoral", 'harem', 'patron', 'vih', 'violence',
  'mal', "argot", 'familia', 'matrimonio', "intolerancia", 'naturalización', 'privilegio', "cuerpo", 'tallo',
  'carrera', 'deporte', 'aborto', 'genital', 'radical', 'vagina', 'ex', 'condenar', 'dejar', 'divorcio', 'divorcio',
  'pornografía', 'ética', 'legalizar', 'anticonceptivo', 'incomodidad', 'papel', 'imaginario', "progenitor",
  'padre', 'madre', 'remuneración', 'liderazgo', 'educación', 'violación', 'actitud', 'honor', 'coqueteo', "traicionar",
  'traición', 'víctima', 'culpa', 'crimen', 'tráfico', 'tortura', 'delirio', 'demonio', 'violación', 'adulterio', 'dote',
  "viejo", 'anciano', 'joven', 'magnífico', 'atractivo', 'encantador', 'rico', 'porno', 'belleza')

words_esp %in% rownames(es_cbow)
words_esp <- words_esp[!duplicated(words_esp)]
sorted_categories_vector_esp <- paste0("'", sort(words_esp), "'", collapse = ', ')
cat("c(", sorted_categories_vector_esp, ")\n")
final_space_esp <- c(sorted_categories_vector_esp)
print(final_space_esp)
final_space_esp <- c('aborto', 'acecho', 'actitud', 'adulterio', 'afeminado', 'ama', 'amor', 'amour', 'anciano', 'andrógino', 'anormal', 'anticonceptivo', 'argot', 'arte', 'atractiva', 'atractivo', 'autoconciencia', 'autoridad', 'ball', 'barbie', 'bella', 'belleza', 'bitch', 'boda', 'boy', 'cant', 'carrera', 'cautivadora', 'chica', 'chillón', 'cielo', 'comportamiento', 'condena', 'condenar', 'coqueteo', 'crimen', 'cuerpo', 'culpa', 'dejar', 'delirio', 'demonio', 'deporte', 'divorcio', 'dote', 'drag', 'dramático', 'dulce', 'dulzura', 'educación', 'empleado', 'empleador', 'encantador', 'encantadora', 'engañar', 'ética', 'ex', 'familia', 'fecundidad', 'femme', 'garçon', 'gay', 'género', 'genital', 'gerente', 'harem', 'harén', 'hermafrodita', 'hombre', 'homicidio', 'honor', 'identidad', 'igualdad', 'imaginario', 'incomodidad', 'inmoral', 'intolerancia', 'invertido', 'jefe', 'jerarquía', 'joven', 'lady', 'legalizar', 'lgbt', 'liderazgo', 'madre', 'magnífico', 'mal', 'manera', 'maternidad', 'matrimonio', 'mujer', 'mutilación', 'natural', 'naturalización', 'ninfómana', 'orgullo', 'padre', 'papel', 'paternidad', 'patriarcado', 'patron', 'perra', 'poder', 'porno', 'pornografía', 'privilegio', 'progenitor', 'pronombre', 'queer', 'radical', 'reglamentario', 'religión', 'remuneración', 'rico', 'tallo', 'tortura', 'toxicidad', 'tráfico', 'traición', 'traicionar', 'trap', 'vagina', 'víctima', 'viejo', 'vih', 'violación', 'violence', 'violencia', 'vogue', 'zina', 'zorra')
esp_similarity_matrix <- multicos(final_words_esp, final_words_esp, tvectors=es_cbow);
write.csv(esp_similarity_matrix, file.path('/Users/francesca/PycharmProjects/HLT_project/matrices/', "esp_similarity_matrix"), row.names = TRUE)


# # CROATIAN

# # Applying the same procedure for the Croatian semantic space

words_hr <- c("obrnuto", "medvjed", "uvredljivo", "ljubav", "djevojka", 
              "gospodina", "zamka", "lopta", "moda", "neprirodno", "bolest",
              "religija", "nemoralno", "sakrament", "plodnost", "spasenje", 
              "nebo", "zina", "harem", 'ponos', 'stereotip', 'jednakost', 
              'hijerarhija', 'poslodavac', 'zaposlenik', 'nevidljivost', 
              'nasilje', 'uvreda', 'aktivizam', 'aktivist', 'diskriminacija', 
              'nenormalna', 'prostitucija', 'zamjenica', 'prirodno', 'ugnjetavanje', 
              'jednakost', 'abortus', 'pristanak', 'obitelj', 'brak', 'genitalije', 
              'vagina', 'status', 'roditeljstvo', 'osuditi', 'razvod', 'identitet', 
              'etika', 'incest', 'kontracepcija', 'samosvijest', 'pravda', 
              'seksualnost', 'seksizam', 'autoritet', 'slatko', 'silovanje', 'stav', 
              'varanje', 'okrivljavanje', 'zlostavljanje', 'napad', 
              'represija', 'kastracija', 'ugnjetavanje', 'proganjanje', 'uznemiravanje', 
              'promet', 'hiv', 'sida', 'delirij', 'vrag', 'preljub', 'miraz', 'ubojstvo', 
              'bogat', 'lijepa', 'glamurozna', 'porno', 'seksualno', 'privilegija', 'tijelo', 
              'karijera', 'glava', 'matematika', 'umjetnost', 'lgbt', 'queer', 'rod', 'lezbijka', 
              'heteroseksualac', 'djevojka', 'flerta', 
              'seks', 'tranzicija', 'heteroseksualac', 'jednakost', 'dama', 'gospodin', 'kurva', 
              'drolja', 'ljubav', 'prostitutka', 'atraktivna', 'seksi', 'prostitutka', 'sentimentalna', 
              'nevidljiva', 'zamka', 'klopka', 'devijacija', 'bordel', 'grijeh', 'nemoralno', 'sakrament', 'plodno', 
              'prirodno', 'spasenje', 'grijeh', 'raj', 
              'orgija', 'harem', 'feministkinja', 
              'feminizam', 'jednakost', 'hijerarhija', 'radnik', 'homofobija', 'hiv', 'sida', 'nasilje', 
              'bolest', 'zlo', 'bolest', 'uvredljivo', 'sleng', 'ponos', 'uvreda', 'aktivizam', 'aktivist', 
              'diskriminacija', 'devijantno', 'obitelj', 'brak', 'netolerancija', 'pravda', 'stereotip', 
              'privilegija', 'diskriminacija', 'prostitucija', 'segregacija', 'tijelo', 
              'savjetovanje', 'stabljika', 'karijera', 'sport', 'abortus', 'pristanak', 'genitalni', 'radikalno', 
              'vagina', 'status', 'ubojstvo', 'napustiti', 'razvod', 'razvod', 'pornografija', 'etika', 'incest', 
              'legalizirati', 'nelagoda', 'uloga', 'imaginarno', 'fantazija', 'roditelj', 'otac', 
              'majka', 'naknada', 'vodstvo', 'obrazovanje', 'silovanje', 'stav')

words_hr %in% rownames(hr_cbow)
words_hr <- words_hr[!duplicated(words_hr)]
sorted_categories_vector_hr <- paste0("'", sort(words_hr), "'", collapse = ', ')
cat("c(", sorted_categories_vector_hr, ")\n")
final_space_hr <- c(sorted_categories_vector_hr)
print(final_space_hr)
final_space_hr <- c('abortus', 'aktivist', 'aktivizam', 'atraktivna', 'autoritet', 'bogat', 'bolest', 'bordel', 'brak', 'dama', 'delirij', 'devijacija', 'devijantno', 'diskriminacija', 'djevojka', 'drolja', 'etika', 'fantazija', 'feministkinja', 'feminizam', 'flerta', 'genitalije', 'genitalni', 'glamurozna', 'glava', 'gospodin', 'gospodina', 'grijeh', 'harem', 'heteroseksualac', 'hijerarhija', 'hiv', 'homofobija', 'identitet', 'imaginarno', 'incest', 'jednakost', 'karijera', 'kastracija', 'klopka', 'kontracepcija', 'kurva', 'legalizirati', 'lezbijka', 'lgbt', 'lijepa', 'ljubav', 'lopta', 'majka', 'matematika', 'medvjed', 'miraz', 'moda', 'naknada', 'napad', 'napustiti', 'nasilje', 'nebo', 'nelagoda', 'nemoralno', 'nenormalna', 'neprirodno', 'netolerancija', 'nevidljiva', 'nevidljivost', 'obitelj', 'obrazovanje', 'obrnuto', 'okrivljavanje', 'orgija', 'osuditi', 'otac', 'plodno', 'plodnost', 'ponos', 'porno', 'pornografija', 'poslodavac', 'pravda', 'preljub', 'prirodno', 'pristanak', 'privilegija', 'proganjanje', 'promet', 'prostitucija', 'prostitutka', 'queer', 'radikalno', 'radnik', 'raj', 'razvod', 'religija', 'represija', 'rod', 'roditelj', 'roditeljstvo', 'sakrament', 'samosvijest', 'savjetovanje', 'segregacija', 'seks', 'seksi', 'seksizam', 'seksualno', 'seksualnost', 'sentimentalna', 'sida', 'silovanje', 'slatko', 'sleng', 'spasenje', 'sport', 'stabljika', 'status', 'stav', 'stereotip', 'tijelo', 'tranzicija', 'ubojstvo', 'ugnjetavanje', 'uloga', 'umjetnost', 'uvreda', 'uvredljivo', 'uznemiravanje', 'vagina', 'varanje', 'vodstvo', 'vrag', 'zamjenica', 'zamka', 'zaposlenik', 'zina', 'zlo', 'zlostavljanje')
hr_similarity_matrix <- multicos(final_words_hr, final_words_hr, tvectors=hr_cbow);
write.csv(hr_similarity_matrix, file.path('/Users/francesca/PycharmProjects/HLT_project/matrices/', "hr_similarity_matrix"), row.names = TRUE)