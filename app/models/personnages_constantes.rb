module PersonnagesConstantes

TYPE = ["Mortel", "Mage", "Vampire"] #, "Goule", "Kinain", "Mage-Goule", "Mage-Kinain", "Technocrate", "Néphandi"]

  TYPE_DESCRIPTION = {"Mortel" => "Les mortels forment la masse grouillantes des êtres vivants penssant du monde des ténèbres. Et même si les humains ne possèdent pas de pouvoirs et sont ignorant de la réalitée du monde des ténèbres, la plupart des créatures surnaturelles ne pourraient pas vivre sans eux.",
                      "Mage" => "Les mages ont toujours été des êtres humains exceptionnels. Ils ont la volonté, l'illummation l'imagination pour saisir ce qui ne se voit pas, rechercher I'inconnu et illuminer ce qui sera demain. Ces gardiens de la sagessc livrent leur propre guerre, ou ils determinent le futur de l'humanité (esperent-ils) et combattent pour le droit de garder leurs croyances malgré la montée d'un conformisme stérile. Pendant ce temps, ils doivent équilibrer les exigences de la magie avec la panoplie terrible d'un monde fou et pourrissant. Ils peuvent être les dernières étincelles contre l'histoire, tant qu'ils survivent à leur propre Eveil dans ces froides nuits magiques.",
                      "Vampire" => "Les vampires sont des cadavres suceurs de sang, sortant de leur tombe pour festoyer du sang des vivants. des monstres damne2s qui échappent à l'Enfer en volant la vie. Des prédateurs sensuels dérobant leur pitance en s'attaquant à d'innocentes - ou peut-être consentantes ? - victimes. Depuis toujours, l'humanité parle des vampires, des non-morts, des esprits démoniaque vivants dans des corps humains, des cadavres sortis de la tombe avec une soif dévorante de sang chaud. Les vampires sont parmi nous depuis les temps préhistoriques. Ils sont toujours là. Ils mènent une guerre secrète et snas merci depuis les premières nuits de l'humanité. Et le résultat de cette lutte éternelle pourrant déterminer le futur de l'humanité, ou sa condamnation finale."}

  BASE_BY_TYPE = {"Mage" => "7/5/3;13/9/5;7", 
                  "Vampire" => "7/5/3;13/9/5;7", 
                  "Mortel" => "6/4/2;11/7/3;5",
                  "Changelin" => "7/5/3;13/9/5;7", 
                  "Métamorphe" => "7/5/3;13/9/5;7", 
                  "Ombre" => "7/5/3;13/9/5;7"}

  TRADITION = ["Verbena", "Ordre d'Hermès", "Choeur Céleste", "Adepte du virtuel",
               "Fraternité Akashite", "Euthanatos", "Onirologues", "Fils de l'Ether",
               "Culte de l'Extase", "Excavés", "Orphelins"]

  TECHNOCRATIE = ["Ingénieur du vide", "Progéniteur", "Nouvel ordre mondial", "Itération X", "Syndicat"]

  DISPARATE = ["Ahl'I'Batin", "Taftani", "Solificati", "Kopa Loei"]

  MAGE_BY_TYPE = {
    "Tradition" => TRADITION,
    "Technocratie" => TECHNOCRATIE,
    "Autre mages" => DISPARATE,
    "Maraudeur" => ["Maraudeur"],
    "Nefandi" => ["Nefendi"]
  }

  TRADITION_DESCRIPTION = {"Verbena" => "Nous venons au monde sauguinolents et criads, nous traquons la chair et les fruits pour notre suirvie. Nous grandissons, apprenons et nous adaptons. Nous Défaillons et mourrons, pour pourrir une nouvelle vie. Ce Cycle sans fin préoccupe les Vervena et son pouls constant bas au coeur de la Tradition. Sorciers primordiaux, puissants guérisseurs, habile métamorphes, les Verbena aiment le sexe, le sang et la chair.\nSphère de spécialisation : Vie.",
                           "Ordre d'Hermès" => "Ancêtre des Traditions, mystiques hors pairs, détenteurs des clefs du Paradis, l'Ordre d'Hermès veut porter tous ces noms. Que cette prétention soit honorable ou pur orgueil, l'Ordre a donné plus aux Traditions, possède plus d'Archimages et a crée plus de théories magiques codifiées que tous les autres groupes du Conseil. Ces travailleurs archarnés affichent fièrement leurs réussites de sorciers, de maîtres des rituels et des sorts, de sages de grand renom et de constructeurs d'artefacts eet de Fondations. Pourtant, leur unité cache de puissantes intrigues poliques.\nSphère de spécialisation : Force.",
                           "Choeur Céleste" => "Le Choeur célèste est l'une des Traditions les moins comprises. Bien que ce soit indubitablement une Tradition religieuse, elle ne préfère pas une religion à une autre. l'Unique et le Prime que révère le Choeur transcendent toutes les déités. Toute ]'humanité fait partie du chant cosmique, de l'éclat radieux du Pur et du Prime. Lorsque l'hmanité sera réunie à nouveau dans cette foi, le Prime sera entier, le chant sera manifeste et l'univers guéri.\nSphère de spécialisation : Prime.",
                           "Adepte du virtuel" => "Aucune Tradition ne reflète autant le monde moderne que les Adeptes du Virtuel. Ces anciens Technocrates comptent sur la technologie et ses applications pour donner du pouvoirs aux gens et ils luttent pour que leur technologie soit accessible à tous. Alors que la plupart des membres des Traditions preservent leurs manières antiques et cherchent à les renouveler, les Adeptes du Virtuel sont à l'affut des nouveautés. Ils surfent sur la vague de l'évolution informatique et utilisent ces machines pour étendre leur esprit, autoriser la communication mondiale et modeler de nouvelles visions de la réalité. En donnant aux Masses la technologie informatique et les outils de communication, ils aident les gens à enrichir leur esprit.\nSphère de spécialisation : Correspondance.",
                           "Fraternité Akashite" => "L'esprit et le corps sont la partie la plus importante d'une personne, et celle-ci fait partie intégrante de l'univers. L'identité, la division et ls conflits sont des illusions. Lorsque l'esprit et le corps sont en harmonie, l'âme aussi. Lorsque l'individu ne résiste pas à l'univers mais le suit, il étreint sa nature. La Fraternité Akashite est née de ces racines philosophiques. En renforçant leur corps, les Frères en font un temple pour l'esprit. Lorsque l'esprit est éclairé, la compréhension vient.\nSphère de spécialisation : Psyché.",
                           "Euthanatos" => "Il est difficile d'accepter le fait qu'un jour, la conscience telle que chaque être humain le conflit s'achèvera. Le mort, pour la plupan des gens, est une terrible inconnue qu'il faut éviter à tout prix. II est alors peu étonnant que les gens regardent les Euthanatos en ressentant un grand froid. Les Euthanatos connaissant la mort et ils savent qu'elle doit se produire. Parfois, ces mages apportent la mort avec eux. Mais, la plupan du temps, ils apportent le potentiel pour une renaissance, pour semer la création dans les vestiges du passé.\nSphère de spécialisation : Entropie.",
                           "Onirologues" => "Ce sont ceux qui parlent aux esprits, les amis des animaux, les frères du vent et les soeurs de la Terre. Ces mages arpentent les frontières entre le monde physique et les royaumes des rêves, rassemblant sagesse et talents auprès des esprits natifs de la terre, du ciel et de l'eau. Les Onirologues sont souvent traités de shamanes et cela leur va bien. Ce sont les intermédiaires entre l'humanité et l'Esprit, ceux qui comminiquent entre les deux mondes, préservant l'équilibre et les relations entre les habitants des deux royaumes.\nSphère de spécialisation : Esprit.",
                           "Fils de l'Ether" => "Toute la science n'a pas besoin d'être la procédure banale et réglementée, prônée par la Technocratie. C'est ce que disent les Fils de l'Ether et ils pratiquent ce qu'ils prêchent. Un Fils de l'Ether utilisent tout, des folles sciences victoriennes aux récentes théories alternatives. Alors que les Technomanciens créent de nouveaux mondes, les Fils de l'Ether reprennent les reprennent les rejets de la technologie et en font des créations de l'imagination.\nSphère de spécialisation : Matière.",
                           "Culte de l'Extase" => "De nombreux initiés rejoignent le Culte car il a la réputation d'être perpetuellement en fête, L'opinion populaire veut que le Culte ne se résume qu'au sexe, drogues et rock'n'roll. Lorsque les mages participent à la fête, il découvrent que les réjouissances sont très particulières. Le Culte de l'Extase utilise effectivement les drogues, la musique et même le sexe, mais ce sont des moyens pour atteindre un but, un état mental qui transcende le monde physique, pour permettre au mage de voir au-delà de ses sens habituels et de sortir des sentiers battus. Les Cultistes prennent le mot extase dans son sens originel : afflux soudain et immense de sentiments qui catapultent le sujet dans un état altéré.\nSphère de spécialisation : Temps.",
                           "Excavés" => "Les gens se meurent, de même que les idéaux, la magie et le monde. Les Excavés le savent depuis un certain temps et l'ont accepté. Maintenant, ils savent que le monde s'écroule, mais il veulent profiter de la décadence. Se réjouissant du nihilisme et du refus des moeurs sociales, les Excavés s'abandonnent avec délices à l'élégance gothique et à un langueur décandente et romantique.\nSphère de spécialisation : Aucune.",
                           "Orphelins" => "Ceux qui s'Éveillent seuls sont de plus en plus nombreux en débit des difficultés causées par le Pogrom de la Technocratie et les politiques musclées de recrutement des Traditions. Actuellement, de plus en plus de gens s'Éveillent spontanément sans mentor. Ils sont obligés de trouver leur propre voie.\nSphère de spécialisation : Aucune."}

  SPHERES_MAGE = {"Verbena" => "Vie", "Ordre d'Hermès" => "Forces", "Choeur Céleste" => "Prime",
                  "Adepte du virtuel" => "Correspondance", "Fraternité Akashite" => "Psyche",
                  "Euthanatos" => "Entropie", "Onirologues" => "Esprit", "Fils de l'Ether" => "Matiere",
                  "Culte de l'Extase" => "Temps", "Excavés" => "Aucun", "Orphelins" => "Aucun", "Nefendi" => "Aucun", 
                  "Maraudeur" => "Aucun", "Ingénieur du vide" => "Matiere", "Progéniteur" => "Vie", "Nouvel ordre mondial" => "Psyche", 
                  "Itération X" => "Correspondance", "Syndicat" => "Entropie", "Ahl'I'Batin" => "Correspondance", 
                  "Taftani" => "Esprit", "Solificati" => "Forces", "Kopa Loei" => "Forces"}

  CLAN = ["Assamite", "Brujah", "Cappadocian", "Setite", "Gangrel", "Giovanni",
          "Lasombra", "Malkavian", "Nosferatu", "Ravnos", "Salubri", "Toreador",
          "Tremere", "Tzimisce", "Ventrue", "Baali", "Caïtiff", "Gargouille",
          "Kiasyd", "Lhiannan", "Nagaraja", "Samedi",
          "Vrai Brujah", "Anda", "Noad", "Agarash", "Disciple de Kali"]

  APPARTENANCE = TRADITION + TECHNOCRATIE + DISPARATE + ["Maraudeur"] + ["Nefendi"] + CLAN

  CLAN_BY_TYPE = {
    "Camarilla" => ["Brujah", "Gangrel", "Malkavian", "Nosferatu", "Toreador", "Tremere", "Ventrue", "Gargouille"],
    "Sabbat" => ["Lasombra", "Tzimisce", "Kiasyd", "Samedi"],
    "Indépendant" => ["Assamite", "Cappadocian", "Setite", "Giovanni", "Ravnos"],
    "Autre" => ["Lhiannan", "Salubri", "Baali", "Nagaraja", "Vrai Brujah", "Anda", "Noad", "Agarash", "Disciple de Kali"]
  }

  CLAN_DESCRIPTION = {"Assamite" => "Les Assamites sont arrivés des étendues désertiques de l'Orient. Ils sont connus des vampires comme étant des assassins, travaillant pour ceux qui y mettent le prix. Le prix qu'ils demandent est de la vitae d'autres vampires. Pour eux la diablerie est le plus grand des sacrements et aucun autre clan n'a acquis une telle réputation en ce qui concerne ce sujet. Discipline de Clan : Célérité, Occultation, Quietus.",
                      "Brujah" => "Les Brujahs étaient autrefois les rois philosophes de la Mésopotamie, de la Perse et de Babylone. Ils contrôlaient un empire s'étendant du berceau de la civilisation au nord de l'Afrique, et accumulèrent des connaissances du monde entier. Cependant, il est dit que dans leur recherche de liberté et d'illumination, ils tuèrent leur fondateur. Discipline de Clan : Célérité, Puissance, Présence.",
                      "Cappadocian" => "Connus depuis des millénaires, parmi les Caïnites, comme le «clan de la mort», les Cappadocians sont rejetés même par leurs frères à cause de leurs intérêts macabres. Cappadocius lui même était un prêtre iconoclaste de son vivant, et après son Passage il poursuivit ses recherches sur les secrets de la vie, de la mort et de ce qu'il deviendrait. Discipline de Clan : Auspex, Force d'âme, Nécromancie.",
                      "Setite" => "Les Setites sont considérés avec plus de méfiance que tous les autres clans. Leurs liens avec le Serpent mythologique sont bien connus, et soutenus par d'étranges pouvoirs. Si un Setite pénètre dans une ville, le pouvoir Caïnite en place s'effrite inévitablement. Discipline de Clan : Occultation, Présence, Serpentis.",
                      "Gangrel" => "Les Gangrels sont des nomades solitaires qui préfèrent les étendues sauvages à la société. Restant rarement en place, ils ne trouvent du plaisir qu'en voyageant seuls sous la lune. C'est d'ailleurs le clan qui a le plus d'affinités avec les Loup-Garous. Mais la présence de Garous féroces et hostiles les obligent souvent à s'orienter vers les villes. Ce sont de féroces guerriers guidés par leur instinct bestial et qui aiment généralement peu la présence des autres vampires. Discipline de Clan : Animaliste, Force d'âme, Protéisme.",
                      "Giovanni" => "C'est vers le 12ème siècle que des agents du clan Cappadocien rencontrèrent une petite cabale de nécromanciens mortels au sein de Venise. Cette cabale, uniquement composée de membre de la famille Giovanni, avait profité des croisades pour s'enrichir. Discipline de Clan : Domination, Nécromancie, Puissance.",
                      "Lasombra" => "Les Lasombras sont les meneurs du Sabbat, les membres les plus loyaux de la secte et les plus agressifs. Ils font tout pour offrir les meilleurs dirigeants à la secte, en créant des conflits et des intrigues internes au clan. Ainsi une sélection des meilleurs éléments est effectuée et seuls les plus puissants dirigent la secte, mais en aucun cas ils ne favorisent un membre d'un autre clan. Ils sont machiavéliques, rusés et fourbes. Discipline de Clan : Domination, Obtenebration, Puissance.",
                      "Malkavian" => "Tous les autres clans craignent les Malkavian à cause de leur folie, qui peut prendre n'importe quelle forme, de la rage aveugle à la catatonie. Mais la plupart du temps, il est difficile de distinguer un Malkavian d'un être 'sain d'esprit'. Ceux dont la folie est apparente sont certainement les plus dangereux. Ils ne sont que les esclaves de leurs propres lubies. Discipline de Clan : Auspex, Aliénation, Occultation.",
                      "Nosferatu" => "Les Nosferatu souffrent de la malédiction la plus visible : ils ont été déformés par leur malédiction du sang. Après l'Etreinte, le jeune vampire subit des déformations pour finalement, au bout d'une semaine, finir en un monstre hideux. La psychologie du jeune en prend souvent un coup, de plus, il devient incapable de marcher parmi les autres avec sa nouvelle apparence. Il rejoint alors ses frères qui sont généralement dans les égouts ou les catacombes. Discipline de Clan : Animaliste, Occultation, Puissance.",
                      "Ravnos" => "Les Ravnos sont célèbres pour leur sens de l'humour noir très particulier. Ils sont des mystificateurs de premier ordre, tissant illusions et mensonges par leur fantaisie. Les Ravnos respectent scrupuleusement les marchés qu'ils passent, autant avec les mortels qu'avec les vampires, dignes des pactes avec le diable. Ils s'abattent donc sans pitié sur ceux qui sont incapables d'en payer les termes cachés. Discipline de Clan : Animaliste, Chimérie, Force d'âme.",
                      "Salubri" => "Jadis cités parmi les plus estimés des guérisseurs et professeurs, les Salubrien sont désormais traqués et méprisés. La mort de Saulot au 12e siècle a dramatiquement modifié leur destin ; ils doivent désormais survivre nuit après nuit. Discipline de Clan : Auspex, Force d'âme, Obéah.",
                      "Toreador" => "Les Toreadors représentent le clan de la haute société. Ils sont élégants, brillants, et quoi qu'ils fassent, c'est toujours avec passion. Ils savourent leur vie éternelle et sont les plus prodigues des vampires, aimant l'excès et la décadence, tout en affirmant être les protecteurs de l'art. Discipline de Clan : Auspex, Célérité, Présence.",
                      "Tremere" => "Les Tremeres sont les magiciens des vampires et aucun clan n'est entouré d'autant de secrets qu'eux. Avec leurs propres artifices, ils ont développé leur propre magie vampirique liée au sang. Les Tremeres possèdent également une hiérarchie hyper structurée (voir organisation), et ne supportent aucun écart (voir factions internes). Discipline de Clan : Domination, Auspex, Thaumaturgie.",
                      "Tzimisce" => "Dans un premier temps, les Tzimisces sont des personnes réservées et perspicaces, loin des meutes hurlantes du Sabbat. Ils paraissent rationnels, supérieurement intelligents, possédant un esprit scientifique et pénétrant. Ensuite, on réalise ce que sont réellement les Tzimisces : depuis des millénaires, les Démons explorent et affinent leur compréhension de la nature vampirique, transformant leur corps et leur esprit vers des formes nouvelles et étrangères. Les victimes subissent aussi souvent ce genre de 'changements'. Discipline de Clan : Animalisme, Auspex, Vicissitude.",
                      "Ventrue" => "Les Ventrues ont toujours été considérés (et se sont toujours considérés) comme l'élite de la race vampirique. Le Livre de Nod nous dit que Caïn avait fait de Veddartha, fondateur de la lignée Ventrue, son confident, et le dernier des Antédiluviens auquel il aurait parlé. Discipline de Clan : Force d'âme, Présence, Domination.",
                      "Baali" => "La lignée est apparue dans les temps anciens. Le plus Vieil infant né d'un Antédiluvien coureur, esclave de basse extraction d'un peuple proto-mésopotamien, s'est élevé contre les treize Antédiluviens. Ce traître démoniaque a forgé une alliance avec les ombres qui vivaient à la périphérie de ce monde. Discipline de Clan : Daimonon, Occultation, Présence.",
                      "Caïtiff" => "Les sans clans",
                      "Gargouille" => " Leur histoire est étroitement liée à celle des Tremere, et notament à Goratrix, et à la Fondation de Ceoris. En 1230, il existe des rumeurs sur une colonie libre de gargouilles... alors même qu'elles ne sont pas censées pouvoir donner le Baiser. Discipline de Clan : Force d'âme, Puissance, Visceratika, Vol.",
                      "Kiasyd" => "Les Kiasyds sont apparus sous le règne de Julien l'Apostat (vers 360). Cette lignée est la création de 3 Lasombras qui opéraient à découvrir la propre nature de leur discipline, Obtenebration. Discipline de Clan : Domination, Mytherceria, Obténébration.",
                      "Lhiannan" => "Les Lhiannans sont largement matriarcales, au point même de repousser le mythe de Caïn. Elles prétendent qu'un personnage obscur féminin, appelée la Vieille, aurait parcouru le monde antique et créé les Lhiannans des gouttes de son sang. Discipline de Clan : Animalisme, Ogham, Présence.",
                      "Nagaraja" => "Les Nagarajas sont des sorcières cannibales provennant, selon certains érudits caïnites, d'un culte de la mort du Moyen-Orient. D'autres ajoutent qu'elles ont également des relations ésotériques avec d'autres sorciers. Très peu nombreuses et en plus chassées et traquées depuis la destruction d'Enoch, elles parlent peu et se cachent. Discipline de Clan : Auspex, Domination, Nécromancie.",
                      "Samedi" => "  La lignée existe depuis quelques centaines d'années et est apparue en Italie et aux Caraïbes. Elle pourrait descendre des clans Nosferatu ou Giovanni mais aucun des deux ne s'en attribue le mérite ou le blâme. Très peu de Samedi se sont répandus aux Etats-Unis. Par contre la lignée s'est largement répandu au cours des 200 dernières années. Il semble que la lignée soit originaire des Caraïbes et qu'elle est un fort héritage vaudou. Discipline de Clan : Force d'ame, Occultation, Thanatosis.",
                      "Vrai Brujah" => "Les Vrai Brujahs sont les descendants directs de Brujah lui-même et non de l'usurpateur qui a engendré le clan Brujah. De ce fait, ils éprouvent un certain dédain pour les Brujahs et leur héritage continuel de diablerie. Ce sont des chroniqueurs et des chercheurs qui voient le monde sans aucune passion. Discipline de Clan : Puissance, Présence, Temporis.",
                      "Anda" => "Ce sont des Mongols Gangrel. Leurs légendes disent que les bandits démons Xia ont combattu les enfants de la Terre Itürgen. Discipline de Clan : Animalisme, Force d'ame, Protéisme.",
                      "Noad" => "Ces Gangrel viennent de Scandinavie. Ils se disent serviteurs des Sami (peuple finlandais). Ils protègent ce peuple, et interprètent les messages des Dieux. Durant les 3 mois d'été, chaque tribu réveille son Noaid protecteur et lui donne du Sang, ce qui demande une confiance réciproque énorme. Ils pensent ne rien avoir à faire avec les autres vampires, et défendent leur culture déjà déclinante au Moyen-Age. Discipline de Clan : Animalisme, Auspex, Protéisme.",
                      "Agarash" => "Secret",
                      "Disciple de Kali" => "Secret"}

  DISCIPLINES_CLAN = {"Assamite" => ["Célérité", "Occultation", "Quietus"], "Brujah" => ["Célérité", "Puissance", "Présence"],
                      "Cappadocian" => ["Auspex", "Force d'âme", "Nécromancie"], "Setite" => ["Occultation", "Présence", "Serpentis"],
                      "Gangrel" => ["Animalisme", "Force d'âme", "Protéisme"], "Giovanni" => ["Domination", "Nécromancie", "Puissance"],
                      "Lasombra" => ["Puissance", "Obténébration", "Domination"], "Malkavian" => ["Auspex", "Aliénation", "Occultation"],
                      "Nosferatu" => ["Animalisme", "Occultation", "Puissance"], "Ravnos" => ["Animalisme", "Chimérie", "Force d'âme"],
                      "Salubri" => ["Obéah", "Force d'âme", "Auspex"], "Toreador" => ["Auspex", "Célérité", "Présence"],
                      "Tremere" => ["Domination", "Auspex", "Thaumaturgie"], "Tzimisce" => ["Animalisme", "Auspex", "Vicissitude"],
                      "Ventrue" => ["Force d'âme", "Domination", "Présence"],
                      "Baali" => ["Daimonon", "Occultation", "Présence"], "Caïtiff" => ["Puissance", "Célérite", "Force d'âme"],
                      "Gargouille" => ["Force d'âme", "Puissance", "Visceratika", "Vol"], "Kiasyd" => ["Domination", "Mytherceria", "Obténébration"],
                      "Lhiannan" => ["Animalisme", "Ogham", "Présence"], "Nagaraja" => ["Auspex", "Domination", "Nécromancie"],
                      "Samedi" => ["Force d'âme", "Occultation", "Thanatosis"],
                      "Vrai Brujah" => ["Puissance", "Présence", "Temporis"], "Anda" => ["Animalisme", "Force d'âme", "Protéisme"],
                      "Noad" => ["Animalisme", "Auspex", "Protéisme"], "Agarash" => ["Nécromancie", "Protéisme", "Domination"],
                      "Diciple de Kali" => ["Puissance", "Obténébration", "Présence"]}

  VOIE = ["La Voie de l'Humanité", "La Voie de la Bête", "La Voie de la Chevalerie", "La Voie des Coeurs Ecorchés",
          "La Voie de la concentration Intérieure", "La Voie du Diable", "La Voie de Lilith",
          "La Voie des Métamorphoses", "La Voie de la Nuit", "La Voie des Ossements",
          "La Voie du Paradis", "La Voie du Paradoxe", "La Voie du Sang", "La Voie du Typhon"]

  ARCHETYPE = ["Abandonné", "Ange Gardien", "Architecte", "Autiste", "Autocrate",
               "Avant Gardiste", "Barbare", "Battant", "Bon Vivant", "Bouffon",
               "Brute", "Chevalier", "Confident", "Conformiste", "Déviant",
               "Dirigeant", "Enfant", "Fanatique", "Gardien", "Gourou",
               "Grincheux", "Idéaliste", "Individualiste", "Innovateur",
               "Opportuniste", "Optimiste", "Passionné", "Pédagogue", "Pénitent",
               "Perfectionniste", "Poltron", "Provocateur", "Rebelle", "Risque Tout",
               "Satique", "Sage", "Scientifique", "Séducteur", "Sensuel", "Sociopathe",
               "Soldat", "Solitaire", "Survivant", "Tyran", "Visionnaire"]

  ATTRIBUT = ["force", "dexterite", "vigueur",
              "charisme", "manipulation", "apparence",
              "perception", "intelligence", "astuce"]

  ATTRIBUT_DESC = {"force" => "Les points que vous assignez à la Force de votre personnage représente sa force brute. Cela détermine le poids qu'il peut soulever, porter ou pousser.",
                   "dexterite" => "La dextérité mesure les capacités athlétiques d'un personnage. Elle exprime ses prouesses physiques, comme la grâce, la vitesse, les réflexes physiques, la coordination des mouvements et l'agilité.",
                   "vigueur" => "La vigueur représente la capacité d'un personnage à supporter l'effort physique. C'est une mesure de la résistance corporelle et de l'adaptation.",
                   "charisme" => "Le charisme d'un personnage évalue son charme et son caractère agréable. Il représente sa capacité à séduire, plaire, complimenter et impressionner les autres.",
                   "manipulation" => "Ce trait couvre la capacité d'un personnage à faire plier les autres devant ses caprices, à remarquer lorsque quelqu'un essaie de le manipuler ou de cacher ses réelles motivations.",
                   "apparence" => "L'apparence représente la beauté générale de votre personnage. Cela inclut sa beauté physique, sa grâce et les qualités indéfinissables qui rendent une personne attirante.",
                   "perception" => "Ce trait exprime la capacité d'un personnage à remarquer les détails de son environnement.",
                   "intelligence" => "L'Intelligence définit ce que les gens appellent l'habilé. Cela represente la capacité a résoudre des problèmes, à se rappeler de certains faits, à évaluer des situations, à raisonner et faire preuve de logique.",
                   "astuce" => "l'Astuce de votre personnage représente sa capacité à penser rapidement, à réagir avec bon sens aux situations critiques et à trouver des solutions créatives aux problemes immédiats."}

  SEUIL_C = 200
  SEUIL_B = 350
  SEUIL_A = 500
  SEUIL_S = 700

  CAP_PHYSIQUE = ["Athlétisme", "Bagarre", "Vigilance", "Armes à feu", "Conduite", "Furtivité", "Larcin", "Mêlée", "Survie"]
  CAP_MENTAL = ["Conscience", "Artisanats", "Méditation", "Droit", "Érudition", "Finances", "Informatique", "Investigation", "Médecine", "Occultisme", "Politique", "Sciences", "Technologie"]
  CAP_SOCIAL = ["Commandement", "Empathie", "Expérience de la rue", "Expression", "Intimidation", "Intuition", "Subterfuge", "Animaux", "Étiquette", "Représentation"]

  POINTS_SANG = {"13" => 10, "12" => 11, "11" => 12, "10" => 13, "9" => 14, "8" => 15, "7" => 20, "6" => 30, "5" => 40, "4" => 50}

  FONT_WOD = {
    "correspondance" => 'a',
    "entropie" => 'b',
    "esprit" => 'c',
    "forces" => 'd',
    "matiere" => 'e',
    "prime" => 'f',
    "psyche" => 'g',
    "temps" => 'h',
    "vie" => 'i',
    "Ahl'i'batin2" => 'j',
    "Maraudeur" => 'k',
    "Solificati" => 'l',
    "Nefendi" => 'm',
    "Taftani" => 'n',
    "Fraternité Akashite" => 'o',
    "Choeur Céleste" => 'p',
    "Culte de l'Extase" => 'q',
    "Onirologues" => 'r',
    "Euthanatos" => 's',
    "Excavés" => 't',
    "Ordre d'Hermès" => 'u',
    "Fils de l'Ether" => 'v',
    "Verbena" => 'w',
    "Nouvel ordre mondial" => 'x',
    "Syndicat" => 'y',
    "Tehcnocratie" => 'z',
    "Progéniteur" => 'A',
    "Itération X" => 'B',
    "Ingénieur du vide" => 'C',
    "autre" => 'D',
    "Cappadocian" => 'E',
    "Giovanni" => 'F',
    "Ahrimane" => 'G',
    "Lamia" => 'H',
    "Gangrel" => 'I',
    "Gargouille" => 'J',
    "Brujah" => 'K',
    "Frere de sang" => 'L',
    "Enfants d'Osiris" => 'M',
    "Baali" => 'N',
    "Kiasyd" => 'O',
    "Anda" => 'P',
    "Caïtiff" => 'Q',
    "Lasombra" => 'R',
    "Assamite" => 'S',
    "Tzimisce" => 'T',
    "Samedi" => 'U',
    "Setite" => 'V',
    "Salubri" => 'W',
    "Ravnos" => 'X',
    "Nosferatu" => 'Y',
    "Vrai Brujah" => 'Z',
    "Toreador" => '0',
    "Lhiannan" => '1',
    "Nagaraja" => '2',
    "Noad" => '3',
    "Tremere" => '4',
    "Ventrue" => '5',
    "Malkavian" => '6',
    "Disciple de Kali" => '7',
    "Agarash" => '8',
    "Mage" => '9',
    "Agarash" => ',',
    "Camarilla" => ';',
    "Sabbat" => ',',
    "Indépendant" => '?',
    "Autre" => '!',
    "Changelin" => '$',
    "Ombre" => '=',
    "Orphelins" => ')',
    "Vampire" => '@',
    "Kopa Loei" => '-',
    "Mortel" => '_',
    "Personnage" => '/',
    "Métamorphe" => '*',
    "Ahl'I'batin" => '§'
  }
end
