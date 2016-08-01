/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : blog_test

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-08-01 20:44:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2016_07_05_091658_create_posts_table', '1');
INSERT INTO `migrations` VALUES ('2016_07_29_114355_create_tags_table', '2');
INSERT INTO `migrations` VALUES ('2016_07_29_114613_create_post_tag_pivot', '2');
INSERT INTO `migrations` VALUES ('2016_08_01_204024_restructure_posts_table', '3');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_raw` text COLLATE utf8_unicode_ci NOT NULL,
  `content_html` text COLLATE utf8_unicode_ci NOT NULL,
  `page_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_draft` tinyint(1) NOT NULL,
  `layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'blog.layouts.post',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 DEFAULT 'published',
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_published_at_index` (`published_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', 'dolores-quia-suscipit-quibusdam-voluptates-nostrum-non-dolor-officia-autem-excepturi-sequi', 'Dolores quia suscipit quibusdam voluptates nostrum non dolor officia autem excepturi sequi.', '', 'Est non consequatur beatae excepturi facere est mollitia. Dicta dignissimos quia rerum vel. Laborum aut autem ducimus aut sequi consequuntur.\n\nEum doloremque est aperiam dolores. Reprehenderit tempora molestiae nulla in. Ad adipisci ex impedit consequatur.\n\nUt aliquam vel quod nemo doloremque ut id culpa. Delectus sit qui suscipit sed ut itaque tempora harum. Et voluptate voluptatem omnis sit ipsa. Placeat sit voluptatem qui distinctio rerum voluptas. Ad corporis dolorem nihil.\n\nDucimus quasi velit ut. Odio id atque itaque sequi repudiandae ducimus at. Et facere unde culpa totam qui aut aliquid voluptate. Pariatur voluptatem ipsum in quasi nesciunt.\n\nAut aut nisi ipsam velit. Est quibusdam illo nobis et fugiat accusantium. Odio placeat sint occaecati quo maxime quia natus repellendus. Ipsa voluptas ut veritatis error soluta unde.\n\nUt est tempore ab error. Et adipisci odit harum iure inventore.\n\nLabore eum sit quas voluptas ullam. Ipsa aspernatur ipsum adipisci nisi. Alias consequatur nostrum quia praesentium. Minima qui placeat adipisci possimus quam id.\n\nMolestiae quia et totam ut. Magni recusandae omnis quia et aperiam optio.\n\nUt atque quod est laboriosam omnis vitae aut. Vel neque neque numquam quia consequatur rerum. Fugiat ea officiis ducimus quis sint qui quasi et. Dolorem illum et ea.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:35', '2016-07-06 09:02:35', '2016-07-06 06:12:20', 'published');
INSERT INTO `posts` VALUES ('2', 'id-qui-a-aut-tempore-omnis-nam', 'Id qui a aut tempore omnis nam.', '', 'Aliquam consequatur est quia eum totam voluptatem. Quidem deleniti est ut quas et rerum. Ducimus quia rerum porro amet delectus eum voluptate. Inventore et ut quis sint quis.\n\nIllo quasi at voluptatem dolor similique voluptatem dolores. Repellat ut voluptates sed adipisci et voluptatum quos. Et quia facere totam commodi molestias harum.\n\nLabore soluta commodi rem laborum quam nihil sint. Molestiae pariatur amet et sit deserunt consequatur non. Unde necessitatibus sed necessitatibus. Non optio sed ad et quo non.\n\nIn eaque nobis ullam. Exercitationem omnis aut iusto natus et dolores dolores. Delectus temporibus aliquam odio est vel laboriosam perspiciatis. Est expedita quae consequatur suscipit numquam eveniet. Blanditiis commodi ut nesciunt beatae sapiente rerum.\n\nUt amet aperiam sed modi consequuntur in in sint. Deleniti velit harum et animi quia autem repellat. Officiis cupiditate corporis deserunt pariatur est.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:35', '2016-07-06 09:02:35', '2016-06-12 15:13:57', 'published');
INSERT INTO `posts` VALUES ('3', 'laborum-dolorum-aut-enim-facilis-dolor-vitae', 'Laborum dolorum aut enim facilis dolor vitae.', '', 'Totam recusandae placeat accusantium dolores sit quis. Laudantium esse et dolores sunt non quia nulla. Dolores voluptas tenetur vitae est nemo. Sit est necessitatibus quod.\n\nVoluptates iusto provident nihil ab. Saepe aut maiores dolores quibusdam ullam quia occaecati. Dolorem iure impedit et eum maiores vel provident distinctio. Eligendi iste et est quisquam et assumenda.\n\nOdio sunt fugiat esse voluptatibus. Ut repellat quibusdam debitis sunt maiores vel repudiandae. Voluptas autem non aliquid.\n\nVoluptatibus non non maxime neque possimus magni. Quo corrupti labore ut sit corrupti odit iste. Quos repellat minus et. Minima dolores recusandae consequuntur cupiditate dicta debitis nisi a.\n\nPerspiciatis tempora fuga totam voluptate impedit tenetur. Fuga quia voluptates error provident sint qui officia. Recusandae quia culpa commodi quidem consectetur dolores. Sapiente est nam corporis laboriosam voluptatum. Tempore qui quisquam consectetur aut at.\n\nAut quas officia expedita. Perspiciatis adipisci sit tempore est aut vel et. Necessitatibus ad non id dolores quos quibusdam laudantium.\n\nUnde ab numquam quis et reiciendis sapiente. Iste et nam et.\n\nVoluptatibus aut ut animi rerum animi neque itaque. Est quo ut sequi beatae mollitia alias ut. Enim adipisci quam qui nihil voluptas quos.\n\nPerspiciatis qui sunt veniam minima maiores autem. Voluptatum nulla itaque ratione enim voluptas provident.\n\nVitae culpa repellendus mollitia eos qui aut. Quod dicta enim quia nostrum et omnis. Ipsam repellat tempore voluptatem cum accusamus consequatur laborum. Atque alias voluptatem nisi repellendus sit. Voluptates corrupti quis rerum quis ut rerum.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:35', '2016-07-06 09:02:35', '2016-07-09 06:16:15', 'published');
INSERT INTO `posts` VALUES ('4', 'nulla-quod-est-id-fugit-unde-quas-quae', 'Nulla quod est id fugit unde quas quae.', '', 'Similique distinctio mollitia voluptates dolor aut. Fuga deleniti qui dolorem voluptates tempora et fugiat exercitationem. Id minima ea dolore vel ea dignissimos porro tempora.\n\nReiciendis vel est velit. Praesentium atque commodi facilis officia quia velit. Et est laborum rem numquam dicta autem magnam facilis. Perferendis rem non facilis sed optio enim est.\n\nUt ad est vel maiores et. Et reiciendis iusto distinctio sunt. Dolore aperiam nemo architecto odio dignissimos.\n\nDolor inventore quod quae aut neque. Alias eius quia quas debitis exercitationem. Velit illo repudiandae neque iure. Qui suscipit reiciendis in et minus.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:35', '2016-07-06 09:02:35', '2016-07-08 10:40:44', 'published');
INSERT INTO `posts` VALUES ('5', 'ea-culpa-optio-aut-cum', 'Ea culpa optio aut cum.', '', 'Repellat delectus vel quas dolores harum. Numquam consequatur vel possimus illo quisquam non. Voluptas sed consectetur veniam quibusdam.\n\nMollitia dolores iste sit eum voluptas sed possimus. Possimus asperiores minus id laborum deleniti mollitia. Ratione fuga sit distinctio eaque et at odit dolores. Occaecati delectus nisi dignissimos et facilis eveniet velit.\n\nRepellat mollitia tenetur qui a animi hic quos. Nam voluptatem perferendis quia et provident ullam voluptatem. Dolor consectetur pariatur non numquam atque molestiae odio ea. Id pariatur voluptate ut a totam non.\n\nEt quaerat aut dolor impedit voluptatem quisquam. Et voluptatibus placeat beatae cumque dolorem quam repudiandae. Nihil rerum quisquam qui.\n\nQuia perspiciatis et itaque et qui. Omnis vel sint est et distinctio. Et rem aperiam modi hic pariatur corporis.\n\nPorro nostrum magnam temporibus illum nisi earum. Provident magnam rem aut et ducimus. Ipsa facere rerum numquam eligendi. Non et ut deleniti vitae occaecati voluptatem.\n\nDolores aliquam aut non voluptatem magnam. Id est aut sunt temporibus. Voluptas facere velit sequi accusantium ut deserunt. Odio laborum est impedit qui.\n\nVitae vel non corporis eos cupiditate esse. Earum qui beatae omnis enim mollitia repudiandae. Id quod nihil nisi quibusdam sint omnis vel. Vel facilis culpa possimus nulla quia.\n\nMolestiae accusamus doloribus a. Et ab dicta aliquam hic modi. Ducimus optio sit natus voluptatem. Itaque omnis modi aut dolore nisi sapiente quam.\n\nMinus doloribus voluptatem est totam et accusamus eos. Eos molestiae ex quasi reprehenderit illo. Sunt cumque alias sit modi.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:35', '2016-07-06 09:02:35', '2016-06-30 06:59:31', 'published');
INSERT INTO `posts` VALUES ('6', 'vero-ullam-aut-dolorem-velit-maiores-nihil-corporis', 'Vero ullam aut dolorem velit maiores nihil corporis.', '', 'Minima adipisci voluptas eius porro et placeat. Quod hic dolores id aperiam aut facere. Qui optio ipsam sit fuga numquam suscipit molestiae quia. Ut omnis ut et fugit magnam.\n\nUt odio blanditiis et. Illo magni cum nobis et placeat. Rem aliquam ut rerum beatae non voluptatem. Accusantium corporis ut illum repellendus.\n\nEius laudantium totam modi delectus perferendis doloremque delectus. Ex aperiam id earum et minima vel ea. Omnis porro omnis incidunt et et nobis dolor.\n\nCommodi excepturi harum illo hic dolores numquam laborum. Quia officia placeat eligendi ut voluptatem dolore non.\n\nAccusamus tempore voluptatibus esse natus error sed libero. Quaerat non ex mollitia nulla rem illum.\n\nQui quo tempore qui ullam. Qui accusamus distinctio id ipsam deleniti minus reprehenderit. Ducimus quidem atque velit consequatur velit molestiae.\n\nCorrupti dolorem ut molestias et vel. Rerum possimus assumenda quibusdam soluta fugit dolorum aut qui. Quo repellat facilis corrupti totam repudiandae id consequatur. Et minus omnis eligendi deleniti non nihil quod molestias.\n\nCum dolorum et quisquam voluptatem in eveniet nostrum. Ut repellat assumenda quae porro consectetur at deserunt. Accusamus odio a dolor.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:35', '2016-07-06 09:02:35', '2016-06-21 10:07:35', 'published');
INSERT INTO `posts` VALUES ('7', 'rerum-soluta-laborum-ipsam-hic', 'Rerum soluta laborum ipsam hic.', '', 'Et voluptates quis aut praesentium recusandae id quisquam. Eligendi voluptas itaque sint maxime et. Nobis voluptatem expedita ad sapiente qui tempore hic consequatur. Qui in omnis maiores a aut.\n\nDolor perspiciatis error modi itaque corrupti. Numquam aut laboriosam et assumenda earum asperiores. Illum aut minus maiores dolor quo.\n\nQuod non similique placeat dolorem facilis odio laudantium. Aut natus numquam cupiditate facilis. Consectetur exercitationem aut possimus in sit saepe culpa.\n\nSed accusamus aut est rem qui atque. Beatae cum error minus a accusantium ut nisi. Corporis sed earum tempore voluptatum rerum eum aut. Velit labore qui nulla.\n\nSequi facere numquam inventore sequi minima placeat recusandae. Et voluptatem impedit incidunt autem nobis quaerat. Libero in exercitationem blanditiis quos qui eum iure.\n\nSed quis ut et. Ut voluptatum nulla reiciendis cupiditate est labore sit sequi. Qui atque quos aperiam harum qui necessitatibus quas. Ex commodi quia fugiat.\n\nPossimus occaecati esse architecto totam nihil autem maxime. Sit quis molestias libero voluptates eum debitis vero. Necessitatibus nostrum voluptatem possimus dolores. Optio sit reprehenderit eaque rerum consequuntur minus recusandae.\n\nDolorum odio inventore reprehenderit nesciunt. Et non consequatur velit consequuntur officia. Cumque et soluta necessitatibus neque.\n\nCum modi molestiae doloribus cupiditate molestiae et enim perspiciatis. Enim minima quia voluptatum illo provident hic aliquid. Repellat quis sunt dolores quia placeat ea esse.\n\nVero rerum nobis et sit qui rem. Dignissimos dicta ipsam voluptas voluptatem eum ut delectus. Pariatur dolorem libero consequatur perferendis. Molestiae voluptatum mollitia aut voluptas ea cumque.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:35', '2016-07-06 09:02:35', '2016-06-18 08:53:46', 'published');
INSERT INTO `posts` VALUES ('8', 'omnis-occaecati-velit-nisi-dolorum-at-rerum-qui-sed-cupiditate-possimus-assumenda-nostrum-quibusdam', 'Omnis occaecati velit nisi dolorum at rerum qui sed cupiditate possimus assumenda nostrum quibusdam.', '', 'Soluta ea id in. Quos omnis ea itaque eos. Rem aut sunt vitae commodi et eveniet. Aspernatur ut in eum atque reiciendis ipsum magni. Alias dolor omnis autem nesciunt et.\n\nDolorem et dolores eaque veniam nulla ut. Dicta consequatur et deleniti et consequatur atque error voluptas. Vitae tempore reiciendis ad perferendis.\n\nMollitia voluptatem consectetur nihil accusamus corrupti. Non aut animi autem architecto ipsam. Quia quia quis odit ad suscipit. Eveniet et officiis ex debitis facere provident quas. Magni et ducimus et voluptatum.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:35', '2016-07-06 09:02:35', '2016-07-02 13:39:20', 'published');
INSERT INTO `posts` VALUES ('9', 'consequatur-sint-nihil-sed', 'Consequatur sint nihil sed.', '', 'Repellendus culpa soluta ipsam et maxime. Occaecati rerum debitis ad. Repudiandae ut commodi modi totam.\n\nNam qui inventore est dicta quia vero deleniti. Aut qui nisi asperiores ab unde aut nesciunt. Qui repellat ut autem.\n\nAut veniam eum assumenda consectetur ad ut perferendis. Qui mollitia eos qui aperiam aliquid fugiat. Modi esse necessitatibus similique cupiditate voluptas. Provident nihil laboriosam quam molestiae laboriosam temporibus. At ut consequatur voluptatem voluptatum itaque nam sequi sequi.\n\nAut aut aliquam perspiciatis dolorem illum vitae neque. Perferendis qui consequatur ut placeat quam.\n\nSit culpa dolore aperiam rerum voluptas. A ut sed animi quasi sit quo quo. Error laborum assumenda quia beatae.\n\nExercitationem doloribus aut ipsum numquam et aliquid. Fuga et deserunt iste. Iusto aut est assumenda atque cupiditate. Vitae quia aliquam est in aperiam voluptatum eius. Neque eos quia distinctio possimus qui.\n\nEt dolores accusantium ut enim voluptatum necessitatibus corporis. Consequatur debitis iusto eveniet enim voluptas cumque.\n\nEst ea aliquam quia enim. Facere reiciendis ipsa necessitatibus accusamus ad maiores ab rem. Fugiat id aspernatur sint delectus sit eveniet nam. Nulla consequatur nostrum omnis ut.\n\nTempora quam placeat possimus. Fuga ab accusamus voluptates deleniti sit. Autem et sunt non ex. Atque placeat dicta non aspernatur aut ducimus dolorum. Id id et recusandae architecto qui quos maxime.\n\nEt in et sit nulla voluptas odit. Numquam voluptate et in similique ducimus et. Natus quibusdam facere quidem provident sunt eaque est.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:35', '2016-07-06 09:02:35', '2016-06-24 13:46:32', 'published');
INSERT INTO `posts` VALUES ('10', 'sit-porro-optio-aut-iusto-omnis-est-rem', 'Sit porro optio aut iusto omnis est rem.', '', 'Aut corporis velit explicabo assumenda et. Veniam eum aut illum et minus quis velit. Eum provident quia aliquam.\n\nVoluptate et non quidem et voluptas hic. Molestiae at sit et laudantium qui ipsa. Suscipit molestiae libero quasi et quo eaque. Non repellendus iure et vel dignissimos.\n\nAliquam laudantium provident nihil. Aspernatur unde architecto qui illum eos magni delectus. Odit soluta qui culpa aut consectetur ut optio.\n\nQui est aut eos voluptatem perspiciatis quas. Perferendis officia laboriosam impedit voluptas alias et. Ut dolor nam sapiente illum quasi sint cupiditate.\n\nDolorem impedit quae recusandae et laboriosam. Dolore quia dolore maxime ut. Explicabo quae enim molestiae praesentium nemo.\n\nExplicabo quos occaecati reiciendis similique asperiores harum minima ea. Qui suscipit porro nulla voluptas et. Eum sunt maiores sit.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:36', '2016-07-06 09:02:36', '2016-07-06 09:20:41', 'published');
INSERT INTO `posts` VALUES ('11', 'in-aut-voluptatem-vel-ut-et-voluptatum-quis-alias-quas-soluta-maxime', 'In aut voluptatem vel ut et voluptatum quis alias quas soluta maxime.', '', 'Ipsam quibusdam qui laboriosam velit enim id. Et ut adipisci iste mollitia. Ut consequatur possimus qui sit tempore. Aut non qui non deleniti reprehenderit neque voluptatem.\n\nImpedit dignissimos eum dolores quas. Temporibus ullam magni velit. Dolores labore nesciunt corrupti voluptatem aliquam. Illo reiciendis tempore molestias consequatur vitae.\n\nCum deleniti nihil expedita tenetur. Corrupti ut magni laudantium similique qui nesciunt molestias. Qui eveniet quos non autem ducimus et. Ducimus laudantium debitis excepturi facilis omnis.\n\nSit deleniti quidem optio dicta. Molestiae labore repellendus facere et optio sit. In sit eveniet maiores error cupiditate unde.\n\nAut incidunt aperiam repellat ratione. Nam necessitatibus saepe dolores et. Quam tempore similique omnis. Error quae voluptas mollitia neque adipisci pariatur.\n\nRerum est autem eum totam totam iste omnis. Minus tempore id quis voluptatem non. Ut eum ad et earum amet harum.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:36', '2016-07-06 09:02:36', '2016-06-10 03:49:32', 'published');
INSERT INTO `posts` VALUES ('12', 'sint-earum-quia-quod-sint', 'Sint earum quia quod sint.', '', 'Sunt consequatur dolorum ut rerum. Repellat illum nihil tenetur facilis velit. Et dolores est neque amet voluptatum non.\n\nDebitis explicabo non et. Est accusantium et eaque qui. Ut id inventore non ratione non est repudiandae labore. Vel omnis sit est corporis vel est.\n\nEa aut voluptatem molestiae magni doloribus optio aspernatur suscipit. Qui rerum voluptates a earum placeat sapiente. Officiis blanditiis quibusdam dolor. Sapiente sit facilis sit et quia in quaerat. Vel expedita quia consequatur fugiat.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:36', '2016-07-06 09:02:36', '2016-06-14 10:27:38', 'published');
INSERT INTO `posts` VALUES ('13', 'autem-quasi-consequatur-in-fugit', 'Autem quasi consequatur in fugit.', '', 'Quas maiores dignissimos suscipit. Explicabo rerum repellat explicabo. Accusantium dolorem minima quisquam rem rerum. Voluptas itaque et harum.\n\nQuos recusandae reprehenderit ratione molestias officia ut. Quam et non repellendus. Vitae ipsum deleniti quia amet numquam quis qui. Dolores voluptas consequatur illum quis.\n\nEos qui ab tenetur qui deserunt. Quia perspiciatis modi eum enim et quia quia. Voluptatum alias qui molestiae quasi consequuntur voluptatem sunt error. Quo velit atque et eligendi sit et qui. Id cumque earum eos iure.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:36', '2016-07-06 09:02:36', '2016-07-08 18:17:24', 'published');
INSERT INTO `posts` VALUES ('14', 'eaque-qui-sed-nulla-sit', 'Eaque qui sed nulla sit.', '', 'Consequatur a mollitia necessitatibus. Voluptates quod aut ea sed recusandae hic voluptatem. Reprehenderit quaerat sapiente ex est nihil. Laboriosam explicabo sit perspiciatis similique tenetur id et illum.\n\nSint non asperiores autem possimus eum dolorum perspiciatis. Voluptas veniam dolor tempore ea.\n\nExplicabo omnis et quae. Odio voluptatibus beatae et aliquam praesentium. A perferendis sunt repudiandae harum ipsam.\n\nCulpa occaecati numquam optio sunt et vero eum iure. A minus perferendis ipsam est non. Sit officiis blanditiis sint vel et dolores tenetur. Odio deserunt voluptas ad voluptatem suscipit.\n\nIste delectus non laborum aperiam. Quidem autem sed architecto enim vitae repellendus nemo ut. Est possimus veniam at itaque modi ea id.\n\nDolorum quae sed ut sit accusantium. Nesciunt quae error nam totam quam itaque. Dolorum at laborum est reprehenderit.\n\nReprehenderit odit nisi sunt et sit. Dolorem natus facilis quae odit et perferendis totam. Eligendi pariatur laborum dolores consequatur nemo eius.\n\nIusto unde quia fugit explicabo. Aspernatur libero enim possimus. Aliquam et doloremque aliquid culpa labore optio. Ut autem voluptates esse atque labore.\n\nDelectus ab enim ut deleniti cum. Molestiae sit eum et explicabo at. Perferendis sed nesciunt laboriosam inventore qui. Delectus possimus aut ut atque ea quia non velit.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:36', '2016-07-06 09:02:36', '2016-06-18 21:45:56', 'published');
INSERT INTO `posts` VALUES ('15', 'ipsam-vitae-doloribus-ab', 'Ipsam vitae doloribus ab.', '', 'Doloribus in cumque sint enim. In natus in sit nihil dicta qui adipisci. Repudiandae doloremque qui temporibus dolorum porro.\n\nId praesentium dolorem qui. Error sequi est error velit esse esse explicabo. Delectus quia omnis delectus aut.\n\nPorro ab illum maiores numquam. Et et corporis culpa necessitatibus officia.\n\nFugiat nam incidunt consectetur voluptas. Ut provident sunt id nemo ut est laborum cum. Sit voluptas sequi dolor eum rerum magnam sint quisquam. Eum architecto molestias similique et aperiam odit iste.\n\nDelectus distinctio quaerat dolorem consequatur repellendus aut. Ipsa veritatis aut sed dicta. Quas consequatur velit quis illo.\n\nNemo laboriosam corporis quidem et. Dolore qui asperiores autem cum veritatis vel. Quia velit in neque tempora aut atque tenetur quos.\n\nVeniam voluptatem magnam odit ea fuga. Voluptates vel mollitia totam totam eum sunt maxime.\n\nExpedita dolor porro eius omnis ea et molestiae. Dolor quia sit quo voluptatem iste illum qui. Ea unde et sit error quaerat ipsa nostrum. Sit quod tempore at iure sed nihil. Totam eligendi est voluptatum sed eos dolores at est.\n\nDolorem culpa atque odio rerum repudiandae consequatur qui. Eveniet soluta magni veritatis adipisci. Sit cumque expedita et ea aperiam fuga ullam. Praesentium et minima sint incidunt enim repudiandae est.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:36', '2016-07-06 09:02:36', '2016-06-15 08:22:30', 'published');
INSERT INTO `posts` VALUES ('16', 'consequatur-vitae-ut-molestiae-repellat-voluptatem-recusandae-veniam-provident', 'Consequatur vitae ut molestiae repellat voluptatem recusandae veniam provident.', '', 'Ut corrupti corrupti sint quia qui. Quibusdam temporibus cupiditate non impedit ratione cum rem vel. Velit aut sit dolorum illum consequuntur placeat consequatur. Necessitatibus et quia repudiandae suscipit.\n\nVoluptates rerum deleniti omnis. Sunt debitis incidunt molestias non amet corrupti. Consequuntur quia rerum expedita et corrupti quam quibusdam. Velit cupiditate minus libero quisquam velit qui porro.\n\nMinima doloribus consequatur totam cum perspiciatis excepturi consequatur. Maiores magnam consequatur ea rerum fugit corporis. Sint provident ut ipsa consectetur itaque inventore.\n\nSimilique debitis neque consequatur inventore molestiae quas. Facere consequatur corporis ut qui sit. Voluptates debitis cumque nisi ratione eligendi nemo error quia.\n\nVoluptate accusamus repudiandae non voluptatem velit qui ex a. At accusamus quos corrupti cupiditate eius illum. Libero ipsam ducimus qui. Facere dolor dignissimos laboriosam rerum enim et possimus.\n\nA maiores reiciendis aliquid sapiente amet quia. Dicta nihil quia enim laudantium autem nulla. Cupiditate occaecati sapiente deleniti odio sunt voluptates. Illo dolores harum necessitatibus qui et necessitatibus quia.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:36', '2016-07-06 09:02:36', '2016-07-05 06:42:55', 'published');
INSERT INTO `posts` VALUES ('17', 'consequatur-ducimus-minima-ipsa-quia-earum-culpa-dolorem', 'Consequatur ducimus minima ipsa quia earum culpa dolorem.', '', 'Voluptas ducimus ipsam eum modi autem molestiae. Asperiores voluptatem fugiat tenetur dolores non. Fuga molestias velit quam sunt delectus qui ipsam.\n\nConsequatur voluptatum et nemo sunt minus beatae fugiat. Sapiente voluptatum neque mollitia earum qui. Atque facere ducimus ipsa dolore rem. Tenetur nulla provident odit aliquam deleniti rem inventore.\n\nSunt quis est veritatis cum vitae. Voluptatum exercitationem nulla blanditiis enim perferendis culpa.\n\nMagni ut aut adipisci placeat voluptatem et eius rerum. Iusto et deserunt rem veniam qui dolores aliquam rerum. Animi amet sunt velit ea repellendus et voluptatem. Possimus vitae laudantium maiores beatae.\n\nVel quidem ea animi et. Voluptatibus quis qui adipisci qui eveniet at. Assumenda est ab nemo eligendi mollitia. Et voluptatibus magni vel et saepe.\n\nVoluptas nemo modi sit autem voluptatem temporibus velit culpa. Explicabo aut dolorum est. Sit voluptatem sed doloremque sint molestias vel tempora.\n\nReprehenderit dolores ut nesciunt aut enim. Quae a voluptate est molestiae. Sunt ut eos et voluptate porro. Exercitationem aliquid amet ab illum commodi distinctio.\n\nAut ipsam ipsum eum molestias cum eum atque. Quo cum possimus repellendus sunt quibusdam rerum. Aut aliquid ut explicabo aliquam dolores quidem dolor.\n\nDolore quia nobis eaque ut occaecati ipsam. Sunt ipsum ipsum iure repellendus quasi quis. Quas et esse iste officiis error aut. Corporis autem doloribus consequatur voluptatum laborum iure reiciendis.\n\nIste repudiandae sit exercitationem nesciunt aut omnis. Mollitia quo et dolorem corporis dignissimos odit nostrum. Omnis quo aut delectus omnis labore. Minima velit ut autem blanditiis.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:36', '2016-07-06 09:02:36', '2016-06-30 23:43:12', 'published');
INSERT INTO `posts` VALUES ('18', 'assumenda-facere-aspernatur-qui-maxime-recusandae-numquam-maiores-exercitationem-et-nemo-voluptates-quos-laborum', 'Assumenda facere aspernatur qui maxime recusandae numquam maiores exercitationem et nemo voluptates quos laborum.', '', 'Saepe culpa rerum ut ipsam. Quisquam occaecati voluptate non ut qui aliquam reprehenderit. Laudantium enim sed rerum facere id voluptatum. Quia earum perspiciatis necessitatibus maiores.\n\nAliquid illo pariatur et esse expedita quibusdam aperiam fugiat. Eveniet error sed nostrum distinctio officiis modi repudiandae. Fugit eius iure vel totam sint voluptate. Perspiciatis fuga aspernatur veritatis distinctio ipsa quasi dolor.\n\nDolorem quas quo in exercitationem sunt assumenda quia. Expedita tenetur aut atque non a et unde. Aliquam dicta beatae tenetur delectus aut et iusto.\n\nDucimus quo repellat possimus doloribus quibusdam non culpa. Quam eaque non laborum natus veritatis id sit. Quis amet occaecati est sed qui.\n\nFugiat voluptas quia cum ut rerum. Eligendi sint commodi ex optio ut voluptas. Necessitatibus occaecati dolore vel et asperiores distinctio voluptas.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:36', '2016-07-06 09:02:36', '2016-06-18 10:17:14', 'published');
INSERT INTO `posts` VALUES ('19', 'dolor-magni-facilis-temporibus-qui-quis-quia-necessitatibus', 'Dolor magni facilis temporibus qui quis quia necessitatibus.', '', 'Corrupti alias quidem vitae eaque ipsum ipsum quia. Molestiae est nesciunt tempore qui vel et harum. Fugit velit unde voluptates et numquam. Voluptatum aut iusto reiciendis dolores.\n\nAnimi assumenda sit at autem magnam consequuntur sit. Et et dolorem quasi amet. Eos ab autem rerum earum voluptas facilis quaerat. Ut similique et eius mollitia accusamus.\n\nNeque quam facere asperiores commodi. Quidem optio impedit aut perspiciatis dolorem aut.\n\nUnde illo aliquid dolores minima rerum. Saepe distinctio molestiae neque beatae voluptates asperiores.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:36', '2016-07-06 09:02:36', '2016-06-26 16:17:03', 'published');
INSERT INTO `posts` VALUES ('20', 'neque-et-aliquam-sed-doloremque-fugiat', 'Neque et aliquam sed doloremque fugiat.', '', 'Et est quas et sed quae necessitatibus in. Voluptas sint corporis ut beatae libero aut. Fugiat eveniet illo corporis qui nobis maiores aut. Sapiente qui velit consectetur aliquam quis animi facilis.\n\nAsperiores explicabo dolores et impedit molestiae at quas. Ullam veniam et sed voluptas eum consequatur. Asperiores non et ad sed.\n\nVoluptatem ratione perspiciatis libero nostrum. Amet ab hic hic dignissimos et. Et omnis delectus quis libero voluptatem unde. Rerum aspernatur sint animi voluptatem dolorem.\n\nQuod est impedit ea. Molestias sunt provident quas voluptatibus. Illo doloribus veritatis molestias repudiandae corrupti laboriosam consequatur.\n\nExplicabo qui ea quam praesentium ea. Quis qui beatae voluptates laudantium maiores temporibus sed. Sapiente pariatur ea tempora necessitatibus cum. Illum cupiditate maiores voluptatem alias a laborum. Officia quis magnam voluptatem explicabo ex magni quod.\n\nSint sed beatae cumque aut commodi nihil. Ab voluptate qui voluptatibus est consectetur dolore. Ipsum beatae qui quis velit ducimus debitis. Voluptas quaerat aperiam et repudiandae maiores ullam ratione.', '', '', '', '0', 'blog.layouts.post', '2016-07-06 09:02:36', '2016-07-06 09:02:36', '2016-06-12 23:23:32', 'published');

-- ----------------------------
-- Table structure for `post_tag_pivot`
-- ----------------------------
DROP TABLE IF EXISTS `post_tag_pivot`;
CREATE TABLE `post_tag_pivot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_pivot_post_id_index` (`post_id`),
  KEY `post_tag_pivot_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post_tag_pivot
-- ----------------------------

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'blog.layouts.index',
  `reverse_direction` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_tag_unique` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '297208251@qq.com', '$2y$10$Jfwi4x4d98MO5SJbZovt7u9z1ZM7tBHQRHvKwSNSAmNqa9aeDbHn.', 'ibT6G1c4hbdtawbL1Ss5LUWkLgHlvpKXw8RB48Pzqm0TPU9j6nSTwznmwsmo', '2016-07-07 09:40:20', '2016-07-29 11:03:31');
