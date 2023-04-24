-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2023 at 03:57 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-ojs`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_keys`
--

CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_settings`
--

CREATE TABLE `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_types`
--

CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_type_settings`
--

CREATE TABLE `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint(6) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `user_group_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `author_settings`
--

CREATE TABLE `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_sources`
--

CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` smallint(6) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category_settings`
--

CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `citations`
--

CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL,
  `publication_id` bigint(20) NOT NULL DEFAULT 0,
  `raw_citation` text NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `citation_settings`
--

CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `completed_payments`
--

CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocabs`
--

CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `controlled_vocabs`
--

INSERT INTO `controlled_vocabs` (`controlled_vocab_id`, `symbolic`, `assoc_type`, `assoc_id`) VALUES
(1, 'interest', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocab_entries`
--

CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocab_entry_settings`
--

CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_issue_orders`
--

CREATE TABLE `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_section_orders`
--

CREATE TABLE `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstones`
--

CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstone_settings`
--

CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `edit_decisions`
--

CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` smallint(6) NOT NULL,
  `date_decided` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `cc_recipients` text DEFAULT NULL,
  `bcc_recipients` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_log_users`
--

CREATE TABLE `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_default`
--

CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `can_disable` smallint(6) NOT NULL DEFAULT 0,
  `can_edit` smallint(6) NOT NULL DEFAULT 0,
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates_default`
--

INSERT INTO `email_templates_default` (`email_id`, `email_key`, `can_disable`, `can_edit`, `from_role_id`, `to_role_id`, `stage_id`) VALUES
(1, 'NOTIFICATION', 0, 1, NULL, NULL, NULL),
(2, 'NOTIFICATION_CENTER_DEFAULT', 0, 1, NULL, NULL, NULL),
(3, 'PASSWORD_RESET_CONFIRM', 0, 1, NULL, NULL, NULL),
(4, 'USER_REGISTER', 0, 1, NULL, NULL, NULL),
(5, 'USER_VALIDATE', 0, 1, NULL, NULL, NULL),
(6, 'REVIEWER_REGISTER', 0, 1, NULL, NULL, NULL),
(7, 'PUBLISH_NOTIFY', 0, 1, NULL, NULL, NULL),
(8, 'LOCKSS_EXISTING_ARCHIVE', 0, 1, NULL, NULL, NULL),
(9, 'LOCKSS_NEW_ARCHIVE', 0, 1, NULL, NULL, NULL),
(10, 'SUBMISSION_ACK', 1, 1, NULL, 65536, 1),
(11, 'SUBMISSION_ACK_NOT_USER', 1, 1, NULL, 65536, 1),
(12, 'EDITOR_ASSIGN', 1, 1, 16, 16, 1),
(13, 'REVIEW_CANCEL', 1, 1, 16, 4096, 3),
(14, 'REVIEW_REINSTATE', 1, 1, 16, 4096, 3),
(15, 'REVIEW_REQUEST', 1, 1, 16, 4096, 3),
(16, 'REVIEW_REQUEST_SUBSEQUENT', 1, 1, 16, 4096, 3),
(17, 'REVIEW_REQUEST_ONECLICK', 1, 1, 16, 4096, 3),
(18, 'REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 1, 1, 16, 4096, 3),
(19, 'REVIEW_REQUEST_ATTACHED', 0, 1, 16, 4096, 3),
(20, 'REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 0, 1, 16, 4096, 3),
(21, 'REVIEW_REQUEST_REMIND_AUTO', 0, 1, NULL, 4096, 3),
(22, 'REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096, 3),
(23, 'REVIEW_CONFIRM', 1, 1, 4096, 16, 3),
(24, 'REVIEW_DECLINE', 1, 1, 4096, 16, 3),
(25, 'REVIEW_ACK', 1, 1, 16, 4096, 3),
(26, 'REVIEW_REMIND', 0, 1, 16, 4096, 3),
(27, 'REVIEW_REMIND_AUTO', 0, 1, NULL, 4096, 3),
(28, 'REVIEW_REMIND_ONECLICK', 0, 1, 16, 4096, 3),
(29, 'REVIEW_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096, 3),
(30, 'EDITOR_DECISION_ACCEPT', 0, 1, 16, 65536, 3),
(31, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 0, 1, 16, 65536, 3),
(32, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 0, 1, 16, 65536, 5),
(33, 'EDITOR_DECISION_REVISIONS', 0, 1, 16, 65536, 3),
(34, 'EDITOR_DECISION_RESUBMIT', 0, 1, 16, 65536, 3),
(35, 'EDITOR_DECISION_DECLINE', 0, 1, 16, 65536, 3),
(36, 'EDITOR_DECISION_INITIAL_DECLINE', 0, 1, 16, 65536, 1),
(37, 'EDITOR_RECOMMENDATION', 0, 1, 16, 16, 3),
(38, 'COPYEDIT_REQUEST', 1, 1, 16, 4097, 4),
(39, 'LAYOUT_REQUEST', 1, 1, 16, 4097, 5),
(40, 'LAYOUT_COMPLETE', 1, 1, 4097, 16, 5),
(41, 'EMAIL_LINK', 0, 1, 1048576, NULL, NULL),
(42, 'SUBSCRIPTION_NOTIFY', 0, 1, NULL, 1048576, NULL),
(43, 'OPEN_ACCESS_NOTIFY', 0, 1, NULL, 1048576, NULL),
(44, 'SUBSCRIPTION_BEFORE_EXPIRY', 0, 1, NULL, 1048576, NULL),
(45, 'SUBSCRIPTION_AFTER_EXPIRY', 0, 1, NULL, 1048576, NULL),
(46, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 0, 1, NULL, 1048576, NULL),
(47, 'SUBSCRIPTION_PURCHASE_INDL', 0, 1, NULL, 2097152, NULL),
(48, 'SUBSCRIPTION_PURCHASE_INSTL', 0, 1, NULL, 2097152, NULL),
(49, 'SUBSCRIPTION_RENEW_INDL', 0, 1, NULL, 2097152, NULL),
(50, 'SUBSCRIPTION_RENEW_INSTL', 0, 1, NULL, 2097152, NULL),
(51, 'CITATION_EDITOR_AUTHOR_QUERY', 0, 1, NULL, NULL, 4),
(52, 'REVISED_VERSION_NOTIFY', 0, 1, NULL, 16, 3),
(53, 'STATISTICS_REPORT_NOTIFICATION', 1, 1, 16, 17, NULL),
(54, 'ANNOUNCEMENT', 0, 1, 16, 1048576, NULL),
(55, 'ORCID_COLLECT_AUTHOR_ID', 0, 1, NULL, NULL, NULL),
(56, 'ORCID_REQUEST_AUTHOR_AUTHORIZATION', 0, 1, NULL, NULL, NULL),
(57, 'MANUAL_PAYMENT_NOTIFICATION', 0, 1, NULL, NULL, NULL),
(58, 'PAYPAL_INVESTIGATE_PAYMENT', 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_default_data`
--

CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates_default_data`
--

INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('ANNOUNCEMENT', 'en_US', '{$title}', '<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.', 'This email is sent when a new announcement is created.'),
('ANNOUNCEMENT', 'id_ID', '{$title}', '<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nKunjungi website kami untuk melihat <a href=\"{$url}\">pengumuman selengkapnya</a>.', 'Surel ini dikirim ketika terdapat pengumuman baru.'),
('CITATION_EDITOR_AUTHOR_QUERY', 'en_US', 'Citation Editing', '{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n', 'This email allows copyeditors to request additional information about references from authors.'),
('CITATION_EDITOR_AUTHOR_QUERY', 'id_ID', 'Penyuntingan Sitiran', '{$authorFirstName},<br />\n<br />\nMohon verifikasi atau berikan sitasi yang benar untuk rujukan berikut dari artikel Anda, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nTerimakasih!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n', 'Email ini memungkinkan copyeditor untuk meminta informasi tambahan tentang rujukan dari penulis.'),
('COPYEDIT_REQUEST', 'en_US', 'Copyediting Request', '{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}', 'This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),
('COPYEDIT_REQUEST', 'id_ID', 'Permohonan Copyediting', '{$participantName}:<br />\n<br />\nKami meminta Anda melakukan copyediting terhadap &quot;{$submissionTitle}&quot; untuk {$contextName} mengikuti langkah-langkah berikut.<br />\n1. Klik URL Naskah di bawah.<br />\n2. Buka semua file yang ada di file Draft dan lakukan copyediting, tambahkan Diskusi Copyediting sesuai kebutuhan.<br />\n3. Simpan file yang telah di-copyedit, dan unggah ke panel Sudah Copyedit.<br />\n4. Beritahu Editor bahwa semua file telah siap, dan bahwa proses Produksi dapat dimulai.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL Naskah: {$submissionUrl}<br />\nNama pengguna: {$participantUsername}', 'Email ini dari Editor Bagian ke Copyeditor naskah agar memulai proses copyediting.  Email ini memuat informasi terkait penyerahan naskah dan bagaimana mengaksesnya.'),
('EDITOR_ASSIGN', 'en_US', 'Editorial Assignment', '{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.', 'This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),
('EDITOR_ASSIGN', 'id_ID', 'Penugasan Editorial', '{$editorialContactName}:<br />\n<br />\nNaskah, &quot;{$submissionTitle},&quot; di {$contextName} telah ditugaskan kepada Anda sebagai Editor Bagian untuk memastikan selesainya seluruh proses editorial.<br />\n<br />\nURL Naskah: {$submissionUrl}<br />\nNama pengguna: {$editorUsername}<br />\n<br />\nTerimakasih.', 'Email ini memberitahu Editor Bagian bahwa Editor telah memberikan tugas untuk mengawasi suatu naskah dalam menyelesaikan proses editorial. Email ini memberikan informasi mengenai naskah dan cara mengaksesnya di website jurnal.'),
('EDITOR_DECISION_ACCEPT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission', 'This email from the Editor or Section Editor to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),
('EDITOR_DECISION_ACCEPT', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Naskah Diterima', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan keputusan final \"Naskah Diterima\".'),
('EDITOR_DECISION_DECLINE', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission', 'This email from the Editor or Section Editor to an Author notifies them of a final \"decline\" decision regarding their submission.'),
('EDITOR_DECISION_DECLINE', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Naskah Ditolak', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan keputusan final \"Naskah Ditolak\".'),
('EDITOR_DECISION_INITIAL_DECLINE', 'en_US', 'Editor Decision', '\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission', 'This email is sent to the author if the editor declines their submission initially, before the review stage'),
('EDITOR_DECISION_INITIAL_DECLINE', 'id_ID', 'Keputusan Penyunting', '\n			{$authorName}:<br />\n<br />\nKami telah sampai pada keputusan mengenai naskah Anda {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusannya adalah: Menolak Naskah', 'Email ini dikirim kepada penulis jika naskah mereka ditolak oleh editor lebih awal, sebelum masuk ke tahap review'),
('EDITOR_DECISION_RESUBMIT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review', 'This email from the Editor or Section Editor to an Author notifies them of a final \"resubmit\" decision regarding their submission.'),
('EDITOR_DECISION_RESUBMIT', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Kirim Ulang untuk Review', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan bahwa Penulis perlu mengirim ulang naskahnya.'),
('EDITOR_DECISION_REVISIONS', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required', 'This email from the Editor or Section Editor to an Author notifies them of a final \"revisions required\" decision regarding their submission.'),
('EDITOR_DECISION_REVISIONS', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Perlu Revisi', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan keputusan final \"Perlu Revisi\".'),
('EDITOR_DECISION_SEND_TO_EXTERNAL', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}', 'This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.'),
('EDITOR_DECISION_SEND_TO_EXTERNAL', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nKami telah membuat keputusan terkait naskah yang Anda kirimkan ke {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nKeputusan kami adalah: Dikirimkan ke Reviewer Eksternal<br />\n<br />\nURL Naskah: {$submissionUrl}', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan bahwa naskah dikirimkan ke reviewer eksternal.'),
('EDITOR_DECISION_SEND_TO_PRODUCTION', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}', 'This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.'),
('EDITOR_DECISION_SEND_TO_PRODUCTION', 'id_ID', 'Keputusan Editor', '{$authorName}:<br />\n<br />\nProses editing naskah Anda, &quot;{$submissionTitle},&quot; telah selesai.  Kami sekarang mengirimkannya ke produksi.<br />\n<br />\nURL Naskah: {$submissionUrl}', 'Email ini dari Editor atau Editor Bagian kepada Penulis memberitahukan bahwa naskah dikirim ke produksi.'),
('EDITOR_RECOMMENDATION', 'en_US', 'Editor Recommendation', '{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}', 'This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),
('EDITOR_RECOMMENDATION', 'id_ID', 'Rekomendasi Penyunting', '{$editors}:<br />\n<br />\nRekomendasi berkaitan dengan  naskah {$contextName}, &quot;{$submissionTitle}&quot; adalah: {$recommendation}', 'Email ini berasal dari Editor atau Editor Bagian kepada Editor pengambilan keputusan atau Editor Bagian memberi tahu mereka tentang rekomendasi akhir mengenai naskah tersebut.'),
('EMAIL_LINK', 'en_US', 'Article of Possible Interest', 'Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.', 'This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),
('EMAIL_LINK', 'id_ID', 'Artikel Menarik', 'Anda mungkin tertarik dengan &quot;{$submissionTitle}&quot; oleh {$authorName} diterbitkan di Vol {$volume}, No {$number} ({$year}) {$contextName} yang tersedia di &quot;{$articleUrl}&quot;.', 'Template email ini memungkinkan pembaca terdaftar mengirimkan informasi tentang suatu artikel kepada seseorang yang mungkin akan tertarik. Email ini tersedia di Alat Baca dan harus diaktifkan oleh Manajer Jurnal di halaman Administrasi Alat Baca.'),
('LAYOUT_COMPLETE', 'en_US', 'Galleys Complete', '{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}', 'This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),
('LAYOUT_COMPLETE', 'id_ID', 'Galley Selesai', '{$editorialContactName}:<br />\n<br />\nGalley telah dipersiapkan bagi naskah, &quot;{$submissionTitle},&quot; di {$contextName} dan siap untuk proofreading.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$participantName}', 'Email from the Layout Editor kepada Editor Bagian memberitahukan bahwa proses layout telah selesai.'),
('LAYOUT_REQUEST', 'en_US', 'Request Galleys', '{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal\'s standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.', 'This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),
('LAYOUT_REQUEST', 'id_ID', 'Permohonan Galley', '{$participantName}:<br />\n<br />\nNaskah &quot;{$submissionTitle}&quot; di {$contextName} memerlukan pembuatan galley dengan mengikuti langkah-langkah berikut.<br />\n1. Klik URL Naskah di bawah.<br />\n2. Login ke jurnal dan gunakan file Siap Produksi untuk membuat galley sesuai standar jurnal.<br />\n3. Unggah galley ke bagian File Galley.<br />\n4. Beritahu Editor menggunakan Diskusi Produksi bahwa galley telah diunggah dan siap digunakan.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL Naskah: {$submissionUrl}<br />\nNama pengguna: {$participantUsername}<br />\n<br />\nJika Anda tidak dapat melakukan tugas ini saat ini atau mempunyai pertanyaan, silakan hubungi kami.  Terimakasih atas kontribusi Anda ke jurnal ini.', 'Email dari Editor Bagian kepada Layout Editor memberitahukan bahwa mereka telah ditugaskan untuk melakukan layout editing terhadap suatu naskah.  Email ini memuat informasi terkait penyerahan naskah dan bagaimana mengaksesnya.'),
('LOCKSS_EXISTING_ARCHIVE', 'en_US', 'Archiving Request for {$contextName}', 'Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),
('LOCKSS_EXISTING_ARCHIVE', 'id_ID', 'Permohonan Pengarsipan untuk {$contextName}', 'Yang terhormat [Pustakawan Universitas]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, merupakan jurnal yang salah satu anggota fakultas Anda, [name of member], menjadi [title of position]. Jurnal ini hendak membuat arsip sesuai LOCKSS (Lots of Copies Keep Stuff Safe) di perpustakaan Anda dan perpustakaan universitas lainnya.<br />\n<br />\n[Deskripsi singkat jurnal]<br />\n<br />\nURL Publisher Manifest LOCKSS jurnal kami adalah: {$contextUrl}/gateway/lockss<br />\n<br />\nKami memahami bahwa Anda telah bergabung dengan LOCKSS. Jika kami perlu memberikan metadata tambahan untuk mendaftarkan jurnal kami di versi LOCKSS Anda, dengan senang hati kami akan memberikannya.<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}', 'Email ini meminta penjaga arsip LOCKSS untuk mempertimbangkan memasukkan jurnal ini ke dalam arsip mereka. Email ini memberikan URL Publisher Manifest LOCKSS jurnal.'),
('LOCKSS_NEW_ARCHIVE', 'en_US', 'Archiving Request for {$contextName}', 'Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),
('LOCKSS_NEW_ARCHIVE', 'id_ID', 'Permohonan Pengarsipan untuk {$contextName}', 'Yang terhormat [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, merupakan jurnal yang salah satu anggota fakultas Anda, [name of member], menjadi [title of position]. Jurnal ini hendak membuat arsip sesuai LOCKSS (Lots of Copies Keep Stuff Safe) di perpustakaan Anda dan perpustakaan universitas lainnya.<br />\n<br />\n[Deskripsi singkat jurnal]<br />\n<br />\nProgram LOCKSS &amp;lt;http://lockss.org/&amp;gt;, suatu gerakan perpustakaan/penerbit internasional, merupakan contoh nyata penyimpanan dan pengarsipan terdistribusi, detail tambahan dapat dilihat di bawah. Piranti lunak ini, yang berjalan di komputer biasa, merupakan piranti lunak yang gratis; sistemnya mudah di-online-kan; tidak membutuhkan banyak perawatan.<br />\n<br />\nUntuk membantu mengarsipkan jurnal kami, kami mengundang Anda untuk menjadi anggota komunitas LOCKSS, guna membantu mengumpulkan dan menyimpan judul-judul karya anggota fakultas Anda dan ilmuwan lainnya di seluruh dunia. Jika berkenan, silakan mengunjungi website LOCKSS untuk informasi mengenai bagaimana cara kerja sistem ini. Kami berharap Anda berkenan mendukung pengarsipan jurnal ini.<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}', 'Email ini mendorong penerima untuk berpartisipasi di gerakan LOCKSS dan memasukkan jurnal ini dalam arsip. Email ini memberikan informasi tentang gerakan LOCKSS dan cara untuk bergabung.'),
('MANUAL_PAYMENT_NOTIFICATION', 'en_US', 'Manual Payment Notification', 'A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.', 'This email template is used to notify a journal manager contact that a manual payment was requested.'),
('MANUAL_PAYMENT_NOTIFICATION', 'id_ID', 'Pemberitahuan Pembayaran Manual', 'Pembayaran manual harus diproses untuk jurnal {$contextName} dan pengguna {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nItem yang akan dibayar adalah &quot;{$itemName}&quot;.<br />\nBiayanya {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nSurat elektronik ini dibuat oleh plugin Pembayaran Manual OJS.', 'Email ini digunakan untuk memberitahukan kontak manajer jurnal bahwa pembayaran manual dibutuhkan.'),
('NOTIFICATION', 'en_US', 'New notification from {$siteTitle}', 'You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}', 'The email is sent to registered users that have selected to have this type of notification emailed to them.'),
('NOTIFICATION', 'id_ID', 'Notifikasi baru dari {$siteTitle}', 'Anda memperoleh satu notifikasi baru dari {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nTautan: {$url}<br />\n<br />\n{$principalContactSignature}', 'Email ini dikirimkan ke pengguna terdaftar yang memilih untuk memperoleh jenis notifikasi ini dikirimkan melalui email.'),
('NOTIFICATION_CENTER_DEFAULT', 'en_US', 'A message regarding {$contextName}', 'Please enter your message.', 'The default (blank) message used in the Notification Center Message Listbuilder.'),
('NOTIFICATION_CENTER_DEFAULT', 'id_ID', 'Pesan terkait {$contextName}', 'Silakan tuliskan pesan Anda.', 'Pesan default (kosong) yang digunakan di Pengelola Pesan Pusat Notifikasi.'),
('OPEN_ACCESS_NOTIFY', 'en_US', 'Issue Now Open Access', 'Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}', 'This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),
('OPEN_ACCESS_NOTIFY', 'id_ID', 'Terbitan Sudah Open Access', 'Readers:<br />\n<br />\n{$contextName} telah menjadikan terbitan berikut Open Access. Kami mengundang Anda untuk menelaah Daftar Isi berikut dan mengunjungi website kami ({$contextUrl}) untuk membaca artikel dan item yang Anda minati.<br />\n<br />\nTerimakasih atas perhatiannya,<br />\n{$editorialContactSignature}', 'Email ini dikirimkan ke pembaca terdaftar yang meminta untuk dikirimkan email pemberitahuan saat suatu terbitan menjadi Open Access.'),
('ORCID_COLLECT_AUTHOR_ID', 'en_US', 'Submission ORCID', 'Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n', 'This email template is used to collect the ORCID id\'s from authors.'),
('ORCID_COLLECT_AUTHOR_ID', 'id_ID', 'ORCID Naskah', 'Yang Kami Hormati {$authorName},<br/>\n<br/>\nAnda telah terdaftar sebagai penulis naskah{$contextName}.<br/>\nUntuk mengonfirmasi kepenulisan tersebut, tambahkanlah id ORCID Anda pada naskah tersebut dengan membuka tautan berikut ini.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register atau hubungkan iD ORCID Anda</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">Informasi selengkapnya tentang ORCID pada {$contextName}</a><br/>\n<br/>\nBila ada pertanyaan, silakan hubungi kami.<br/>\n<br/>\n{$principalContactSignature}<br/>\n', 'Template surel ini digunakan untuk mengumpulkan id ORCID penulis.'),
('ORCID_REQUEST_AUTHOR_AUTHORIZATION', 'en_US', 'Requesting ORCID record access', 'Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n', 'This email template is used to request ORCID record access from authors.'),
('ORCID_REQUEST_AUTHOR_AUTHORIZATION', 'id_ID', 'Meminta akses rekaman ORCID', 'Yang Kami Hormati {$authorName},<br>\n<br>\nAnda telah terdaftar sebagai penulis naskah \"{$submissionTitle}\" pada {$contextName}.\n<br>\n<br>\nIjinkanlah kami menambahkan id ORCID Anda pada naskah ini serta menambahkan naskah pada profil ORCID Anda pada terbitan.<br>\nBuka tautan web ORCID, login dan beri akses sesuai petunjuk berikut.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register atau hubungkan iD ORCID Anda</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">nformasi selengkapnya tentang ORCID pada {$contextName}</a><br/>\n<br>\nBila ada pertanyaan, silakan hubungi kami.<br>\n<br>\n{$principalContactSignature}<br/>\n', 'Template surel ini digunakan untuk meminta akses rekaman ORCID penulis.'),
('PASSWORD_RESET_CONFIRM', 'en_US', 'Password Reset Confirmation', 'We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}', 'This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),
('PASSWORD_RESET_CONFIRM', 'id_ID', 'Konfirmasi Reset Sandi', 'Kami menerima permintaan reset sandi untuk akun Anda di website {$siteTitle}.<br />\n<br />\nJika Anda tidak merasa mengajukan permintaan ini, abaikan pesan ini dan sandi Anda tidak akan diubah.  Jika Anda memang ingin melakukan reset sandi, klik tautan berikut ini.<br />\n<br />\nReset sandi saya: {$url}<br />\n<br />\n{$principalContactSignature}', 'Email ini dikirimkan ke pengguna terdaftar ketika lupa sandi atau tidak dapat login. Email ini memberikan URL untuk melakukan reset sandi.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'en_US', 'Unusual PayPal Activity', 'Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems\' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n', 'This email template is used to notify a journal\'s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'id_ID', 'Kegiatan pembayaran paypal yang tidak biasa', 'Open Journal System telah menemukan kegiatan yang tidak biasa yang terkait dengan bantuan pembayaran paypal untuk jurnal {$contextName}. Kegiatan ini mungkin memerlukan investigasi lebih lanjut atau intervensi manual.<br />\n                       <br />\nSurel ini dibuat oleh plugin PayPal pada OJS.<br />\n<br />\nInformasi posting penuh untuk permohonan:<br />\n{$postInfo}<br />\n<br />\nInformasi tambahan (jika tersedia):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n', 'Email ini digunakan untuk memberitahukan narahubung utama jurnal bahwa plugin PayPal menemukan kegiatan mencurigakan atau kegiatan yang membutuhkan intervensi manual.'),
('PUBLISH_NOTIFY', 'en_US', 'New Issue Published', 'Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}', 'This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),
('PUBLISH_NOTIFY', 'id_ID', 'Terbitan Baru', 'Readers:<br />\n<br />\n{$contextName} baru saja menerbitkan terbitan terbarunya di {$contextUrl}. Kami mengundang Anda untuk membaca Daftar Isi dan selanjutnya mengunjungi website kami untuk membaca artikel yang Anda minati.<br />\n<br />\nTerimakasih atas perhatian Anda,<br />\n{$editorialContactSignature}', 'Email ini dikirimkan ke pembaca terdaftar melalui tautan \"Beritahu Pengguna\" di Beranda Pengguna Editor. Email ini memberitahu pembaca tentang terbitan baru dan mengundang pembaca untuk mengunjungi jurnal melalui URL yang diberikan.'),
('REVIEWER_REGISTER', 'en_US', 'Registration as Reviewer with {$contextName}', 'In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),
('REVIEWER_REGISTER', 'id_ID', 'Registrasi sebagai Reviewer di {$contextName}', 'Dengan mempertimbangkan keahlian Anda, kami memasukkan nama Anda dalam database reviewer di {$contextName}. Hal ini tidak bersifat mengikat, hanya sekedar memudahkan kami untuk mengundang Anda untuk melakukan review terhadap suatu naskah. Ketika memperoleh undangan untuk melakukan review suatu naskah, Anda dapat melihat judul dan abstrak naskah tersebut, dan Anda berhak menentukan apakah akan menerima atau menolak undangan tersebut. Anda juga dapat meminta dihapus dari daftar reviewer kapan saja Anda menghendaki.<br />\n<br />\nKami menyertakan nama pengguna dan sandi Anda, yang digunakan dalam semua interaksi dengan jurnal melalui website. Anda dapat melakukan update profil, termasuk minat review Anda.<br />\n<br />\nNama pengguna: {$username}<br />\nSandi: {$password}<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}', 'Email ini dikirimkan ke reviewer baru untuk menyambut dan memberikan informasi nama pengguna dan sandi.'),
('REVIEW_ACK', 'en_US', 'Article Review Acknowledgement', '{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.', 'This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),
('REVIEW_ACK', 'id_ID', 'Ucapan Terimakasih atas Review Artikel', '{$reviewerName}:<br />\n<br />\nTerimakasih telah menyelesaikan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami sangat menghargai kontribusi Anda terhadap kualitas karya yang kami publikasikan.', 'Email ini dikirimkan Editor Bagian untuk mengkonfirmasi penerimaan review dan mengucapkan terimakasih atas kontribusinya.'),
('REVIEW_CANCEL', 'en_US', 'Request for Review Cancelled', '{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.', 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),
('REVIEW_CANCEL', 'id_ID', 'Permohonan Review Dibatalkan', '{$reviewerName}:<br />\n<br />\nKami memutuskan untuk membatalkan permohonan review kami kepada Anda untuk naskah, &quot;{$submissionTitle},&quot; di {$contextName}. Kami mohon maaf sebesar-besarnya untuk ketidaknyamanan ini dan kami harap di masa mendatang Anda dapat membantu proses review di jurnal ini.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.', 'Email ini dikirimkan Editor Bagian kepada Reviewer yang sedang melakukan review untuk memberitahukan pembatalan review.'),
('REVIEW_CONFIRM', 'en_US', 'Able to Review', 'Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),
('REVIEW_CONFIRM', 'id_ID', 'Dapat Melakukan Review', 'Editor:<br />\n<br />\nSaya dapat dan bersedia melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Terimakasih telah mempercayakan kepada saya, dan saya berencana untuk menyelesaikan review ini sesuai tenggat, {$reviewDueDate}, atau sebelumnya.<br />\n<br />\n{$reviewerName}', 'Email ini dikirimkan Reviewer kepada Editor Bagian sebagai respon terhadap permohonan review untuk memberitahu Editor Bagian bahwa permohonan review diterima dan akan diselesaikan pada tanggal yang ditetapkan.'),
('REVIEW_DECLINE', 'en_US', 'Unable to Review', 'Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),
('REVIEW_DECLINE', 'id_ID', 'Tidak Dapat Melakukan Review', 'Editor:<br />\n<br />\nMohon maaf saat ini saya tidak dapat melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Terimakasih telah mempercayakann kepada saya, dan lain waktu silakan menghubungi saya lagi.<br />\n<br />\n{$reviewerName}', 'Email ini dikirimkan Reviewer kepada Editor Bagian sebagai respon terhadap permohonan review untuk memberitahu Editor Bagian bahwa permohonan review ditolak.'),
('REVIEW_REINSTATE', 'en_US', 'Request for Review Reinstated', '{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.', 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that a cancelled review has been reinstated.'),
('REVIEW_REINSTATE', 'id_ID', 'Meminta Pemulihan Review', '{$reviewerName}:<br />\n<br />\nKami ingin memulihkan permintaan kami kepada Anda untuk mereview naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami berharap Anda dapat membantu proses review jurnal kami.<br />\n<br />\nJika ada pertanyaan, silakan hubungi saya.', 'Email ini dikirim oleh Editor Bagian kepada Mitra Bestari yang sedang mereview naskah untuk memberi tahu bahwa ulasan mereka yang dibatalkan telah dipulihkan.'),
('REVIEW_REMIND', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND', 'id_ID', 'Pengingat Review Naskah', '{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami mengharapkan telah menerima review ini pada {$reviewDueDate}, dan akan sangat berbahagia untuk dapat menerimanya segera setelah Anda menyelesaikannya.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirimkan Editor Bagian untuk mengingatkan reviewer bahwa review telah mencapai tenggat.'),
('REVIEW_REMIND_AUTO', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO', 'id_ID', 'Pengingat Otomatis Review Naskah', '{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami mengharapkan telah menerima review ini pada {$reviewDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut. Kami masih tetap menanti review tersebut segera setelah Anda dapat menyelesaikannya.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirimkan otomatis saat tenggat waktu review terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO_ONECLICK', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO_ONECLICK', 'id_ID', 'Pengingat Review Naskah Otomatis', '{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. We were hoping to have this review by {$reviewDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirimkan otomatis saat tenggat waktu review terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) dan akses one-click reviewer diaktifkan. Tugas terjadwal harus diaktifkan dan diatur (lihat file konfigurasi website).'),
('REVIEW_REMIND_ONECLICK', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND_ONECLICK', 'id_ID', 'Pengingat Review Naskah', '{$reviewerName}:<br />\n<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami mengharapkan telah menerima review ini pada {$reviewDueDate}, dan akan sangat berbahagia untuk dapat menerimanya segera setelah Anda menyelesaikannya.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nMohon konfirmasi kesanggupan Anda untuk menyelesaikan kontribusi penting ini.  Kami menunggu balasan Anda.<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirimkan Editor Bagian untuk mengingatkan reviewer bahwa review telah mencapai tenggat.'),
('REVIEW_REQUEST', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah, &quot;{$submissionTitle},&quot; yang diserahkan ke {$contextName}. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat di REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST_ATTACHED', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)');
INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('REVIEW_REQUEST_ATTACHED', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah, &quot;{$submissionTitle},&quot; dan kami mengharapkan Anda berkenan melakukan review. Panduan Review untuk jurnal ini disertakan di bawah, dan naskah telah dilampirkan bersama email ini. Review beserta rekomendasi Anda, kami harap telah diemailkan sebelum tenggat review {$reviewDueDate}.<br />\n<br />\nMohon sampaikan dalam email balasan sebelum {$responseDueDate} tentang kesediaan Anda untuk melakukan review.<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nPanduan Review<br />\n<br />\n{$reviewGuidelines}<br />\n', 'Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review. Email disertai naskah terlampir bersama email. Pesan ini digunakan saat Proses Review Lampiran Email dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat REVIEW_REQUEST.)'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nEmail ini terkait naskah &quot;{$submissionTitle},&quot; yang sedang dalam pertimbangan di {$contextName}.<br />\n<br />\nSetelah review untuk versi naskah sebelumnya, penulis saat ini telah menyerahkan versi revisi naskahnya.  Kami berharap Anda dapat membantu mengevaluasinya.<br />\n<br />\nPanduan Review untuk jurnal ini disertakan di bawah, dan naskah dilampirkan bersama email ini. Review dan rekomendasi Anda, mohon dapat diemailkan ke kami pada {$reviewDueDate}.<br />\n<br />\nMohon sampaikan di email balasan sebelum {$responseDueDate} tentang kesediaan Anda untuk melakukan review.<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nPanduan Review<br />\n<br />\n{$reviewGuidelines}<br />\n', 'Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review untuk ronde kedua atau berikutnya.  Email disertai naskah terlampir bersama email. Pesan ini digunakan saat Proses Review Lampiran Email dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat REVIEW_REQUEST_SUBSEQUENT.)'),
('REVIEW_REQUEST_ONECLICK', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_ONECLICK', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah, &quot;{$submissionTitle},&quot; yang diserahkan ke {$contextName}. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dari Editor Bagian kepada Reviewer  untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review, dan akses one-click reviewer diaktifkan.'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nEmail ini terkait naskah &quot;{$submissionTitle},&quot; yang sedang dalam pertimbangan di {$contextName}.<br />\n<br />\nSetelah review untuk versi naskah sebelumnya, penulis saat ini telah menyerahkan versi revisi naskahnya.  Kami berharap Anda dapat membantu mengevaluasinya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda.<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review untuk ronde kedua atau berikutnya. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review, dan akses one-click reviewer diaktifkan.'),
('REVIEW_REQUEST_REMIND_AUTO', 'en_US', 'Article Review Request Reminder', '{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_REMIND_AUTO', 'id_ID', 'Pengingat Permintaan Review Artikel', '{$reviewerName}:<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami berharap telah menerima respon Anda pada {$responseDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut.\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah tersebut. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dikirim otomatis saat tenggat konfirmasi terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) dan akses one-click reviewer dinonaktifkan. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\nSekedar mengingatkan tentang permohonan kami untuk melakukan review terhadap naskah, &quot;{$submissionTitle},&quot; untuk {$contextName}. Kami berharap telah menerima respon Anda pada {$responseDueDate}, dan email ini dikirim secara otomatis seiring terlewatinya tanggal tersebut.\n<br />\nKami memandang bahwa Anda merupakan reviewer yang tepat untuk naskah tersebut. Abstrak naskah tersebut disertakan di bawah ini, dan kami berharap Anda berkenan melakukannya.<br />\n<br />\nSilakan login ke website jurnal untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dikirim otomatis saat tenggat konfirmasi reviewer terlewati (lihat Opsi Review di menu Pengaturan > Alur Kerja > Review) dan akses one-click reviewer diaktifkan. Tugas Terjadwal harus diaktifkan dan diatur (lihat file konfigurasi website).'),
('REVIEW_REQUEST_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
('REVIEW_REQUEST_SUBSEQUENT', 'id_ID', 'Permohonan Review Artikel', '{$reviewerName}:<br />\n<br />\nEmail ini terkait naskah &quot;{$submissionTitle},&quot; yang sedang dalam pertimbangan di {$contextName}.<br />\n<br />\nSetelah review untuk versi naskah sebelumnya, penulis saat ini telah menyerahkan versi revisi naskahnya.  Kami berharap Anda dapat membantu mengevaluasinya.<br />\n<br />\nSilakan login ke website jurnal sebelum {$responseDueDate} untuk memberitahukan apakah Anda bersedia melakukan review atau tidak, juga untuk mengakses naskah dan menyerahkan review beserta rekomendasi Anda. Website jurnal adalah {$contextUrl}<br />\n<br />\nTenggat review ini sendiri adalah {$reviewDueDate}.<br />\n<br />\nJika Anda tidak memiliki nama pengguna dan sandi untuk website jurnal ini, Anda dapat menggunakan tautan berikut untuk mereset sandi Anda (yang selanjutnya akan diemailkan kepada Anda bersama nama pengguna Anda). {$passwordResetUrl}<br />\n<br />\nURL Naskah: {$submissionReviewUrl}<br />\n<br />\nTerimakasih atas perhatiannya.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Email ini dari Editor Bagian kepada Reviewer untuk meminta reviewer memberitahukan apakah menerima atau menolak permohonan review untuk ronde kedua atau berikutnya. Email ini memberikan informasi tentang naskah meliputi judul dan abstrak, tenggat review, dan cara mengakses naskah. Pesan ini digunakan saat Proses Review Standar dipilih di Manajemen > Pengaturan > Alur Kerja > Review. (Selain itu lihat REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
('REVISED_VERSION_NOTIFY', 'en_US', 'Revised Version Uploaded', 'Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),
('REVISED_VERSION_NOTIFY', 'id_ID', 'Versi Revisi telah Diunggah', 'Editor:<br />\n<br />\nVersi revisi dari &quot;{$submissionTitle}&quot; telah diunggah oleh penulis {$authorName}.<br />\n<br />\nURL naskah: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'Email ini dikirim secara otomatis ke editor yang ditugaskan saat penulis mengunggah naskah versi revisi.'),
('STATISTICS_REPORT_NOTIFICATION', 'en_US', 'Editorial activity for {$month}, {$year}', '\n{$name}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}', 'This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),
('STATISTICS_REPORT_NOTIFICATION', 'id_ID', 'Kagiatan redaksi selama {$month}, {$year}', '\n{$name}, <br />\n<br />\nLaporan kondisi jurnal Anda untuk {$month}, {$year} sudah tersedia. Statistik utama Anda bulan ini tersaji sebagai berikut.<br />\n<ul>\n	<li>Naskah baru yang masuk bulan ini: {$newSubmissions}</li>\n	<li>Naskah ditolak bulan ini: {$declinedSubmissions}</li>\n	<li>Naskah yang diterima bulan ini: {$acceptedSubmissions}</li>\n	<li>Total naskah dalam sistem: {$totalSubmissions}</li>\n</ul>\nLogin untuk melihat lebih rinci <a href=\"{$editorialStatsLink}\">trend editorial</a> dan <a href=\"{$publicationStatsLink}\">statistik artikel yang dipublikasikan</a>. Salinan lengkap trend bulan ini terlampir.<br />\n<br />\nSalam Hormat,<br />\n{$principalContactSignature}', 'Email ini dikirim secara otomatis setiap bulan kepada editor dan manajer jurnal untuk menyediakan pratinjau kestabilan sistem.'),
('SUBMISSION_ACK', 'en_US', 'Submission Acknowledgement', '{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to an author when they complete the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),
('SUBMISSION_ACK', 'id_ID', 'Ucapan Terimakasih atas Penyerahan Naskah', '{$authorName}:<br />\n<br />\nTerimakasih telah menyerahkan naskah, &quot;{$submissionTitle}&quot; ke {$contextName}. Dengan sistem manajemenn jurnal online yang kami gunakan, Anda dapat memantau kemajuan proses editorial naskah Anda melalui:<br />\n<br />\nURL Naskah: {$submissionUrl}<br />\nNama pengguna: {$authorUsername}<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami. Terimakasih telah mempercayakan publikasi karya Anda di jurnal kami.<br />\n<br />\n{$editorialContactSignature}', 'Email ini, jika diaktifkan, secara otomatis dikirimkan ke penulis saat menyelesaikan proses penyerahan naskah ke jurnal. Email ini berisi informasi tentang pemantauan kemajuan proses editorial dan ucaan terima kasih atas naskah yang dikirimkan.'),
('SUBMISSION_ACK_NOT_USER', 'en_US', 'Submission Acknowledgement', 'Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.'),
('SUBMISSION_ACK_NOT_USER', 'id_ID', 'Pemberitahuan Penyerahan Naskah', 'Hello,<br />\n<br />\n{$submitterName} telah menyerahkan naskah, &quot;{$submissionTitle}&quot; ke {$contextName}. <br />\n<br />\nJika ada pertanyaan, silakan hubungi kami. Terimakasih telah mempercayakan publikasi karya Anda di jurnal kami.<br />\n<br />\n{$editorialContactSignature}', 'Email ini, jika diaktifkan, secara otomatis dikirimkan ke penulis saat menyelesaikan proses penyerahan naskah ke jurnal. Email ini memberikan informasi mengenai pemantauan kemajuan proses editorial dan mengucapkan terimakasih atas naskah yang dikirimkan.'),
('SUBSCRIPTION_AFTER_EXPIRY', 'en_US', 'Subscription Expired', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY', 'id_ID', 'Langganan Berakhir', '{$subscriberName}:<br />\n<br />\nLangganan {$contextName} Anda telah berakhir.<br />\n<br />\n{$subscriptionType}<br />\nTanggal berakhir: {$expiryDate}<br />\n<br />\nUntuk memperbaharui langganan Anda, silakan kunjungi website jurnal.  Anda dapat login dengan menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}', 'Email ini memberitahu seorang pelanggan bahwa langganannya telah berakhir.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'en_US', 'Subscription Expired - Final Reminder', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'id_ID', 'Langganan Berakhir - Pengingat Terakhir', '{$subscriberName}:<br />\n<br />\nLangganan {$contextName} Anda telah berakhir.<br />\nIni adalah pengingat terakhir yang diemailkan kepada Anda.<br />\n<br />\n{$subscriptionType}<br />\nTanggal berakhir: {$expiryDate}<br />\n<br />\nUntuk memperbaharui langganan Anda, silakan kunjungi website jurnal.  Anda dapat login dengan menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}', 'Email ini memberitahu seorang pelanggan bahwa langganannya telah berakhir.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),
('SUBSCRIPTION_BEFORE_EXPIRY', 'en_US', 'Notice of Subscription Expiry', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_BEFORE_EXPIRY', 'id_ID', 'Pemberitahuan Tanggal Berakhir Langganan', '{$subscriberName}:<br />\n<br />\nLangganan {$contextName} Anda hampir berakhir.<br />\n<br />\n{$subscriptionType}<br />\nTanggal berakhir: {$expiryDate}<br />\n<br />\nUntuk terus memperoleh akses ke jurnal ini, silakan kunjungi website jurnal dan perbaharui langganan Anda. Anda dapat login menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}', 'Email ini memberitahu seorang pelanggan bahwa langganannya hampir berakhir.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),
('SUBSCRIPTION_NOTIFY', 'en_US', 'Subscription Notification', '{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_NOTIFY', 'id_ID', 'Pemberitahuan Langganan', '{$subscriberName}:<br />\n<br />\nAnda sekarang telah terdaftar sebagai pelanggan di sistem manajemen jurnal online kami, {$contextName}, dengan jenis langganan:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nUntuk mengakses konten yang hanya tersedia bagi pelanggan, silakan login ke sistem dengan menggunakan nama pengguna Anda, &quot;{$username}&quot;.<br />\n<br />\nSetelah login, Anda dapat mengubah detail profil Anda dan sandi Anda kapanpun Anda kehendaki.<br />\n<br />\nJika Anda memiliki langganan institusi, pengguna di institusi Anda tidak perlu login karena semua akses secara otomatis diotentikasi oleh sistem.<br />\n<br />\nJika ada pertanyaan, silakan hubungi kami.<br />\n<br />\n{$subscriptionContactSignature}', 'Email ini memberitahu pembaca terdaftar bahwa Manajer telah membuat akses langganan untuk mereka.  Email ini memberikan URL jurnal beserta petunjuk aksesnya.'),
('SUBSCRIPTION_PURCHASE_INDL', 'en_US', 'Subscription Purchase: Individual', 'An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_PURCHASE_INDL', 'id_ID', 'Pembelian Langganan: Individu', 'Sebuah langganan individu telah dibeli online untuk {$contextName} dengan rincian berikut.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nPengguna:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n', 'Email ini memberitahu Manajer Langganan bahwa sebuah langganan individu telah dibeli online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang dibeli.'),
('SUBSCRIPTION_PURCHASE_INSTL', 'en_US', 'Subscription Purchase: Institutional', 'An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_PURCHASE_INSTL', 'id_ID', 'Pembelian Langganan: Institusi', 'Sebuah langganan institusi telah dibeli online untuk {$contextName} dengan rincian berikut. Untuk mengaktifkan langganan ini, silakan gunakan URL Langganan dan jadikan status langganan ke \'Aktif\'.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nInstitusi:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (jika ada):<br />\n{$domain}<br />\n<br />\nIP Ranges (jika ada):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n', 'Email ini memberitahu Manajer Langganan bahwa sebuah langganan institusi telah dibeli online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang dibeli.'),
('SUBSCRIPTION_RENEW_INDL', 'en_US', 'Subscription Renewal: Individual', 'An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('SUBSCRIPTION_RENEW_INDL', 'id_ID', 'Pembaharuan Langganan: Individu', 'Sebuah langganan individu telah diperbaharui online untuk {$contextName} dengan rincian berikut.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nPengguna:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n', 'Email ini memberitahu Manajer Langganan bahwa sebuah langganan individu telah diperbaharui online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang diperbaharui.'),
('SUBSCRIPTION_RENEW_INSTL', 'en_US', 'Subscription Renewal: Institutional', 'An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('SUBSCRIPTION_RENEW_INSTL', 'id_ID', 'Pembaharuan Langganan: Institusi', 'Sebuah langganan institusi telah diperbaharui online untuk {$contextName} dengan rincian berikut.<br />\n<br />\nJenis Langganan:<br />\n{$subscriptionType}<br />\n<br />\nInstitusi:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (jika ada):<br />\n{$domain}<br />\n<br />\nIP Ranges (jika ada):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nInformasi Keanggotaan (jika ada):<br />\n{$membership}<br />\n<br />\nUntuk melihat atau mengubah langganan ini, silakan gunakan URL berikut ini.<br />\n<br />\nURL Langganan: {$subscriptionUrl}<br />\n', 'Email ini memberitahu Manajer Langganan bahwa sebuah langganan institusi telah diperbaharui online.  Email ini memberikan ringkasan informasi tentang langganan tersebut beserta tautan untuk mengakses langganan yang diperbaharui.'),
('USER_REGISTER', 'en_US', 'Journal Registration', '{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),
('USER_REGISTER', 'id_ID', 'Registrasi Jurnal', '{$userFullName}<br />\n<br />\nAnda sekarang telah terdaftar sebagai pengguna di {$contextName}.  Kami sertakan nama pengguna dan sandi Anda di email ini, keduanya diperlukan untuk semua kegiatan melalui website jurnal ini. Anda dapat keluar dari daftar pengguna jurnal kapan saja dengan menghubungi kami.<br />\n<br />\nNama pengguna: {$username}<br />\nSandi: {$password}<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}', 'Email ini dikirimkan ke pengguna baru untuk menyambut dan memberikan informasi nama pengguna dan sandi.'),
('USER_VALIDATE', 'en_US', 'Validate Your Account', '{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to validate their email account.'),
('USER_VALIDATE', 'id_ID', 'Validasi Akun Anda', '{$userFullName}<br />\n<br />\nAnda telah membuat akun di {$contextName}.  Sebelum dapat menggunakannya, Anda perlu melakukan validasi akun email. Untuk melakukannya, klik tautan berikut ini:<br />\n<br />\n{$activateUrl}<br />\n<br />\nTerimakasih,<br />\n{$principalContactSignature}', 'Email ini dikirim ke pengguna baru agar melakukan validasi email yang mereka gunakan untuk registrasi.');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_settings`
--

CREATE TABLE `email_templates_settings` (
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_log`
--

CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_log_settings`
--

CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL,
  `filter_group_id` bigint(20) NOT NULL DEFAULT 0,
  `context_id` bigint(20) NOT NULL DEFAULT 0,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint(6) NOT NULL DEFAULT 0,
  `parent_filter_id` bigint(20) NOT NULL DEFAULT 0,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`filter_id`, `filter_group_id`, `context_id`, `display_name`, `class_name`, `is_template`, `parent_filter_id`, `seq`) VALUES
(1, 1, 0, 'Extract metadata from a(n) Submission', 'plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter', 0, 0, 0),
(2, 2, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.IssueCrossrefXmlFilter', 0, 0, 0),
(3, 3, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter', 0, 0, 0),
(4, 4, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(5, 5, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(6, 6, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(7, 7, 0, 'DOAJ XML export', 'plugins.importexport.doaj.filter.DOAJXmlFilter', 0, 0, 0),
(8, 8, 0, 'DOAJ JSON export', 'plugins.importexport.doaj.filter.DOAJJsonFilter', 0, 0, 0),
(9, 9, 0, 'Native XML submission export', 'plugins.importexport.native.filter.ArticleNativeXmlFilter', 0, 0, 0),
(10, 10, 0, 'Native XML submission import', 'plugins.importexport.native.filter.NativeXmlArticleFilter', 0, 0, 0),
(11, 11, 0, 'Native XML issue export', 'plugins.importexport.native.filter.IssueNativeXmlFilter', 0, 0, 0),
(12, 12, 0, 'Native XML issue import', 'plugins.importexport.native.filter.NativeXmlIssueFilter', 0, 0, 0),
(13, 13, 0, 'Native XML issue galley export', 'plugins.importexport.native.filter.IssueGalleyNativeXmlFilter', 0, 0, 0),
(14, 14, 0, 'Native XML issue galley import', 'plugins.importexport.native.filter.NativeXmlIssueGalleyFilter', 0, 0, 0),
(15, 15, 0, 'Native XML author export', 'plugins.importexport.native.filter.AuthorNativeXmlFilter', 0, 0, 0),
(16, 16, 0, 'Native XML author import', 'plugins.importexport.native.filter.NativeXmlAuthorFilter', 0, 0, 0),
(17, 18, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlArticleFileFilter', 0, 0, 0),
(18, 17, 0, 'Native XML submission file export', 'lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter', 0, 0, 0),
(19, 19, 0, 'Native XML representation export', 'plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter', 0, 0, 0),
(20, 20, 0, 'Native XML representation import', 'plugins.importexport.native.filter.NativeXmlArticleGalleyFilter', 0, 0, 0),
(21, 21, 0, 'Native XML Publication export', 'plugins.importexport.native.filter.PublicationNativeXmlFilter', 0, 0, 0),
(22, 22, 0, 'Native XML publication import', 'plugins.importexport.native.filter.NativeXmlPublicationFilter', 0, 0, 0),
(23, 23, 0, 'ArticlePubMedXmlFilter', 'plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter', 0, 0, 0),
(24, 24, 0, 'User XML user export', 'lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter', 0, 0, 0),
(25, 25, 0, 'User XML user import', 'lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter', 0, 0, 0),
(26, 26, 0, 'Native XML user group export', 'lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter', 0, 0, 0),
(27, 27, 0, 'Native XML user group import', 'lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `filter_groups`
--

CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_groups`
--

INSERT INTO `filter_groups` (`filter_group_id`, `symbolic`, `display_name`, `description`, `input_type`, `output_type`) VALUES
(1, 'article=>dc11', 'plugins.metadata.dc11.articleAdapter.displayName', 'plugins.metadata.dc11.articleAdapter.description', 'class::classes.submission.Submission', 'metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),
(2, 'issue=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.issue.Issue[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(3, 'article=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.submission.Submission[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(4, 'issue=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.issue.Issue', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(5, 'article=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.submission.Submission', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(6, 'galley=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.article.ArticleGalley', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(7, 'article=>doaj-xml', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.submission.Submission[]', 'xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),
(8, 'article=>doaj-json', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.submission.Submission', 'primitive::string'),
(9, 'article=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.submission.Submission[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(10, 'native-xml=>article', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.submission.Submission[]'),
(11, 'issue=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.Issue[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(12, 'native-xml=>issue', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.Issue[]'),
(13, 'issuegalley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.IssueGalley[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(14, 'native-xml=>issuegalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.IssueGalley[]'),
(15, 'author=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.Author[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(16, 'native-xml=>author', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.Author[]'),
(17, 'SubmissionFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SubmissionFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(18, 'native-xml=>SubmissionFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SubmissionFile'),
(19, 'article-galley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.ArticleGalley', 'xml::schema(plugins/importexport/native/native.xsd)'),
(20, 'native-xml=>ArticleGalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.ArticleGalley[]'),
(21, 'publication=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.publication.Publication', 'xml::schema(plugins/importexport/native/native.xsd)'),
(22, 'native-xml=>Publication', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.publication.Publication'),
(23, 'article=>pubmed-xml', 'plugins.importexport.pubmed.displayName', 'plugins.importexport.pubmed.description', 'class::classes.submission.Submission[]', 'xml::dtd'),
(24, 'user=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.user.User[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(25, 'user-xml=>user', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::classes.users.User[]'),
(26, 'usergroup=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.security.UserGroup[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(27, 'user-xml=>usergroup', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::lib.pkp.classes.security.UserGroup[]');

-- --------------------------------------------------------

--
-- Table structure for table `filter_settings`
--

CREATE TABLE `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  `category` bigint(20) NOT NULL DEFAULT 1,
  `dependent` smallint(6) NOT NULL DEFAULT 0,
  `supplementary` smallint(6) NOT NULL DEFAULT 0,
  `entry_key` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `context_id`, `seq`, `enabled`, `category`, `dependent`, `supplementary`, `entry_key`) VALUES
(1, 1, 0, 1, 1, 0, 0, 'SUBMISSION'),
(2, 1, 1, 1, 3, 0, 1, 'RESEARCHINSTRUMENT'),
(3, 1, 2, 1, 3, 0, 1, 'RESEARCHMATERIALS'),
(4, 1, 3, 1, 3, 0, 1, 'RESEARCHRESULTS'),
(5, 1, 4, 1, 3, 0, 1, 'TRANSCRIPTS'),
(6, 1, 5, 1, 3, 0, 1, 'DATAANALYSIS'),
(7, 1, 6, 1, 3, 0, 1, 'DATASET'),
(8, 1, 7, 1, 3, 0, 1, 'SOURCETEXTS'),
(9, 1, 8, 1, 1, 1, 1, 'MULTIMEDIA'),
(10, 1, 9, 1, 2, 1, 0, 'IMAGE'),
(11, 1, 10, 1, 1, 1, 0, 'STYLE'),
(12, 1, 11, 1, 3, 0, 1, 'OTHER'),
(13, 2, 0, 1, 1, 0, 0, 'SUBMISSION'),
(14, 2, 1, 1, 3, 0, 1, 'RESEARCHINSTRUMENT'),
(15, 2, 2, 1, 3, 0, 1, 'RESEARCHMATERIALS'),
(16, 2, 3, 1, 3, 0, 1, 'RESEARCHRESULTS'),
(17, 2, 4, 1, 3, 0, 1, 'TRANSCRIPTS'),
(18, 2, 5, 1, 3, 0, 1, 'DATAANALYSIS'),
(19, 2, 6, 1, 3, 0, 1, 'DATASET'),
(20, 2, 7, 1, 3, 0, 1, 'SOURCETEXTS'),
(21, 2, 8, 1, 1, 1, 1, 'MULTIMEDIA'),
(22, 2, 9, 1, 2, 1, 0, 'IMAGE'),
(23, 2, 10, 1, 1, 1, 0, 'STYLE'),
(24, 2, 11, 1, 3, 0, 1, 'OTHER'),
(25, 3, 0, 1, 1, 0, 0, 'SUBMISSION'),
(26, 3, 1, 1, 3, 0, 1, 'RESEARCHINSTRUMENT'),
(27, 3, 2, 1, 3, 0, 1, 'RESEARCHMATERIALS'),
(28, 3, 3, 1, 3, 0, 1, 'RESEARCHRESULTS'),
(29, 3, 4, 1, 3, 0, 1, 'TRANSCRIPTS'),
(30, 3, 5, 1, 3, 0, 1, 'DATAANALYSIS'),
(31, 3, 6, 1, 3, 0, 1, 'DATASET'),
(32, 3, 7, 1, 3, 0, 1, 'SOURCETEXTS'),
(33, 3, 8, 1, 1, 1, 1, 'MULTIMEDIA'),
(34, 3, 9, 1, 2, 1, 0, 'IMAGE'),
(35, 3, 10, 1, 1, 1, 0, 'STYLE'),
(36, 3, 11, 1, 3, 0, 1, 'OTHER');

-- --------------------------------------------------------

--
-- Table structure for table `genre_settings`
--

CREATE TABLE `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre_settings`
--

INSERT INTO `genre_settings` (`genre_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Article Text', 'string'),
(1, 'id_ID', 'name', 'File Utama Naskah', 'string'),
(2, 'en_US', 'name', 'Research Instrument', 'string'),
(2, 'id_ID', 'name', 'Instrumen Penelitian', 'string'),
(3, 'en_US', 'name', 'Research Materials', 'string'),
(3, 'id_ID', 'name', 'Bahan Penelitian', 'string'),
(4, 'en_US', 'name', 'Research Results', 'string'),
(4, 'id_ID', 'name', 'Hasil Penelitian', 'string'),
(5, 'en_US', 'name', 'Transcripts', 'string'),
(5, 'id_ID', 'name', 'Transkrip', 'string'),
(6, 'en_US', 'name', 'Data Analysis', 'string'),
(6, 'id_ID', 'name', 'Analisis Data', 'string'),
(7, 'en_US', 'name', 'Data Set', 'string'),
(7, 'id_ID', 'name', 'Data Set', 'string'),
(8, 'en_US', 'name', 'Source Texts', 'string'),
(8, 'id_ID', 'name', 'Teks Sumber', 'string'),
(9, 'en_US', 'name', 'Multimedia', 'string'),
(9, 'id_ID', 'name', 'Multimedia', 'string'),
(10, 'en_US', 'name', 'Image', 'string'),
(10, 'id_ID', 'name', 'Gambar', 'string'),
(11, 'en_US', 'name', 'HTML Stylesheet', 'string'),
(11, 'id_ID', 'name', 'HTML StyleSheet', 'string'),
(12, 'en_US', 'name', 'Other', 'string'),
(12, 'id_ID', 'name', 'Lainnya', 'string'),
(13, 'en_US', 'name', 'Article Text', 'string'),
(13, 'id_ID', 'name', 'File Utama Naskah', 'string'),
(14, 'en_US', 'name', 'Research Instrument', 'string'),
(14, 'id_ID', 'name', 'Instrumen Penelitian', 'string'),
(15, 'en_US', 'name', 'Research Materials', 'string'),
(15, 'id_ID', 'name', 'Bahan Penelitian', 'string'),
(16, 'en_US', 'name', 'Research Results', 'string'),
(16, 'id_ID', 'name', 'Hasil Penelitian', 'string'),
(17, 'en_US', 'name', 'Transcripts', 'string'),
(17, 'id_ID', 'name', 'Transkrip', 'string'),
(18, 'en_US', 'name', 'Data Analysis', 'string'),
(18, 'id_ID', 'name', 'Analisis Data', 'string'),
(19, 'en_US', 'name', 'Data Set', 'string'),
(19, 'id_ID', 'name', 'Data Set', 'string'),
(20, 'en_US', 'name', 'Source Texts', 'string'),
(20, 'id_ID', 'name', 'Teks Sumber', 'string'),
(21, 'en_US', 'name', 'Multimedia', 'string'),
(21, 'id_ID', 'name', 'Multimedia', 'string'),
(22, 'en_US', 'name', 'Image', 'string'),
(22, 'id_ID', 'name', 'Gambar', 'string'),
(23, 'en_US', 'name', 'HTML Stylesheet', 'string'),
(23, 'id_ID', 'name', 'HTML StyleSheet', 'string'),
(24, 'en_US', 'name', 'Other', 'string'),
(24, 'id_ID', 'name', 'Lainnya', 'string'),
(25, 'en_US', 'name', 'Article Text', 'string'),
(25, 'id_ID', 'name', 'File Utama Naskah', 'string'),
(26, 'en_US', 'name', 'Research Instrument', 'string'),
(26, 'id_ID', 'name', 'Instrumen Penelitian', 'string'),
(27, 'en_US', 'name', 'Research Materials', 'string'),
(27, 'id_ID', 'name', 'Bahan Penelitian', 'string'),
(28, 'en_US', 'name', 'Research Results', 'string'),
(28, 'id_ID', 'name', 'Hasil Penelitian', 'string'),
(29, 'en_US', 'name', 'Transcripts', 'string'),
(29, 'id_ID', 'name', 'Transkrip', 'string'),
(30, 'en_US', 'name', 'Data Analysis', 'string'),
(30, 'id_ID', 'name', 'Analisis Data', 'string'),
(31, 'en_US', 'name', 'Data Set', 'string'),
(31, 'id_ID', 'name', 'Data Set', 'string'),
(32, 'en_US', 'name', 'Source Texts', 'string'),
(32, 'id_ID', 'name', 'Teks Sumber', 'string'),
(33, 'en_US', 'name', 'Multimedia', 'string'),
(33, 'id_ID', 'name', 'Multimedia', 'string'),
(34, 'en_US', 'name', 'Image', 'string'),
(34, 'id_ID', 'name', 'Gambar', 'string'),
(35, 'en_US', 'name', 'HTML Stylesheet', 'string'),
(35, 'id_ID', 'name', 'HTML StyleSheet', 'string'),
(36, 'en_US', 'name', 'Other', 'string'),
(36, 'id_ID', 'name', 'Lainnya', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `institutional_subscriptions`
--

CREATE TABLE `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institutional_subscription_ip`
--

CREATE TABLE `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` smallint(6) NOT NULL DEFAULT 0,
  `current` smallint(6) NOT NULL DEFAULT 0,
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` smallint(6) NOT NULL DEFAULT 1,
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` smallint(6) NOT NULL DEFAULT 0,
  `show_number` smallint(6) NOT NULL DEFAULT 0,
  `show_year` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 0,
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_files`
--

CREATE TABLE `issue_files` (
  `file_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_galleys`
--

CREATE TABLE `issue_galleys` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `url_path` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_galley_settings`
--

CREATE TABLE `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_settings`
--

CREATE TABLE `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_views`
--

CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `journal_id` bigint(20) NOT NULL,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Used to order lists of journals',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`journal_id`, `path`, `seq`, `primary_locale`, `enabled`) VALUES
(1, 'SAINTEK', 1.00, 'en_US', 1),
(2, 'dharmamedika', 3.00, 'en_US', 1),
(3, 'ECHO', 1.00, 'en_US', 1);

-- --------------------------------------------------------

--
-- Table structure for table `journal_settings`
--

CREATE TABLE `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `journal_settings`
--

INSERT INTO `journal_settings` (`journal_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'copyrightYearBasis', 'issue', NULL),
(1, '', 'defaultReviewMode', '2', NULL),
(1, '', 'disableSubmissions', '0', NULL),
(1, '', 'emailSignature', '<br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost/ojs/index.php/SAINTEK\">Sains And Technology (SAINTEK)</a>', NULL),
(1, '', 'enableOai', '1', NULL),
(1, '', 'itemsPerPage', '25', NULL),
(1, '', 'keywords', 'request', NULL),
(1, '', 'membershipFee', '0', NULL),
(1, '', 'numPageLinks', '10', NULL),
(1, '', 'numWeeksPerResponse', '4', NULL),
(1, '', 'numWeeksPerReview', '4', NULL),
(1, '', 'publicationFee', '0', NULL),
(1, '', 'purchaseArticleFee', '0', NULL),
(1, '', 'sidebar', '[]', NULL),
(1, '', 'supportedFormLocales', '[\"en_US\"]', NULL),
(1, '', 'supportedLocales', '[\"en_US\",\"id_ID\"]', NULL),
(1, '', 'supportedSubmissionLocales', '[\"en_US\"]', NULL),
(1, '', 'themePluginPath', 'default', NULL),
(1, 'en_US', 'abbreviation', 'SAINTEK', NULL),
(1, 'en_US', 'about', '<p><span class=\"\">Jurnal Sains And Technology (SAINTEK) adalah jurnal ilmiah di bidang sains dan teknologi yang bertujuan untuk menerbitkan karya ilmiah berkualitas tinggi termasuk makalah penelitian asli, ulasan, komunikasi singkat, dan catatan teknis. </span><span class=\"\">Jurnal ini menerima pengajuan artikel yang mencakup mata pelajaran khas ilmu pengetahuan dan teknologi alam seperti </span><strong><span class=\"\">Kimia,  </span><span class=\"\">Farmasi, </span><span class=\"\"> Fisika/Fisika Terapan, dan Matematika. </span></strong></p>', NULL),
(1, 'en_US', 'acronym', 'SAINTEK', NULL),
(1, 'en_US', 'authorInformation', 'Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost/ojs/index.php/SAINTEK/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost/ojs/index.php/SAINTEK/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/ojs/index.php/SAINTEK/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost/ojs/index.php/index/login\">log in</a> and begin the five-step process.', NULL),
(1, 'en_US', 'clockssLicense', 'This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>', NULL),
(1, 'en_US', 'description', '<p><span class=\"\">Jurnal Sains And Technology (SAINTEK) adalah jurnal ilmiah di bidang sains dan teknologi yang bertujuan untuk menerbitkan karya ilmiah berkualitas tinggi termasuk makalah penelitian asli, ulasan, komunikasi singkat, dan catatan teknis. </span><span class=\"\">Jurnal ini menerima pengajuan artikel yang mencakup mata pelajaran khas ilmu pengetahuan dan teknologi alam seperti </span><strong><span class=\"\">Kimia,  </span><span class=\"\">Farmasi, </span><span class=\"\"> Fisika/Fisika Terapan, dan Matematika. </span></strong></p>', NULL),
(1, 'en_US', 'homepageImage', '{\"name\":\"3834085992.jpg\",\"uploadName\":\"homepageImage_en_US.jpg\",\"width\":900,\"height\":579,\"dateUploaded\":\"2023-04-18 09:01:47\",\"altText\":\"\"}', NULL),
(1, 'en_US', 'journalThumbnail', '{\"name\":\"smartmockups_lglwbjle.jpg\",\"uploadName\":\"journalThumbnail_en_US.jpg\",\"width\":413,\"height\":696,\"dateUploaded\":\"2023-04-18 08:44:01\",\"altText\":\"\"}', NULL),
(1, 'en_US', 'librarianInformation', 'We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).', NULL),
(1, 'en_US', 'lockssLicense', 'This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>', NULL),
(1, 'en_US', 'name', 'Jurnal Sains And Technology (SAINTEK)', NULL),
(1, 'en_US', 'openAccessPolicy', 'This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.', NULL),
(1, 'en_US', 'pageFooter', '<p><strong>Jurnal Sains And Technology (SAINTEK)</strong></p>\n<p><strong>`Diterbitkan dan Dipublish : Universitas Sariputra Indonesia Tomohon</strong></p>', NULL),
(1, 'en_US', 'privacyStatement', '<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>', NULL),
(1, 'en_US', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost/ojs/index.php/SAINTEK/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost/ojs/index.php/SAINTEK/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.', NULL),
(1, 'en_US', 'submissionChecklist', '[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]', NULL),
(1, 'id_ID', 'abbreviation', NULL, NULL),
(1, 'id_ID', 'acronym', NULL, NULL),
(1, 'id_ID', 'authorInformation', 'Tertarik menerbitkan jurnal? Kami merekomendasikan Anda mereview halaman <a href=\"http://localhost/ojs/index.php/SAINTEK/about\">Tentang Kami </a>untuk kebijakan bagian jurnal serta <a href=\"http://localhost/ojs/index.php/SAINTEK/about/submissions#authorGuidelines\">Petunjuk Penulis </a>. Penulis perlu <a href=\"http://localhost/ojs/index.php/SAINTEK/user/register\">Mendaftar </a>dengan jurnal sebelum menyerahkan atau jika sudah terdaftar <a href=\"http://localhost/ojs/index.php/index/login\">login</a>dan mulai proses lima langkah.', NULL),
(1, 'id_ID', 'clockssLicense', 'Journal ini memakai sistem CLOCKSS untum membuat sistem pengarsipan terdistribusi di antara pustaka yang turut berpartisipasi dan mengizinkan pustaka tersebut membuat arsip jurnal secara permanen untuk tujuan pemeliharaan dan pemulihan. <a href=\"http://clockss.org/\">More...</a>', NULL),
(1, 'id_ID', 'librarianInformation', 'Kami mendorong pustakawan riset untuk mendaftar jurnal diantara pemegang jurnal eletronik perpustakaan. Begitu juga, ini mungkin berharga bahwa sistem penerbitan sumber terbuka jurnal cocok untuk perpustakaan untuk menjadi tuan rumah untuk anggota fakultas untuk menggunakan jurnal saat mereka terlibat dalam proses editing. (Lihat <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).', NULL),
(1, 'id_ID', 'lockssLicense', 'OJS sistem LOCKSS berfungsi sebagai sistem pengarsipan terdistribusi antar-perpustakaan yang menggunakan sistem ini dengan tujuan membuat arsip permanen (untuk preservasi dan restorasi). <a href=\"http://www.lockss.org/\">Lanjut...</a>', NULL),
(1, 'id_ID', 'name', NULL, NULL),
(1, 'id_ID', 'openAccessPolicy', 'Jurnal ini menyediakan akses terbuka yang pada prinsipnya membuat riset tersedia secara gratis untuk publik dan akan mensupport pertukaran pengetahuan global terbesar.', NULL),
(1, 'id_ID', 'privacyStatement', '<p>Nama dan alamat email yang dimasukkan di website ini hanya akan digunakan untuk tujuan yang sudah disebutkan, tidak akan disalahgunakan untuk tujuan lain atau untuk disebarluaskan ke pihak lain.</p>', NULL),
(1, 'id_ID', 'readerInformation', 'Kami mendorong pembaca untuk mendaftarkan diri di layanan notifikasi penerbitan untuk jurnal ini. Gunakan tautan <a href=\"http://localhost/ojs/index.php/SAINTEK/user/register\">Daftar</a>di bagian atas beranda jurnal. Dengan mendaftar, pembaca akan memperoleh email berisi Daftar Isi tiap ada terbitan jurnal baru. Daftar ini juga membuat jurnal dapat mengetahui tingkat dukungan atau jumlah pembaca. Lihat jurnal <a href=\"http://localhost/ojs/index.php/SAINTEK/about/submissions#privacyStatement\">Pernyataan Privasi</a>, yang meyakinkan pembaca bahwa nama dan alamat email yang didaftarkan tidak akan digunakan untuk tujuan lain.', NULL),
(1, 'id_ID', 'submissionChecklist', '[{\"order\":1,\"content\":\"Naskah belum pernah diterbitkan sebelumnya, dan tidak sedang dalam pertimbangan untuk diterbitkan di jurnal lain (atau sudah dijelaskan dalam Komentar kepada Editor).\"},{\"order\":2,\"content\":\"File naskah dalam format dokumen OpenOffice, Microsoft Word, atau RTF.\"},{\"order\":3,\"content\":\"Referensi yang dapat diakses online telah dituliskan URL-nya.\"},{\"order\":4,\"content\":\"Naskah diketik dengan teks 1 spasi; font 12; menggunakan huruf miring, bukan huruf bergaris bawah (kecuali alamat URL); dan semua ilustrasi, gambar, dan tabel diletakkan dalam teks pada tempat yang diharapkan, bukan dikelompokkan tersendiri di akhir naskah.\"},{\"order\":5,\"content\":\"Naskah mengikuti aturan gaya selingkung dan bibliografi yang disyaratkan dalam Panduan Penulis.\"}]', NULL),
(2, '', 'copyrightYearBasis', 'issue', NULL),
(2, '', 'defaultReviewMode', '2', NULL),
(2, '', 'disableSubmissions', '0', NULL),
(2, '', 'emailSignature', '<br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost/ojs/index.php/dharmamedika\">Jurnal Dharma Medika</a>', NULL),
(2, '', 'enableOai', '1', NULL),
(2, '', 'itemsPerPage', '25', NULL),
(2, '', 'keywords', 'request', NULL),
(2, '', 'membershipFee', '0', NULL),
(2, '', 'numPageLinks', '10', NULL),
(2, '', 'numWeeksPerResponse', '4', NULL),
(2, '', 'numWeeksPerReview', '4', NULL),
(2, '', 'publicationFee', '0', NULL),
(2, '', 'purchaseArticleFee', '0', NULL),
(2, '', 'sidebar', '[]', NULL),
(2, '', 'supportedFormLocales', '[\"en_US\"]', NULL),
(2, '', 'supportedLocales', '[\"id_ID\",\"en_US\"]', NULL),
(2, '', 'supportedSubmissionLocales', '[\"en_US\"]', NULL),
(2, '', 'themePluginPath', 'default', NULL),
(2, 'en_US', 'abbreviation', 'JDM', NULL),
(2, 'en_US', 'about', '<p>Jurnal Dharma Medika: merupakan jurnal hasil penelitian, studi kasus, dan tinjauan pustaka di bidang kajian ilmu-ilmu kesehatan dan kedokteran.</p>\n<p>Media Ilmiah Analis Kesehatan merupakan terbitan berkala untuk mendiseminasikan hasil-hasil penelitian dan pengembangan di bidang Analis Kesehatan (Teknologi Laboratorium Medis).</p>\n<p>Jurnal Medika: Media Ilmiah Analis Kesehatan diterbitkan oleh Lembaga Penelitian dan Pengabdian kepada Masyarakat.</p>', NULL),
(2, 'en_US', 'acronym', 'JDM', NULL),
(2, 'en_US', 'authorInformation', 'Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost/ojs/index.php/dharmamedika/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost/ojs/index.php/dharmamedika/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/ojs/index.php/dharmamedika/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost/ojs/index.php/index/login\">log in</a> and begin the five-step process.', NULL),
(2, 'en_US', 'clockssLicense', 'This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>', NULL),
(2, 'en_US', 'description', '<p>Jurnal Dharma Medika: merupakan jurnal hasil penelitian, studi kasus, dan tinjauan pustaka di bidang kajian ilmu-ilmu kesehatan dan kedokteran.</p>\n<p>Media Ilmiah Analis Kesehatan merupakan terbitan berkala untuk mendiseminasikan hasil-hasil penelitian dan pengembangan di bidang Analis Kesehatan (Teknologi Laboratorium Medis).</p>\n<p>Jurnal Medika: Media Ilmiah Analis Kesehatan diterbitkan oleh Lembaga Penelitian dan Pengabdian kepada Masyarakat.</p>', NULL),
(2, 'en_US', 'homepageImage', '{\"name\":\"penelitian-1.jpg\",\"uploadName\":\"homepageImage_en_US.jpg\",\"width\":800,\"height\":445,\"dateUploaded\":\"2023-04-18 09:21:07\",\"altText\":\"\"}', NULL),
(2, 'en_US', 'journalThumbnail', '{\"name\":\"smartmockups_lglwcyen.jpg\",\"uploadName\":\"journalThumbnail_en_US.jpg\",\"width\":413,\"height\":665,\"dateUploaded\":\"2023-04-18 08:46:24\",\"altText\":\"\"}', NULL),
(2, 'en_US', 'librarianInformation', 'We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).', NULL),
(2, 'en_US', 'lockssLicense', 'This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>', NULL),
(2, 'en_US', 'name', 'Jurnal Dharma Medika', NULL),
(2, 'en_US', 'openAccessPolicy', 'This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.', NULL),
(2, 'en_US', 'pageFooter', '<p><strong>Jurnal Dharma Medhika</strong></p>\n<p><strong>Diterbitkan dan Dipublish : Universitas Sariputra Indonesia Tomohon</strong></p>', NULL),
(2, 'en_US', 'privacyStatement', '<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>', NULL),
(2, 'en_US', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost/ojs/index.php/dharmamedika/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost/ojs/index.php/dharmamedika/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.', NULL),
(2, 'en_US', 'submissionChecklist', '[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]', NULL),
(2, 'id_ID', 'abbreviation', NULL, NULL),
(2, 'id_ID', 'acronym', NULL, NULL),
(2, 'id_ID', 'authorInformation', 'Tertarik menerbitkan jurnal? Kami merekomendasikan Anda mereview halaman <a href=\"http://localhost/ojs/index.php/dharmamedika/about\">Tentang Kami </a>untuk kebijakan bagian jurnal serta <a href=\"http://localhost/ojs/index.php/dharmamedika/about/submissions#authorGuidelines\">Petunjuk Penulis </a>. Penulis perlu <a href=\"http://localhost/ojs/index.php/dharmamedika/user/register\">Mendaftar </a>dengan jurnal sebelum menyerahkan atau jika sudah terdaftar <a href=\"http://localhost/ojs/index.php/index/login\">login</a>dan mulai proses lima langkah.', NULL),
(2, 'id_ID', 'clockssLicense', 'Journal ini memakai sistem CLOCKSS untum membuat sistem pengarsipan terdistribusi di antara pustaka yang turut berpartisipasi dan mengizinkan pustaka tersebut membuat arsip jurnal secara permanen untuk tujuan pemeliharaan dan pemulihan. <a href=\"http://clockss.org/\">More...</a>', NULL),
(2, 'id_ID', 'librarianInformation', 'Kami mendorong pustakawan riset untuk mendaftar jurnal diantara pemegang jurnal eletronik perpustakaan. Begitu juga, ini mungkin berharga bahwa sistem penerbitan sumber terbuka jurnal cocok untuk perpustakaan untuk menjadi tuan rumah untuk anggota fakultas untuk menggunakan jurnal saat mereka terlibat dalam proses editing. (Lihat <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).', NULL),
(2, 'id_ID', 'lockssLicense', 'OJS sistem LOCKSS berfungsi sebagai sistem pengarsipan terdistribusi antar-perpustakaan yang menggunakan sistem ini dengan tujuan membuat arsip permanen (untuk preservasi dan restorasi). <a href=\"http://www.lockss.org/\">Lanjut...</a>', NULL),
(2, 'id_ID', 'name', NULL, NULL),
(2, 'id_ID', 'openAccessPolicy', 'Jurnal ini menyediakan akses terbuka yang pada prinsipnya membuat riset tersedia secara gratis untuk publik dan akan mensupport pertukaran pengetahuan global terbesar.', NULL),
(2, 'id_ID', 'privacyStatement', '<p>Nama dan alamat email yang dimasukkan di website ini hanya akan digunakan untuk tujuan yang sudah disebutkan, tidak akan disalahgunakan untuk tujuan lain atau untuk disebarluaskan ke pihak lain.</p>', NULL),
(2, 'id_ID', 'readerInformation', 'Kami mendorong pembaca untuk mendaftarkan diri di layanan notifikasi penerbitan untuk jurnal ini. Gunakan tautan <a href=\"http://localhost/ojs/index.php/dharmamedika/user/register\">Daftar</a>di bagian atas beranda jurnal. Dengan mendaftar, pembaca akan memperoleh email berisi Daftar Isi tiap ada terbitan jurnal baru. Daftar ini juga membuat jurnal dapat mengetahui tingkat dukungan atau jumlah pembaca. Lihat jurnal <a href=\"http://localhost/ojs/index.php/dharmamedika/about/submissions#privacyStatement\">Pernyataan Privasi</a>, yang meyakinkan pembaca bahwa nama dan alamat email yang didaftarkan tidak akan digunakan untuk tujuan lain.', NULL),
(2, 'id_ID', 'submissionChecklist', '[{\"order\":1,\"content\":\"Naskah belum pernah diterbitkan sebelumnya, dan tidak sedang dalam pertimbangan untuk diterbitkan di jurnal lain (atau sudah dijelaskan dalam Komentar kepada Editor).\"},{\"order\":2,\"content\":\"File naskah dalam format dokumen OpenOffice, Microsoft Word, atau RTF.\"},{\"order\":3,\"content\":\"Referensi yang dapat diakses online telah dituliskan URL-nya.\"},{\"order\":4,\"content\":\"Naskah diketik dengan teks 1 spasi; font 12; menggunakan huruf miring, bukan huruf bergaris bawah (kecuali alamat URL); dan semua ilustrasi, gambar, dan tabel diletakkan dalam teks pada tempat yang diharapkan, bukan dikelompokkan tersendiri di akhir naskah.\"},{\"order\":5,\"content\":\"Naskah mengikuti aturan gaya selingkung dan bibliografi yang disyaratkan dalam Panduan Penulis.\"}]', NULL),
(3, '', 'copyrightYearBasis', 'issue', NULL),
(3, '', 'defaultReviewMode', '2', NULL),
(3, '', 'disableSubmissions', '0', NULL),
(3, '', 'emailSignature', '<br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost/ojs/index.php/ECHO\">Jurnal Economi And Humaniora (ECHO)</a>', NULL),
(3, '', 'enableOai', '1', NULL),
(3, '', 'itemsPerPage', '25', NULL),
(3, '', 'keywords', 'request', NULL),
(3, '', 'membershipFee', '0', NULL),
(3, '', 'numPageLinks', '10', NULL),
(3, '', 'numWeeksPerResponse', '4', NULL),
(3, '', 'numWeeksPerReview', '4', NULL),
(3, '', 'publicationFee', '0', NULL),
(3, '', 'purchaseArticleFee', '0', NULL),
(3, '', 'sidebar', '[]', NULL),
(3, '', 'supportedFormLocales', '[\"en_US\"]', NULL),
(3, '', 'supportedLocales', '[\"id_ID\",\"en_US\"]', NULL),
(3, '', 'supportedSubmissionLocales', '[\"en_US\"]', NULL),
(3, '', 'themePluginPath', 'default', NULL),
(3, 'en_US', 'abbreviation', 'ECHO', NULL),
(3, 'en_US', 'about', '<p>Jurnal Economic And Humaniora (ECHO) adalah Artikel yang dimuat meliputi artikel di bidang sosial ekonomi dan humaniora serta berlaku umum untuk di dunia akademik di bidang sosial, ekonomi dan humaniora Indonesia. Kontribusi dan Bidang yang dikaji dalam jurnal ini sangat luas termasuk di dalamnya bidang-bidang yang bersinggungan dengan bidang ekonomi, manajemen, akuntansi, hukum, bahasa dan sastra, budaya, sosiologi, antropologi, politik, dan bidang yang sangat makro seperti pariwisata, ilmu keguruan dan ilmu pendidikan sosial serta kewirausahaan. Dengan demikian jurnal ini di masa kini dan masa depan memiliki kontribusi yang menentukan di ketiga bidang utamanya yaitu sosial, ekonomi dan humaniora nasional dan harmonisasi sosial</p>', NULL),
(3, 'en_US', 'acronym', 'ECHO', NULL),
(3, 'en_US', 'authorInformation', 'Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost/ojs/index.php/ECHO/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost/ojs/index.php/ECHO/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/ojs/index.php/ECHO/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost/ojs/index.php/index/login\">log in</a> and begin the five-step process.', NULL),
(3, 'en_US', 'clockssLicense', 'This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>', NULL),
(3, 'en_US', 'description', '<p>Jurnal Economic And Humaniora (ECHO) adalah Artikel yang dimuat meliputi artikel di bidang sosial ekonomi dan humaniora serta berlaku umum untuk di dunia akademik di bidang sosial, ekonomi dan humaniora Indonesia. Kontribusi dan Bidang yang dikaji dalam jurnal ini sangat luas termasuk di dalamnya bidang-bidang yang bersinggungan dengan bidang ekonomi, manajemen, akuntansi, hukum, bahasa dan sastra, budaya, sosiologi, antropologi, politik, dan bidang yang sangat makro seperti pariwisata, ilmu keguruan dan ilmu pendidikan sosial serta kewirausahaan. Dengan demikian jurnal ini di masa kini dan masa depan memiliki kontribusi yang menentukan di ketiga bidang utamanya yaitu sosial, ekonomi dan humaniora nasional dan harmonisasi sosial</p>', NULL),
(3, 'en_US', 'homepageImage', '{\"name\":\"ilustrasi-pertumbuhan-ekonomi_169.jpeg\",\"uploadName\":\"homepageImage_en_US.jpg\",\"width\":700,\"height\":394,\"dateUploaded\":\"2023-04-18 09:05:31\",\"altText\":\"\"}', NULL),
(3, 'en_US', 'journalThumbnail', '{\"name\":\"smartmockups_lglwa7i9.jpg\",\"uploadName\":\"journalThumbnail_en_US.jpg\",\"width\":422,\"height\":672,\"dateUploaded\":\"2023-04-18 08:45:50\",\"altText\":\"\"}', NULL),
(3, 'en_US', 'librarianInformation', 'We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).', NULL),
(3, 'en_US', 'lockssLicense', 'This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>', NULL),
(3, 'en_US', 'name', 'Jurnal Economic And Humaniora (ECHO)', NULL),
(3, 'en_US', 'openAccessPolicy', 'This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.', NULL),
(3, 'en_US', 'pageFooter', '<p><strong>Jurnal Economic And Humaniora (ECHO)</strong></p>\n<p><strong>Diterbitkan dan Dipublish : Universitas Sariputra Indonesia Tomohon</strong></p>', NULL),
(3, 'en_US', 'privacyStatement', '<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>', NULL),
(3, 'en_US', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost/ojs/index.php/ECHO/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost/ojs/index.php/ECHO/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.', NULL),
(3, 'en_US', 'submissionChecklist', '[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]', NULL),
(3, 'id_ID', 'abbreviation', NULL, NULL),
(3, 'id_ID', 'acronym', NULL, NULL),
(3, 'id_ID', 'authorInformation', 'Tertarik menerbitkan jurnal? Kami merekomendasikan Anda mereview halaman <a href=\"http://localhost/ojs/index.php/ECHO/about\">Tentang Kami </a>untuk kebijakan bagian jurnal serta <a href=\"http://localhost/ojs/index.php/ECHO/about/submissions#authorGuidelines\">Petunjuk Penulis </a>. Penulis perlu <a href=\"http://localhost/ojs/index.php/ECHO/user/register\">Mendaftar </a>dengan jurnal sebelum menyerahkan atau jika sudah terdaftar <a href=\"http://localhost/ojs/index.php/index/login\">login</a>dan mulai proses lima langkah.', NULL),
(3, 'id_ID', 'clockssLicense', 'Journal ini memakai sistem CLOCKSS untum membuat sistem pengarsipan terdistribusi di antara pustaka yang turut berpartisipasi dan mengizinkan pustaka tersebut membuat arsip jurnal secara permanen untuk tujuan pemeliharaan dan pemulihan. <a href=\"http://clockss.org/\">More...</a>', NULL),
(3, 'id_ID', 'librarianInformation', 'Kami mendorong pustakawan riset untuk mendaftar jurnal diantara pemegang jurnal eletronik perpustakaan. Begitu juga, ini mungkin berharga bahwa sistem penerbitan sumber terbuka jurnal cocok untuk perpustakaan untuk menjadi tuan rumah untuk anggota fakultas untuk menggunakan jurnal saat mereka terlibat dalam proses editing. (Lihat <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).', NULL),
(3, 'id_ID', 'lockssLicense', 'OJS sistem LOCKSS berfungsi sebagai sistem pengarsipan terdistribusi antar-perpustakaan yang menggunakan sistem ini dengan tujuan membuat arsip permanen (untuk preservasi dan restorasi). <a href=\"http://www.lockss.org/\">Lanjut...</a>', NULL),
(3, 'id_ID', 'name', NULL, NULL),
(3, 'id_ID', 'openAccessPolicy', 'Jurnal ini menyediakan akses terbuka yang pada prinsipnya membuat riset tersedia secara gratis untuk publik dan akan mensupport pertukaran pengetahuan global terbesar.', NULL),
(3, 'id_ID', 'privacyStatement', '<p>Nama dan alamat email yang dimasukkan di website ini hanya akan digunakan untuk tujuan yang sudah disebutkan, tidak akan disalahgunakan untuk tujuan lain atau untuk disebarluaskan ke pihak lain.</p>', NULL),
(3, 'id_ID', 'readerInformation', 'Kami mendorong pembaca untuk mendaftarkan diri di layanan notifikasi penerbitan untuk jurnal ini. Gunakan tautan <a href=\"http://localhost/ojs/index.php/ECHO/user/register\">Daftar</a>di bagian atas beranda jurnal. Dengan mendaftar, pembaca akan memperoleh email berisi Daftar Isi tiap ada terbitan jurnal baru. Daftar ini juga membuat jurnal dapat mengetahui tingkat dukungan atau jumlah pembaca. Lihat jurnal <a href=\"http://localhost/ojs/index.php/ECHO/about/submissions#privacyStatement\">Pernyataan Privasi</a>, yang meyakinkan pembaca bahwa nama dan alamat email yang didaftarkan tidak akan digunakan untuk tujuan lain.', NULL),
(3, 'id_ID', 'submissionChecklist', '[{\"order\":1,\"content\":\"Naskah belum pernah diterbitkan sebelumnya, dan tidak sedang dalam pertimbangan untuk diterbitkan di jurnal lain (atau sudah dijelaskan dalam Komentar kepada Editor).\"},{\"order\":2,\"content\":\"File naskah dalam format dokumen OpenOffice, Microsoft Word, atau RTF.\"},{\"order\":3,\"content\":\"Referensi yang dapat diakses online telah dituliskan URL-nya.\"},{\"order\":4,\"content\":\"Naskah diketik dengan teks 1 spasi; font 12; menggunakan huruf miring, bukan huruf bergaris bawah (kecuali alamat URL); dan semua ilustrasi, gambar, dan tabel diletakkan dalam teks pada tempat yang diharapkan, bukan dikelompokkan tersendiri di akhir naskah.\"},{\"order\":5,\"content\":\"Naskah mengikuti aturan gaya selingkung dan bibliografi yang disyaratkan dalam Panduan Penulis.\"}]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `library_files`
--

CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `library_file_settings`
--

CREATE TABLE `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `metadata_descriptions`
--

CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `metadata_description_settings`
--

CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `metrics`
--

CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `metrics`
--

INSERT INTO `metrics` (`load_id`, `context_id`, `pkp_section_id`, `assoc_object_type`, `assoc_object_id`, `submission_id`, `representation_id`, `assoc_type`, `assoc_id`, `day`, `month`, `file_type`, `country_id`, `region`, `city`, `metric_type`, `metric`) VALUES
('usage_events_20230418.log', 1, NULL, NULL, NULL, NULL, NULL, 256, 1, '20230418', '202304', NULL, NULL, NULL, NULL, 'ojs::counter', 33),
('usage_events_20230418.log', 2, NULL, NULL, NULL, NULL, NULL, 256, 2, '20230418', '202304', NULL, NULL, NULL, NULL, 'ojs::counter', 12),
('usage_events_20230418.log', 3, NULL, NULL, NULL, NULL, NULL, 256, 3, '20230418', '202304', NULL, NULL, NULL, NULL, 'ojs::counter', 16),
('usage_events_20230419.log', 1, NULL, NULL, NULL, NULL, NULL, 256, 1, '20230419', '202304', NULL, NULL, NULL, NULL, 'ojs::counter', 1);

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menus`
--

CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menus`
--

INSERT INTO `navigation_menus` (`navigation_menu_id`, `context_id`, `area_name`, `title`) VALUES
(1, 0, 'user', 'User Navigation Menu'),
(2, 1, 'user', 'User Navigation Menu'),
(3, 1, 'primary', 'Primary Navigation Menu'),
(4, 2, 'user', 'User Navigation Menu'),
(5, 2, 'primary', 'Primary Navigation Menu'),
(6, 3, 'user', 'User Navigation Menu'),
(7, 3, 'primary', 'Primary Navigation Menu');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_items`
--

CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menu_items`
--

INSERT INTO `navigation_menu_items` (`navigation_menu_item_id`, `context_id`, `path`, `type`) VALUES
(1, 0, NULL, 'NMI_TYPE_USER_REGISTER'),
(2, 0, NULL, 'NMI_TYPE_USER_LOGIN'),
(3, 0, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(4, 0, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(5, 0, NULL, 'NMI_TYPE_USER_PROFILE'),
(6, 0, NULL, 'NMI_TYPE_ADMINISTRATION'),
(7, 0, NULL, 'NMI_TYPE_USER_LOGOUT'),
(8, 1, NULL, 'NMI_TYPE_USER_REGISTER'),
(9, 1, NULL, 'NMI_TYPE_USER_LOGIN'),
(10, 1, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(11, 1, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(12, 1, NULL, 'NMI_TYPE_USER_PROFILE'),
(13, 1, NULL, 'NMI_TYPE_ADMINISTRATION'),
(14, 1, NULL, 'NMI_TYPE_USER_LOGOUT'),
(15, 1, NULL, 'NMI_TYPE_CURRENT'),
(16, 1, NULL, 'NMI_TYPE_ARCHIVES'),
(17, 1, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(18, 1, NULL, 'NMI_TYPE_ABOUT'),
(19, 1, NULL, 'NMI_TYPE_ABOUT'),
(20, 1, NULL, 'NMI_TYPE_SUBMISSIONS'),
(21, 1, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
(22, 1, NULL, 'NMI_TYPE_PRIVACY'),
(23, 1, NULL, 'NMI_TYPE_CONTACT'),
(24, 1, NULL, 'NMI_TYPE_SEARCH'),
(25, 2, NULL, 'NMI_TYPE_USER_REGISTER'),
(26, 2, NULL, 'NMI_TYPE_USER_LOGIN'),
(27, 2, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(28, 2, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(29, 2, NULL, 'NMI_TYPE_USER_PROFILE'),
(30, 2, NULL, 'NMI_TYPE_ADMINISTRATION'),
(31, 2, NULL, 'NMI_TYPE_USER_LOGOUT'),
(32, 2, NULL, 'NMI_TYPE_CURRENT'),
(33, 2, NULL, 'NMI_TYPE_ARCHIVES'),
(34, 2, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(35, 2, NULL, 'NMI_TYPE_ABOUT'),
(36, 2, NULL, 'NMI_TYPE_ABOUT'),
(37, 2, NULL, 'NMI_TYPE_SUBMISSIONS'),
(38, 2, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
(39, 2, NULL, 'NMI_TYPE_PRIVACY'),
(40, 2, NULL, 'NMI_TYPE_CONTACT'),
(41, 2, NULL, 'NMI_TYPE_SEARCH'),
(42, 3, NULL, 'NMI_TYPE_USER_REGISTER'),
(43, 3, NULL, 'NMI_TYPE_USER_LOGIN'),
(44, 3, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(45, 3, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(46, 3, NULL, 'NMI_TYPE_USER_PROFILE'),
(47, 3, NULL, 'NMI_TYPE_ADMINISTRATION'),
(48, 3, NULL, 'NMI_TYPE_USER_LOGOUT'),
(49, 3, NULL, 'NMI_TYPE_CURRENT'),
(50, 3, NULL, 'NMI_TYPE_ARCHIVES'),
(51, 3, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(52, 3, NULL, 'NMI_TYPE_ABOUT'),
(53, 3, NULL, 'NMI_TYPE_ABOUT'),
(54, 3, NULL, 'NMI_TYPE_SUBMISSIONS'),
(55, 3, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
(56, 3, NULL, 'NMI_TYPE_PRIVACY'),
(57, 3, NULL, 'NMI_TYPE_CONTACT'),
(58, 3, NULL, 'NMI_TYPE_SEARCH'),
(59, 1, '', 'NMI_TYPE_REMOTE_URL'),
(60, 2, '', 'NMI_TYPE_REMOTE_URL'),
(61, 3, '', 'NMI_TYPE_REMOTE_URL');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_assignments`
--

CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

INSERT INTO `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`, `navigation_menu_id`, `navigation_menu_item_id`, `parent_id`, `seq`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 2, 0, 1),
(3, 1, 3, 0, 2),
(4, 1, 4, 3, 0),
(5, 1, 5, 3, 1),
(6, 1, 6, 3, 2),
(7, 1, 7, 3, 3),
(8, 2, 8, 0, 0),
(9, 2, 9, 0, 1),
(10, 2, 10, 0, 2),
(11, 2, 11, 10, 0),
(12, 2, 12, 10, 1),
(13, 2, 13, 10, 2),
(14, 2, 14, 10, 3),
(24, 4, 25, 0, 0),
(25, 4, 26, 0, 1),
(26, 4, 27, 0, 2),
(27, 4, 28, 27, 0),
(28, 4, 29, 27, 1),
(29, 4, 30, 27, 2),
(30, 4, 31, 27, 3),
(40, 6, 42, 0, 0),
(41, 6, 43, 0, 1),
(42, 6, 44, 0, 2),
(43, 6, 45, 44, 0),
(44, 6, 46, 44, 1),
(45, 6, 47, 44, 2),
(46, 6, 48, 44, 3),
(56, 3, 59, 0, 0),
(57, 3, 15, 0, 1),
(58, 3, 16, 0, 2),
(59, 3, 17, 0, 3),
(60, 3, 18, 0, 4),
(61, 3, 19, 18, 5),
(62, 3, 20, 18, 6),
(63, 3, 21, 18, 7),
(64, 3, 22, 18, 8),
(65, 3, 23, 18, 9),
(75, 5, 60, 0, 0),
(76, 5, 32, 0, 1),
(77, 5, 33, 0, 2),
(78, 5, 34, 0, 3),
(79, 5, 35, 0, 4),
(80, 5, 36, 35, 5),
(81, 5, 37, 35, 6),
(82, 5, 38, 35, 7),
(83, 5, 39, 35, 8),
(84, 5, 40, 35, 9),
(85, 7, 61, 0, 0),
(86, 7, 49, 0, 1),
(87, 7, 50, 0, 2),
(88, 7, 51, 0, 3),
(89, 7, 52, 0, 4),
(90, 7, 53, 52, 5),
(91, 7, 54, 52, 6),
(92, 7, 55, 52, 7),
(93, 7, 56, 52, 8),
(94, 7, 57, 52, 9);

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

INSERT INTO `navigation_menu_item_assignment_settings` (`navigation_menu_item_assignment_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(56, 'en_US', 'title', 'home', 'string'),
(75, 'en_US', 'title', 'home', 'string'),
(85, 'en_US', 'title', 'home', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_settings`
--

CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menu_item_settings`
--

INSERT INTO `navigation_menu_item_settings` (`navigation_menu_item_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'titleLocaleKey', 'navigation.register', 'string'),
(2, '', 'titleLocaleKey', 'navigation.login', 'string'),
(3, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(4, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(5, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(6, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(7, '', 'titleLocaleKey', 'user.logOut', 'string'),
(8, '', 'titleLocaleKey', 'navigation.register', 'string'),
(9, '', 'titleLocaleKey', 'navigation.login', 'string'),
(10, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(11, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(12, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(13, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(14, '', 'titleLocaleKey', 'user.logOut', 'string'),
(15, '', 'titleLocaleKey', 'navigation.current', 'string'),
(16, '', 'titleLocaleKey', 'navigation.archives', 'string'),
(17, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(18, '', 'titleLocaleKey', 'navigation.about', 'string'),
(19, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(20, '', 'titleLocaleKey', 'about.submissions', 'string'),
(21, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
(22, '', 'titleLocaleKey', 'manager.setup.privacyStatement', 'string'),
(23, '', 'titleLocaleKey', 'about.contact', 'string'),
(24, '', 'titleLocaleKey', 'common.search', 'string'),
(25, '', 'titleLocaleKey', 'navigation.register', 'string'),
(26, '', 'titleLocaleKey', 'navigation.login', 'string'),
(27, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(28, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(29, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(30, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(31, '', 'titleLocaleKey', 'user.logOut', 'string'),
(32, '', 'titleLocaleKey', 'navigation.current', 'string'),
(33, '', 'titleLocaleKey', 'navigation.archives', 'string'),
(34, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(35, '', 'titleLocaleKey', 'navigation.about', 'string'),
(36, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(37, '', 'titleLocaleKey', 'about.submissions', 'string'),
(38, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
(39, '', 'titleLocaleKey', 'manager.setup.privacyStatement', 'string'),
(40, '', 'titleLocaleKey', 'about.contact', 'string'),
(41, '', 'titleLocaleKey', 'common.search', 'string'),
(42, '', 'titleLocaleKey', 'navigation.register', 'string'),
(43, '', 'titleLocaleKey', 'navigation.login', 'string'),
(44, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(45, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(46, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(47, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(48, '', 'titleLocaleKey', 'user.logOut', 'string'),
(49, '', 'titleLocaleKey', 'navigation.current', 'string'),
(50, '', 'titleLocaleKey', 'navigation.archives', 'string'),
(51, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(52, '', 'titleLocaleKey', 'navigation.about', 'string'),
(53, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(54, '', 'titleLocaleKey', 'about.submissions', 'string'),
(55, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
(56, '', 'titleLocaleKey', 'manager.setup.privacyStatement', 'string'),
(57, '', 'titleLocaleKey', 'about.contact', 'string'),
(58, '', 'titleLocaleKey', 'common.search', 'string'),
(59, 'en_US', 'content', '', 'string'),
(59, 'en_US', 'remoteUrl', 'http://localhost/ojs/index.php/SAINTEK/', 'string'),
(59, 'en_US', 'title', 'home', 'string'),
(60, 'en_US', 'content', '', 'string'),
(60, 'en_US', 'remoteUrl', 'http://localhost/ojs/index.php/dharmamedika', 'string'),
(60, 'en_US', 'title', 'home', 'string'),
(61, 'en_US', 'content', '', 'string'),
(61, 'en_US', 'remoteUrl', 'http://localhost/ojs/index.php/ECHO', 'string'),
(61, 'en_US', 'title', 'home', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification_mail_list`
--

CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL,
  `email` varchar(90) NOT NULL,
  `confirmed` smallint(6) NOT NULL DEFAULT 0,
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification_subscription_settings`
--

CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oai_resumption_tokens`
--

CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plugin_settings`
--

CREATE TABLE `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugin_settings`
--

INSERT INTO `plugin_settings` (`plugin_name`, `context_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
('acronplugin', 0, 'crontab', '[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"classes.tasks.SubscriptionExpiryReminder\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]', 'object'),
('acronplugin', 0, 'enabled', '1', 'bool'),
('defaultthemeplugin', 0, 'enabled', '1', 'bool'),
('defaultthemeplugin', 1, 'baseColour', '#1E6292', 'string'),
('defaultthemeplugin', 1, 'enabled', '1', 'bool'),
('defaultthemeplugin', 1, 'showDescriptionInJournalIndex', 'true', 'string'),
('defaultthemeplugin', 1, 'typography', 'notoSans', 'string'),
('defaultthemeplugin', 1, 'useHomepageImageAsHeader', 'false', 'string'),
('defaultthemeplugin', 2, 'baseColour', '#1E6292', 'string'),
('defaultthemeplugin', 2, 'enabled', '1', 'bool'),
('defaultthemeplugin', 2, 'showDescriptionInJournalIndex', 'true', 'string'),
('defaultthemeplugin', 2, 'typography', 'notoSans', 'string'),
('defaultthemeplugin', 2, 'useHomepageImageAsHeader', 'false', 'string'),
('defaultthemeplugin', 3, 'baseColour', '#1E6292', 'string'),
('defaultthemeplugin', 3, 'enabled', '1', 'bool'),
('defaultthemeplugin', 3, 'showDescriptionInJournalIndex', 'true', 'string'),
('defaultthemeplugin', 3, 'typography', 'notoSans', 'string'),
('defaultthemeplugin', 3, 'useHomepageImageAsHeader', 'false', 'string'),
('developedbyblockplugin', 0, 'enabled', '0', 'bool'),
('developedbyblockplugin', 0, 'seq', '0', 'int'),
('developedbyblockplugin', 1, 'enabled', '0', 'bool'),
('developedbyblockplugin', 1, 'seq', '0', 'int'),
('developedbyblockplugin', 2, 'enabled', '0', 'bool'),
('developedbyblockplugin', 2, 'seq', '0', 'int'),
('developedbyblockplugin', 3, 'enabled', '0', 'bool'),
('developedbyblockplugin', 3, 'seq', '0', 'int'),
('dublincoremetaplugin', 1, 'enabled', '1', 'bool'),
('dublincoremetaplugin', 2, 'enabled', '1', 'bool'),
('dublincoremetaplugin', 3, 'enabled', '1', 'bool'),
('googlescholarplugin', 1, 'enabled', '1', 'bool'),
('googlescholarplugin', 2, 'enabled', '1', 'bool'),
('googlescholarplugin', 3, 'enabled', '1', 'bool'),
('htmlarticlegalleyplugin', 1, 'enabled', '1', 'bool'),
('htmlarticlegalleyplugin', 2, 'enabled', '1', 'bool'),
('htmlarticlegalleyplugin', 3, 'enabled', '1', 'bool'),
('informationblockplugin', 1, 'enabled', '1', 'bool'),
('informationblockplugin', 1, 'seq', '7', 'int'),
('informationblockplugin', 2, 'enabled', '1', 'bool'),
('informationblockplugin', 2, 'seq', '7', 'int'),
('informationblockplugin', 3, 'enabled', '1', 'bool'),
('informationblockplugin', 3, 'seq', '7', 'int'),
('languagetoggleblockplugin', 0, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 0, 'seq', '4', 'int'),
('languagetoggleblockplugin', 1, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 1, 'seq', '4', 'int'),
('languagetoggleblockplugin', 2, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 2, 'seq', '4', 'int'),
('languagetoggleblockplugin', 3, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 3, 'seq', '4', 'int'),
('lensgalleyplugin', 1, 'enabled', '1', 'bool'),
('lensgalleyplugin', 2, 'enabled', '1', 'bool'),
('lensgalleyplugin', 3, 'enabled', '1', 'bool'),
('pdfjsviewerplugin', 1, 'enabled', '1', 'bool'),
('pdfjsviewerplugin', 2, 'enabled', '1', 'bool'),
('pdfjsviewerplugin', 3, 'enabled', '1', 'bool'),
('resolverplugin', 1, 'enabled', '1', 'bool'),
('resolverplugin', 2, 'enabled', '1', 'bool'),
('resolverplugin', 3, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 1, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 1, 'seq', '2', 'int'),
('subscriptionblockplugin', 2, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 2, 'seq', '2', 'int'),
('subscriptionblockplugin', 3, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 3, 'seq', '2', 'int'),
('tinymceplugin', 0, 'enabled', '1', 'bool'),
('tinymceplugin', 1, 'enabled', '1', 'bool'),
('tinymceplugin', 2, 'enabled', '1', 'bool'),
('tinymceplugin', 3, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'uniqueSiteId', '643e0fe514821', 'string'),
('usagestatsplugin', 0, 'accessLogFileParseRegex', '/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/', 'string'),
('usagestatsplugin', 0, 'chartType', 'bar', 'string'),
('usagestatsplugin', 0, 'createLogFiles', '1', 'bool'),
('usagestatsplugin', 0, 'datasetMaxCount', '4', 'string'),
('usagestatsplugin', 0, 'enabled', '1', 'bool'),
('usagestatsplugin', 0, 'optionalColumns', '[\"city\",\"region\"]', 'object'),
('webfeedplugin', 1, 'displayItems', '1', 'bool'),
('webfeedplugin', 1, 'displayPage', 'homepage', 'string'),
('webfeedplugin', 1, 'enabled', '1', 'bool'),
('webfeedplugin', 2, 'displayItems', '1', 'bool'),
('webfeedplugin', 2, 'displayPage', 'homepage', 'string'),
('webfeedplugin', 2, 'enabled', '1', 'bool'),
('webfeedplugin', 3, 'displayItems', '1', 'bool'),
('webfeedplugin', 3, 'displayPage', 'homepage', 'string'),
('webfeedplugin', 3, 'enabled', '1', 'bool');

-- --------------------------------------------------------

--
-- Table structure for table `publications`
--

CREATE TABLE `publications` (
  `publication_id` bigint(20) NOT NULL,
  `access_status` bigint(20) DEFAULT 0,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication_categories`
--

CREATE TABLE `publication_categories` (
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication_galleys`
--

CREATE TABLE `publication_galleys` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `submission_file_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` smallint(6) NOT NULL DEFAULT 0,
  `url_path` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication_galley_settings`
--

CREATE TABLE `publication_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication_settings`
--

CREATE TABLE `publication_settings` (
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `query_participants`
--

CREATE TABLE `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `queued_payments`
--

CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_assignments`
--

CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text DEFAULT NULL,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT 0,
  `declined` smallint(6) NOT NULL DEFAULT 0,
  `cancelled` smallint(6) NOT NULL DEFAULT 0,
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT 1,
  `round` smallint(6) NOT NULL DEFAULT 1,
  `step` smallint(6) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_files`
--

CREATE TABLE `review_files` (
  `review_id` bigint(20) NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_forms`
--

CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_elements`
--

CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` smallint(6) DEFAULT NULL,
  `included` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_element_settings`
--

CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_responses`
--

CREATE TABLE `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_settings`
--

CREATE TABLE `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_rounds`
--

CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_round_files`
--

CREATE TABLE `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_tasks`
--

CREATE TABLE `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scheduled_tasks`
--

INSERT INTO `scheduled_tasks` (`class_name`, `last_run`) VALUES
('classes.tasks.SubscriptionExpiryReminder', '2023-04-18 05:24:52'),
('lib.pkp.classes.task.ReviewReminder', '2023-04-24 03:34:38'),
('lib.pkp.classes.task.StatisticsReport', '2023-04-18 05:24:52'),
('plugins.generic.usageStats.UsageStatsLoader', '2023-04-24 03:34:38'),
('plugins.importexport.crossref.CrossrefInfoSender', '2023-04-24 03:34:38'),
('plugins.importexport.datacite.DataciteInfoSender', '2023-04-24 03:34:38'),
('plugins.importexport.doaj.DOAJInfoSender', '2023-04-24 03:34:38');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `editor_restricted` smallint(6) NOT NULL DEFAULT 0,
  `meta_indexed` smallint(6) NOT NULL DEFAULT 0,
  `meta_reviewed` smallint(6) NOT NULL DEFAULT 1,
  `abstracts_not_required` smallint(6) NOT NULL DEFAULT 0,
  `hide_title` smallint(6) NOT NULL DEFAULT 0,
  `hide_author` smallint(6) NOT NULL DEFAULT 0,
  `is_inactive` smallint(6) NOT NULL DEFAULT 0,
  `abstract_word_count` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `journal_id`, `review_form_id`, `seq`, `editor_restricted`, `meta_indexed`, `meta_reviewed`, `abstracts_not_required`, `hide_title`, `hide_author`, `is_inactive`, `abstract_word_count`) VALUES
(1, 1, 0, 0.00, 0, 1, 1, 0, 0, 0, 0, 0),
(2, 2, 0, 0.00, 0, 1, 1, 0, 0, 0, 0, 0),
(3, 3, 0, 0.00, 0, 1, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `section_settings`
--

CREATE TABLE `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section_settings`
--

INSERT INTO `section_settings` (`section_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'abbrev', 'ART', 'string'),
(1, 'en_US', 'policy', 'Section default policy', 'string'),
(1, 'en_US', 'title', 'Articles', 'string'),
(2, 'en_US', 'abbrev', 'ART', 'string'),
(2, 'en_US', 'policy', 'Section default policy', 'string'),
(2, 'en_US', 'title', 'Articles', 'string'),
(3, 'en_US', 'abbrev', 'ART', 'string'),
(3, 'en_US', 'policy', 'Section default policy', 'string'),
(3, 'en_US', 'title', 'Articles', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT 0,
  `last_used` bigint(20) NOT NULL DEFAULT 0,
  `remember` smallint(6) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  `domain` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `ip_address`, `user_agent`, `created`, `last_used`, `remember`, `data`, `domain`) VALUES
('2kdhaf37vrfmnar6lbeimf1psk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1681801602, 1681801602, 0, '', 'localhost'),
('3bnnfatum4o2p2qa583930vsf4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1681801602, 1681801602, 0, '', 'localhost'),
('3jkmtdd1rfpfeii6tjsqtg7aag', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1681789002, 1681789002, 0, '', 'localhost'),
('4qssi834rusepjl78j06653lgm', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1681788901, 1681803563, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1681803563;s:5:\"token\";s:32:\"fb0ed4665bfaaabf4839887ed73fa266\";}username|s:11:\"adminjurnal\";currentLocale|s:5:\"id_ID\";userId|i:1;', 'localhost'),
('b4eefbi52j6m8fl8i9g1dub9hd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1681801601, 1681801601, 0, '', 'localhost'),
('c256shcgmst75930447cjkmqkb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1681789002, 1681789002, 0, '', 'localhost'),
('gshd5ik1q8h831f7s76007slqq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1681795002, 1681795002, 0, '', 'localhost'),
('hlrur0v8gfnbj38nhu9mqs274c', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1681795001, 1681795001, 0, '', 'localhost'),
('i7qe97t3r4q53isrlfm1k5qsqu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1681789001, 1681789001, 0, '', 'localhost'),
('q9o9jih5eu66usfrkq565ua4rt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1681795002, 1681795002, 0, '', 'localhost'),
('r20ngu4i3koh80dlc5bl3da7vj', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', 1681788247, 1682300143, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1682300143;s:5:\"token\";s:32:\"9af186e44a4fff5a610cac83f5c08a98\";}username|s:11:\"adminjurnal\";currentLocale|s:5:\"id_ID\";userId|i:1;', 'localhost');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT 6,
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`redirect`, `primary_locale`, `min_password_length`, `installed_locales`, `supported_locales`, `original_style_file_name`) VALUES
(0, 'en_US', 6, '[\"id_ID\",\"en_US\"]', '[\"id_ID\",\"en_US\"]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`setting_name`, `locale`, `setting_value`) VALUES
('contactEmail', 'en_US', 'admin@unsrittomohon.ac.id'),
('contactName', 'en_US', 'Open Journal Systems'),
('contactName', 'id_ID', 'Open Journal Systems'),
('themePluginPath', '', 'default'),
('title', 'en_US', 'JURNAL ONLINE SARIPUTRA INDONESIA TOMOHON ');

-- --------------------------------------------------------

--
-- Table structure for table `stage_assignments`
--

CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint(6) NOT NULL DEFAULT 0,
  `can_change_metadata` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `static_pages`
--

CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `static_page_settings`
--

CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subeditor_submission_group`
--

CREATE TABLE `subeditor_submission_group` (
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT 1,
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `submission_progress` smallint(6) NOT NULL DEFAULT 1,
  `work_type` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_comments`
--

CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_files`
--

CREATE TABLE `submission_files` (
  `submission_file_id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `source_submission_file_id` bigint(20) DEFAULT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_file_revisions`
--

CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint(20) UNSIGNED NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_file_settings`
--

CREATE TABLE `submission_file_settings` (
  `submission_file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_keyword_list`
--

CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL,
  `keyword_text` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_objects`
--

CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint(20) DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_object_keywords`
--

CREATE TABLE `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL COMMENT 'Word position of the keyword in the object.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_settings`
--

CREATE TABLE `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_tombstones`
--

CREATE TABLE `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_types`
--

CREATE TABLE `subscription_types` (
  `type_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` smallint(6) NOT NULL DEFAULT 0,
  `membership` smallint(6) NOT NULL DEFAULT 0,
  `disable_public_display` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_type_settings`
--

CREATE TABLE `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temporary_files`
--

CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `temporary_files`
--

INSERT INTO `temporary_files` (`file_id`, `user_id`, `file_name`, `file_type`, `file_size`, `original_file_name`, `date_uploaded`) VALUES
(7, 1, 'jpe881D.tmp', 'image/jpeg', 84004, 'VB Sosialisasi Banpem RPL 2023.jpeg', '2023-04-18 07:18:46');

-- --------------------------------------------------------

--
-- Table structure for table `usage_stats_temporary_records`
--

CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT 1,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT 0,
  `disabled_reason` text DEFAULT NULL,
  `inline_help` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `url`, `phone`, `mailing_address`, `billing_address`, `country`, `locales`, `gossip`, `date_last_email`, `date_registered`, `date_validated`, `date_last_login`, `must_change_password`, `auth_id`, `auth_str`, `disabled`, `disabled_reason`, `inline_help`) VALUES
(1, 'adminjurnal', '$2y$10$gRH4xYxKqlcFsOi.NC8ci.lwG59d4lxs5AVA7In6xjmTY1hfLQAn.', 'admin@unsrittomohon.ac.id', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2023-04-18 05:24:06', NULL, '2023-04-24 03:34:53', 0, NULL, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 1,
  `permit_self_registration` smallint(6) NOT NULL DEFAULT 0,
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`user_group_id`, `context_id`, `role_id`, `is_default`, `show_title`, `permit_self_registration`, `permit_metadata_edit`) VALUES
(1, 0, 1, 1, 0, 0, 0),
(2, 1, 16, 1, 0, 0, 1),
(3, 1, 16, 1, 0, 0, 1),
(4, 1, 16, 1, 0, 0, 1),
(5, 1, 17, 1, 0, 0, 1),
(6, 1, 17, 1, 0, 0, 0),
(7, 1, 4097, 1, 0, 0, 0),
(8, 1, 4097, 1, 0, 0, 0),
(9, 1, 4097, 1, 0, 0, 0),
(10, 1, 4097, 1, 0, 0, 0),
(11, 1, 4097, 1, 0, 0, 0),
(12, 1, 4097, 1, 0, 0, 0),
(13, 1, 4097, 1, 0, 0, 0),
(14, 1, 65536, 1, 0, 1, 0),
(15, 1, 65536, 1, 0, 0, 0),
(16, 1, 4096, 1, 0, 1, 0),
(17, 1, 1048576, 1, 0, 1, 0),
(18, 1, 2097152, 1, 0, 0, 0),
(19, 2, 16, 1, 0, 0, 1),
(20, 2, 16, 1, 0, 0, 1),
(21, 2, 16, 1, 0, 0, 1),
(22, 2, 17, 1, 0, 0, 1),
(23, 2, 17, 1, 0, 0, 0),
(24, 2, 4097, 1, 0, 0, 0),
(25, 2, 4097, 1, 0, 0, 0),
(26, 2, 4097, 1, 0, 0, 0),
(27, 2, 4097, 1, 0, 0, 0),
(28, 2, 4097, 1, 0, 0, 0),
(29, 2, 4097, 1, 0, 0, 0),
(30, 2, 4097, 1, 0, 0, 0),
(31, 2, 65536, 1, 0, 1, 0),
(32, 2, 65536, 1, 0, 0, 0),
(33, 2, 4096, 1, 0, 1, 0),
(34, 2, 1048576, 1, 0, 1, 0),
(35, 2, 2097152, 1, 0, 0, 0),
(36, 3, 16, 1, 0, 0, 1),
(37, 3, 16, 1, 0, 0, 1),
(38, 3, 16, 1, 0, 0, 1),
(39, 3, 17, 1, 0, 0, 1),
(40, 3, 17, 1, 0, 0, 0),
(41, 3, 4097, 1, 0, 0, 0),
(42, 3, 4097, 1, 0, 0, 0),
(43, 3, 4097, 1, 0, 0, 0),
(44, 3, 4097, 1, 0, 0, 0),
(45, 3, 4097, 1, 0, 0, 0),
(46, 3, 4097, 1, 0, 0, 0),
(47, 3, 4097, 1, 0, 0, 0),
(48, 3, 65536, 1, 0, 1, 0),
(49, 3, 65536, 1, 0, 0, 0),
(50, 3, 4096, 1, 0, 1, 0),
(51, 3, 1048576, 1, 0, 1, 0),
(52, 3, 2097152, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_settings`
--

CREATE TABLE `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_settings`
--

INSERT INTO `user_group_settings` (`user_group_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Site Admin', 'string'),
(1, 'id_ID', 'name', '##default.groups.name.siteAdmin##', 'string'),
(2, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
(2, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
(2, 'en_US', 'abbrev', 'JM', 'string'),
(2, 'en_US', 'name', 'Journal manager', 'string'),
(2, 'id_ID', 'abbrev', 'JM', 'string'),
(2, 'id_ID', 'name', 'Manajer Jurnal', 'string'),
(3, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
(3, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
(3, 'en_US', 'abbrev', 'JE', 'string'),
(3, 'en_US', 'name', 'Journal editor', 'string'),
(3, 'id_ID', 'abbrev', 'JE', 'string'),
(3, 'id_ID', 'name', 'Editor Jurnal', 'string'),
(4, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
(4, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
(4, 'en_US', 'abbrev', 'ProdE', 'string'),
(4, 'en_US', 'name', 'Production editor', 'string'),
(4, 'id_ID', 'abbrev', 'ProdE', 'string'),
(4, 'id_ID', 'name', 'Editor produksi', 'string'),
(5, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
(5, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
(5, 'en_US', 'abbrev', 'SecE', 'string'),
(5, 'en_US', 'name', 'Section editor', 'string'),
(5, 'id_ID', 'abbrev', 'EdBag', 'string'),
(5, 'id_ID', 'name', 'Editor Bagian', 'string'),
(6, '', 'abbrevLocaleKey', 'default.groups.abbrev.guestEditor', 'string'),
(6, '', 'nameLocaleKey', 'default.groups.name.guestEditor', 'string'),
(6, 'en_US', 'abbrev', 'GE', 'string'),
(6, 'en_US', 'name', 'Guest editor', 'string'),
(6, 'id_ID', 'abbrev', 'GE', 'string'),
(6, 'id_ID', 'name', 'Editor Tamu', 'string'),
(7, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
(7, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
(7, 'en_US', 'abbrev', 'CE', 'string'),
(7, 'en_US', 'name', 'Copyeditor', 'string'),
(7, 'id_ID', 'abbrev', 'CE', 'string'),
(7, 'id_ID', 'name', 'Copyeditor', 'string'),
(8, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
(8, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
(8, 'en_US', 'abbrev', 'Design', 'string'),
(8, 'en_US', 'name', 'Designer', 'string'),
(8, 'id_ID', 'abbrev', 'Desain', 'string'),
(8, 'id_ID', 'name', 'Desainer', 'string'),
(9, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
(9, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
(9, 'en_US', 'abbrev', 'FC', 'string'),
(9, 'en_US', 'name', 'Funding coordinator', 'string'),
(9, 'id_ID', 'abbrev', 'FC', 'string'),
(9, 'id_ID', 'name', 'Koordinator pendanaan', 'string'),
(10, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
(10, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
(10, 'en_US', 'abbrev', 'IND', 'string'),
(10, 'en_US', 'name', 'Indexer', 'string'),
(10, 'id_ID', 'abbrev', 'IND', 'string'),
(10, 'id_ID', 'name', 'Pengindeks', 'string'),
(11, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
(11, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
(11, 'en_US', 'abbrev', 'LE', 'string'),
(11, 'en_US', 'name', 'Layout Editor', 'string'),
(11, 'id_ID', 'abbrev', 'LE', 'string'),
(11, 'id_ID', 'name', 'Editor Tata Letak', 'string'),
(12, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
(12, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
(12, 'en_US', 'abbrev', 'MS', 'string'),
(12, 'en_US', 'name', 'Marketing and sales coordinator', 'string'),
(12, 'id_ID', 'abbrev', 'MS', 'string'),
(12, 'id_ID', 'name', 'Koordinator penjualan dan pemasaran', 'string'),
(13, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
(13, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
(13, 'en_US', 'abbrev', 'PR', 'string'),
(13, 'en_US', 'name', 'Proofreader', 'string'),
(13, 'id_ID', 'abbrev', 'PR', 'string'),
(13, 'id_ID', 'name', 'Proofreader', 'string'),
(14, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
(14, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
(14, 'en_US', 'abbrev', 'AU', 'string'),
(14, 'en_US', 'name', 'Author', 'string'),
(14, 'id_ID', 'abbrev', 'AU', 'string'),
(14, 'id_ID', 'name', 'Penulis', 'string'),
(15, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
(15, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
(15, 'en_US', 'abbrev', 'Trans', 'string'),
(15, 'en_US', 'name', 'Translator', 'string'),
(15, 'id_ID', 'abbrev', 'Trans', 'string'),
(15, 'id_ID', 'name', 'Penerjemah', 'string'),
(16, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
(16, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
(16, 'en_US', 'abbrev', 'R', 'string'),
(16, 'en_US', 'name', 'Reviewer', 'string'),
(16, 'id_ID', 'abbrev', 'R', 'string'),
(16, 'id_ID', 'name', 'Mitra Bestari', 'string'),
(17, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
(17, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
(17, 'en_US', 'abbrev', 'Read', 'string'),
(17, 'en_US', 'name', 'Reader', 'string'),
(17, 'id_ID', 'abbrev', 'Baca', 'string'),
(17, 'id_ID', 'name', 'Pembaca', 'string'),
(18, '', 'abbrevLocaleKey', 'default.groups.abbrev.subscriptionManager', 'string'),
(18, '', 'nameLocaleKey', 'default.groups.name.subscriptionManager', 'string'),
(18, 'en_US', 'abbrev', 'SubM', 'string'),
(18, 'en_US', 'name', 'Subscription Manager', 'string'),
(18, 'id_ID', 'abbrev', 'MReg', 'string'),
(18, 'id_ID', 'name', 'Manajer Langganan', 'string'),
(19, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
(19, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
(19, 'en_US', 'abbrev', 'JM', 'string'),
(19, 'en_US', 'name', 'Journal manager', 'string'),
(19, 'id_ID', 'abbrev', 'JM', 'string'),
(19, 'id_ID', 'name', 'Manajer Jurnal', 'string'),
(20, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
(20, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
(20, 'en_US', 'abbrev', 'JE', 'string'),
(20, 'en_US', 'name', 'Journal editor', 'string'),
(20, 'id_ID', 'abbrev', 'JE', 'string'),
(20, 'id_ID', 'name', 'Editor Jurnal', 'string'),
(21, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
(21, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
(21, 'en_US', 'abbrev', 'ProdE', 'string'),
(21, 'en_US', 'name', 'Production editor', 'string'),
(21, 'id_ID', 'abbrev', 'ProdE', 'string'),
(21, 'id_ID', 'name', 'Editor produksi', 'string'),
(22, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
(22, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
(22, 'en_US', 'abbrev', 'SecE', 'string'),
(22, 'en_US', 'name', 'Section editor', 'string'),
(22, 'id_ID', 'abbrev', 'EdBag', 'string'),
(22, 'id_ID', 'name', 'Editor Bagian', 'string'),
(23, '', 'abbrevLocaleKey', 'default.groups.abbrev.guestEditor', 'string'),
(23, '', 'nameLocaleKey', 'default.groups.name.guestEditor', 'string'),
(23, 'en_US', 'abbrev', 'GE', 'string'),
(23, 'en_US', 'name', 'Guest editor', 'string'),
(23, 'id_ID', 'abbrev', 'GE', 'string'),
(23, 'id_ID', 'name', 'Editor Tamu', 'string'),
(24, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
(24, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
(24, 'en_US', 'abbrev', 'CE', 'string'),
(24, 'en_US', 'name', 'Copyeditor', 'string'),
(24, 'id_ID', 'abbrev', 'CE', 'string'),
(24, 'id_ID', 'name', 'Copyeditor', 'string'),
(25, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
(25, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
(25, 'en_US', 'abbrev', 'Design', 'string'),
(25, 'en_US', 'name', 'Designer', 'string'),
(25, 'id_ID', 'abbrev', 'Desain', 'string'),
(25, 'id_ID', 'name', 'Desainer', 'string'),
(26, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
(26, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
(26, 'en_US', 'abbrev', 'FC', 'string'),
(26, 'en_US', 'name', 'Funding coordinator', 'string'),
(26, 'id_ID', 'abbrev', 'FC', 'string'),
(26, 'id_ID', 'name', 'Koordinator pendanaan', 'string'),
(27, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
(27, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
(27, 'en_US', 'abbrev', 'IND', 'string'),
(27, 'en_US', 'name', 'Indexer', 'string'),
(27, 'id_ID', 'abbrev', 'IND', 'string'),
(27, 'id_ID', 'name', 'Pengindeks', 'string'),
(28, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
(28, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
(28, 'en_US', 'abbrev', 'LE', 'string'),
(28, 'en_US', 'name', 'Layout Editor', 'string'),
(28, 'id_ID', 'abbrev', 'LE', 'string'),
(28, 'id_ID', 'name', 'Editor Tata Letak', 'string'),
(29, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
(29, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
(29, 'en_US', 'abbrev', 'MS', 'string'),
(29, 'en_US', 'name', 'Marketing and sales coordinator', 'string'),
(29, 'id_ID', 'abbrev', 'MS', 'string'),
(29, 'id_ID', 'name', 'Koordinator penjualan dan pemasaran', 'string'),
(30, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
(30, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
(30, 'en_US', 'abbrev', 'PR', 'string'),
(30, 'en_US', 'name', 'Proofreader', 'string'),
(30, 'id_ID', 'abbrev', 'PR', 'string'),
(30, 'id_ID', 'name', 'Proofreader', 'string'),
(31, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
(31, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
(31, 'en_US', 'abbrev', 'AU', 'string'),
(31, 'en_US', 'name', 'Author', 'string'),
(31, 'id_ID', 'abbrev', 'AU', 'string'),
(31, 'id_ID', 'name', 'Penulis', 'string'),
(32, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
(32, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
(32, 'en_US', 'abbrev', 'Trans', 'string'),
(32, 'en_US', 'name', 'Translator', 'string'),
(32, 'id_ID', 'abbrev', 'Trans', 'string'),
(32, 'id_ID', 'name', 'Penerjemah', 'string'),
(33, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
(33, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
(33, 'en_US', 'abbrev', 'R', 'string'),
(33, 'en_US', 'name', 'Reviewer', 'string'),
(33, 'id_ID', 'abbrev', 'R', 'string'),
(33, 'id_ID', 'name', 'Mitra Bestari', 'string'),
(34, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
(34, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
(34, 'en_US', 'abbrev', 'Read', 'string'),
(34, 'en_US', 'name', 'Reader', 'string'),
(34, 'id_ID', 'abbrev', 'Baca', 'string'),
(34, 'id_ID', 'name', 'Pembaca', 'string'),
(35, '', 'abbrevLocaleKey', 'default.groups.abbrev.subscriptionManager', 'string'),
(35, '', 'nameLocaleKey', 'default.groups.name.subscriptionManager', 'string'),
(35, 'en_US', 'abbrev', 'SubM', 'string'),
(35, 'en_US', 'name', 'Subscription Manager', 'string'),
(35, 'id_ID', 'abbrev', 'MReg', 'string'),
(35, 'id_ID', 'name', 'Manajer Langganan', 'string'),
(36, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
(36, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
(36, 'en_US', 'abbrev', 'JM', 'string'),
(36, 'en_US', 'name', 'Journal manager', 'string'),
(36, 'id_ID', 'abbrev', 'JM', 'string'),
(36, 'id_ID', 'name', 'Manajer Jurnal', 'string'),
(37, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
(37, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
(37, 'en_US', 'abbrev', 'JE', 'string'),
(37, 'en_US', 'name', 'Journal editor', 'string'),
(37, 'id_ID', 'abbrev', 'JE', 'string'),
(37, 'id_ID', 'name', 'Editor Jurnal', 'string'),
(38, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
(38, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
(38, 'en_US', 'abbrev', 'ProdE', 'string'),
(38, 'en_US', 'name', 'Production editor', 'string'),
(38, 'id_ID', 'abbrev', 'ProdE', 'string'),
(38, 'id_ID', 'name', 'Editor produksi', 'string'),
(39, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
(39, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
(39, 'en_US', 'abbrev', 'SecE', 'string'),
(39, 'en_US', 'name', 'Section editor', 'string'),
(39, 'id_ID', 'abbrev', 'EdBag', 'string'),
(39, 'id_ID', 'name', 'Editor Bagian', 'string'),
(40, '', 'abbrevLocaleKey', 'default.groups.abbrev.guestEditor', 'string'),
(40, '', 'nameLocaleKey', 'default.groups.name.guestEditor', 'string'),
(40, 'en_US', 'abbrev', 'GE', 'string'),
(40, 'en_US', 'name', 'Guest editor', 'string'),
(40, 'id_ID', 'abbrev', 'GE', 'string'),
(40, 'id_ID', 'name', 'Editor Tamu', 'string'),
(41, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
(41, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
(41, 'en_US', 'abbrev', 'CE', 'string'),
(41, 'en_US', 'name', 'Copyeditor', 'string'),
(41, 'id_ID', 'abbrev', 'CE', 'string'),
(41, 'id_ID', 'name', 'Copyeditor', 'string'),
(42, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
(42, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
(42, 'en_US', 'abbrev', 'Design', 'string'),
(42, 'en_US', 'name', 'Designer', 'string'),
(42, 'id_ID', 'abbrev', 'Desain', 'string'),
(42, 'id_ID', 'name', 'Desainer', 'string'),
(43, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
(43, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
(43, 'en_US', 'abbrev', 'FC', 'string'),
(43, 'en_US', 'name', 'Funding coordinator', 'string'),
(43, 'id_ID', 'abbrev', 'FC', 'string'),
(43, 'id_ID', 'name', 'Koordinator pendanaan', 'string'),
(44, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
(44, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
(44, 'en_US', 'abbrev', 'IND', 'string'),
(44, 'en_US', 'name', 'Indexer', 'string'),
(44, 'id_ID', 'abbrev', 'IND', 'string'),
(44, 'id_ID', 'name', 'Pengindeks', 'string'),
(45, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
(45, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
(45, 'en_US', 'abbrev', 'LE', 'string'),
(45, 'en_US', 'name', 'Layout Editor', 'string'),
(45, 'id_ID', 'abbrev', 'LE', 'string'),
(45, 'id_ID', 'name', 'Editor Tata Letak', 'string'),
(46, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
(46, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
(46, 'en_US', 'abbrev', 'MS', 'string'),
(46, 'en_US', 'name', 'Marketing and sales coordinator', 'string'),
(46, 'id_ID', 'abbrev', 'MS', 'string'),
(46, 'id_ID', 'name', 'Koordinator penjualan dan pemasaran', 'string'),
(47, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
(47, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
(47, 'en_US', 'abbrev', 'PR', 'string'),
(47, 'en_US', 'name', 'Proofreader', 'string'),
(47, 'id_ID', 'abbrev', 'PR', 'string'),
(47, 'id_ID', 'name', 'Proofreader', 'string'),
(48, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
(48, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
(48, 'en_US', 'abbrev', 'AU', 'string'),
(48, 'en_US', 'name', 'Author', 'string'),
(48, 'id_ID', 'abbrev', 'AU', 'string'),
(48, 'id_ID', 'name', 'Penulis', 'string'),
(49, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
(49, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
(49, 'en_US', 'abbrev', 'Trans', 'string'),
(49, 'en_US', 'name', 'Translator', 'string'),
(49, 'id_ID', 'abbrev', 'Trans', 'string'),
(49, 'id_ID', 'name', 'Penerjemah', 'string'),
(50, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
(50, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
(50, 'en_US', 'abbrev', 'R', 'string'),
(50, 'en_US', 'name', 'Reviewer', 'string'),
(50, 'id_ID', 'abbrev', 'R', 'string'),
(50, 'id_ID', 'name', 'Mitra Bestari', 'string'),
(51, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
(51, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
(51, 'en_US', 'abbrev', 'Read', 'string'),
(51, 'en_US', 'name', 'Reader', 'string'),
(51, 'id_ID', 'abbrev', 'Baca', 'string'),
(51, 'id_ID', 'name', 'Pembaca', 'string'),
(52, '', 'abbrevLocaleKey', 'default.groups.abbrev.subscriptionManager', 'string'),
(52, '', 'nameLocaleKey', 'default.groups.name.subscriptionManager', 'string'),
(52, 'en_US', 'abbrev', 'SubM', 'string'),
(52, 'en_US', 'name', 'Subscription Manager', 'string'),
(52, 'id_ID', 'abbrev', 'MReg', 'string'),
(52, 'id_ID', 'name', 'Manajer Langganan', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `user_group_stage`
--

CREATE TABLE `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_stage`
--

INSERT INTO `user_group_stage` (`context_id`, `user_group_id`, `stage_id`) VALUES
(1, 3, 1),
(1, 3, 3),
(1, 3, 4),
(1, 3, 5),
(1, 4, 4),
(1, 4, 5),
(1, 5, 1),
(1, 5, 3),
(1, 5, 4),
(1, 5, 5),
(1, 6, 1),
(1, 6, 3),
(1, 6, 4),
(1, 6, 5),
(1, 7, 4),
(1, 8, 5),
(1, 9, 1),
(1, 9, 3),
(1, 10, 5),
(1, 11, 5),
(1, 12, 4),
(1, 13, 5),
(1, 14, 1),
(1, 14, 3),
(1, 14, 4),
(1, 14, 5),
(1, 15, 1),
(1, 15, 3),
(1, 15, 4),
(1, 15, 5),
(1, 16, 3),
(2, 20, 1),
(2, 20, 3),
(2, 20, 4),
(2, 20, 5),
(2, 21, 4),
(2, 21, 5),
(2, 22, 1),
(2, 22, 3),
(2, 22, 4),
(2, 22, 5),
(2, 23, 1),
(2, 23, 3),
(2, 23, 4),
(2, 23, 5),
(2, 24, 4),
(2, 25, 5),
(2, 26, 1),
(2, 26, 3),
(2, 27, 5),
(2, 28, 5),
(2, 29, 4),
(2, 30, 5),
(2, 31, 1),
(2, 31, 3),
(2, 31, 4),
(2, 31, 5),
(2, 32, 1),
(2, 32, 3),
(2, 32, 4),
(2, 32, 5),
(2, 33, 3),
(3, 37, 1),
(3, 37, 3),
(3, 37, 4),
(3, 37, 5),
(3, 38, 4),
(3, 38, 5),
(3, 39, 1),
(3, 39, 3),
(3, 39, 4),
(3, 39, 5),
(3, 40, 1),
(3, 40, 3),
(3, 40, 4),
(3, 40, 5),
(3, 41, 4),
(3, 42, 5),
(3, 43, 1),
(3, 43, 3),
(3, 44, 5),
(3, 45, 5),
(3, 46, 4),
(3, 47, 5),
(3, 48, 1),
(3, 48, 3),
(3, 48, 4),
(3, 48, 5),
(3, 49, 1),
(3, 49, 3),
(3, 49, 4),
(3, 49, 5),
(3, 50, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`user_id`, `locale`, `setting_name`, `assoc_type`, `assoc_id`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'familyName', 0, 0, 'adminjurnal', 'string'),
(1, 'en_US', 'givenName', 0, 0, 'adminjurnal', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `user_user_groups`
--

CREATE TABLE `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_user_groups`
--

INSERT INTO `user_user_groups` (`user_group_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(19, 1),
(36, 1);

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT 0 COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int(11) NOT NULL DEFAULT 0 COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int(11) NOT NULL DEFAULT 0 COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int(11) NOT NULL DEFAULT 0 COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`major`, `minor`, `revision`, `build`, `date_installed`, `current`, `product_type`, `product`, `product_class_name`, `lazy_load`, `sitewide`) VALUES
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.metadata', 'dc11', '', 0, 0),
(1, 0, 1, 0, '2023-04-18 05:24:06', 1, 'plugins.blocks', 'browse', 'BrowseBlockPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.blocks', 'developedBy', 'DevelopedByBlockPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.blocks', 'information', 'InformationBlockPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.blocks', 'languageToggle', 'LanguageToggleBlockPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.blocks', 'makeSubmission', 'MakeSubmissionBlockPlugin', 1, 0),
(1, 1, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.blocks', 'subscription', 'SubscriptionBlockPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.gateways', 'resolver', '', 0, 0),
(1, 2, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'acron', 'AcronPlugin', 1, 1),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'announcementFeed', 'AnnouncementFeedPlugin', 1, 0),
(0, 1, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'citationStyleLanguage', 'CitationStyleLanguagePlugin', 1, 0),
(1, 2, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'customBlockManager', 'CustomBlockManagerPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'driver', 'DRIVERPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'dublinCoreMeta', 'DublinCoreMetaPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'googleAnalytics', 'GoogleAnalyticsPlugin', 1, 0),
(1, 1, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'googleScholar', 'GoogleScholarPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'htmlArticleGalley', 'HtmlArticleGalleyPlugin', 1, 0),
(1, 0, 1, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'lensGalley', 'LensGalleyPlugin', 1, 0),
(1, 1, 3, 4, '2023-04-18 05:24:06', 1, 'plugins.generic', 'orcidProfile', 'OrcidProfilePlugin', 1, 0),
(1, 0, 1, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'pdfJsViewer', 'PdfJsViewerPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'recommendByAuthor', 'RecommendByAuthorPlugin', 1, 1),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'recommendBySimilarity', 'RecommendBySimilarityPlugin', 1, 1),
(1, 2, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'staticPages', 'StaticPagesPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'tinymce', 'TinyMCEPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'usageEvent', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'usageStats', 'UsageStatsPlugin', 0, 1),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.generic', 'webFeed', 'WebFeedPlugin', 1, 0),
(2, 1, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.importexport', 'crossref', '', 0, 0),
(2, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.importexport', 'datacite', '', 0, 0),
(1, 1, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.importexport', 'doaj', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.importexport', 'native', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.importexport', 'pubmed', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.importexport', 'users', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.oaiMetadataFormats', 'dc', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.oaiMetadataFormats', 'marc', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.oaiMetadataFormats', 'marcxml', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.oaiMetadataFormats', 'rfc1807', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.paymethod', 'manual', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.paymethod', 'paypal', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.pubIds', 'doi', 'DOIPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.pubIds', 'urn', 'URNPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.reports', 'articles', '', 0, 0),
(1, 1, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.reports', 'counterReport', '', 0, 0),
(2, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.reports', 'reviewReport', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.reports', 'subscriptions', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.reports', 'views', '', 0, 0),
(1, 0, 0, 0, '2023-04-18 05:24:06', 1, 'plugins.themes', 'default', 'DefaultThemePlugin', 1, 0),
(3, 3, 0, 14, '2023-04-18 05:24:02', 1, 'core', 'ojs2', '', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_keys`
--
ALTER TABLE `access_keys`
  ADD PRIMARY KEY (`access_key_id`),
  ADD KEY `access_keys_hash` (`key_hash`,`user_id`,`context`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `announcements_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `announcement_settings`
--
ALTER TABLE `announcement_settings`
  ADD UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  ADD KEY `announcement_settings_announcement_id` (`announcement_id`);

--
-- Indexes for table `announcement_types`
--
ALTER TABLE `announcement_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `announcement_type_settings`
--
ALTER TABLE `announcement_type_settings`
  ADD UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  ADD KEY `announcement_type_settings_type_id` (`type_id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `authors_publication_id` (`publication_id`);

--
-- Indexes for table `author_settings`
--
ALTER TABLE `author_settings`
  ADD UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  ADD KEY `author_settings_author_id` (`author_id`);

--
-- Indexes for table `auth_sources`
--
ALTER TABLE `auth_sources`
  ADD PRIMARY KEY (`auth_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_path` (`context_id`,`path`),
  ADD KEY `category_context_id` (`context_id`,`parent_id`);

--
-- Indexes for table `category_settings`
--
ALTER TABLE `category_settings`
  ADD UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`);

--
-- Indexes for table `citations`
--
ALTER TABLE `citations`
  ADD PRIMARY KEY (`citation_id`),
  ADD UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  ADD KEY `citations_publication` (`publication_id`);

--
-- Indexes for table `citation_settings`
--
ALTER TABLE `citation_settings`
  ADD UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  ADD KEY `citation_settings_citation_id` (`citation_id`);

--
-- Indexes for table `completed_payments`
--
ALTER TABLE `completed_payments`
  ADD PRIMARY KEY (`completed_payment_id`);

--
-- Indexes for table `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  ADD PRIMARY KEY (`controlled_vocab_id`),
  ADD UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`);

--
-- Indexes for table `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  ADD PRIMARY KEY (`controlled_vocab_entry_id`),
  ADD KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`);

--
-- Indexes for table `controlled_vocab_entry_settings`
--
ALTER TABLE `controlled_vocab_entry_settings`
  ADD UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  ADD KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`);

--
-- Indexes for table `custom_issue_orders`
--
ALTER TABLE `custom_issue_orders`
  ADD UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`);

--
-- Indexes for table `custom_section_orders`
--
ALTER TABLE `custom_section_orders`
  ADD UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`);

--
-- Indexes for table `data_object_tombstones`
--
ALTER TABLE `data_object_tombstones`
  ADD PRIMARY KEY (`tombstone_id`),
  ADD KEY `data_object_tombstones_data_object_id` (`data_object_id`);

--
-- Indexes for table `data_object_tombstone_oai_set_objects`
--
ALTER TABLE `data_object_tombstone_oai_set_objects`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`);

--
-- Indexes for table `data_object_tombstone_settings`
--
ALTER TABLE `data_object_tombstone_settings`
  ADD UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  ADD KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`);

--
-- Indexes for table `edit_decisions`
--
ALTER TABLE `edit_decisions`
  ADD PRIMARY KEY (`edit_decision_id`),
  ADD KEY `edit_decisions_submission_id` (`submission_id`),
  ADD KEY `edit_decisions_editor_id` (`editor_id`);

--
-- Indexes for table `email_log`
--
ALTER TABLE `email_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `email_log_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `email_log_users`
--
ALTER TABLE `email_log_users`
  ADD UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`);

--
-- Indexes for table `email_templates_default`
--
ALTER TABLE `email_templates_default`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `email_templates_default_email_key` (`email_key`);

--
-- Indexes for table `email_templates_default_data`
--
ALTER TABLE `email_templates_default_data`
  ADD UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`);

--
-- Indexes for table `email_templates_settings`
--
ALTER TABLE `email_templates_settings`
  ADD UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  ADD KEY `email_settings_email_id` (`email_id`);

--
-- Indexes for table `event_log`
--
ALTER TABLE `event_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `event_log_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `event_log_settings`
--
ALTER TABLE `event_log_settings`
  ADD UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  ADD KEY `event_log_settings_log_id` (`log_id`),
  ADD KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `filter_groups`
--
ALTER TABLE `filter_groups`
  ADD PRIMARY KEY (`filter_group_id`),
  ADD UNIQUE KEY `filter_groups_symbolic` (`symbolic`);

--
-- Indexes for table `filter_settings`
--
ALTER TABLE `filter_settings`
  ADD UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  ADD KEY `filter_settings_id` (`filter_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `genre_settings`
--
ALTER TABLE `genre_settings`
  ADD UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  ADD KEY `genre_settings_genre_id` (`genre_id`);

--
-- Indexes for table `institutional_subscriptions`
--
ALTER TABLE `institutional_subscriptions`
  ADD PRIMARY KEY (`institutional_subscription_id`),
  ADD KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  ADD KEY `institutional_subscriptions_domain` (`domain`);

--
-- Indexes for table `institutional_subscription_ip`
--
ALTER TABLE `institutional_subscription_ip`
  ADD PRIMARY KEY (`institutional_subscription_ip_id`),
  ADD KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  ADD KEY `institutional_subscription_ip_start` (`ip_start`),
  ADD KEY `institutional_subscription_ip_end` (`ip_end`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `issues_journal_id` (`journal_id`),
  ADD KEY `issues_url_path` (`url_path`);

--
-- Indexes for table `issue_files`
--
ALTER TABLE `issue_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `issue_files_issue_id` (`issue_id`);

--
-- Indexes for table `issue_galleys`
--
ALTER TABLE `issue_galleys`
  ADD PRIMARY KEY (`galley_id`),
  ADD KEY `issue_galleys_issue_id` (`issue_id`),
  ADD KEY `issue_galleys_url_path` (`url_path`);

--
-- Indexes for table `issue_galley_settings`
--
ALTER TABLE `issue_galley_settings`
  ADD UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  ADD KEY `issue_galley_settings_galley_id` (`galley_id`);

--
-- Indexes for table `issue_settings`
--
ALTER TABLE `issue_settings`
  ADD UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  ADD KEY `issue_settings_issue_id` (`issue_id`),
  ADD KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indexes for table `item_views`
--
ALTER TABLE `item_views`
  ADD UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`journal_id`),
  ADD UNIQUE KEY `journals_path` (`path`);

--
-- Indexes for table `journal_settings`
--
ALTER TABLE `journal_settings`
  ADD UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  ADD KEY `journal_settings_journal_id` (`journal_id`);

--
-- Indexes for table `library_files`
--
ALTER TABLE `library_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `library_files_context_id` (`context_id`),
  ADD KEY `library_files_submission_id` (`submission_id`);

--
-- Indexes for table `library_file_settings`
--
ALTER TABLE `library_file_settings`
  ADD UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  ADD KEY `library_file_settings_id` (`file_id`);

--
-- Indexes for table `metadata_descriptions`
--
ALTER TABLE `metadata_descriptions`
  ADD PRIMARY KEY (`metadata_description_id`),
  ADD KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `metadata_description_settings`
--
ALTER TABLE `metadata_description_settings`
  ADD UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  ADD KEY `metadata_description_settings_id` (`metadata_description_id`);

--
-- Indexes for table `metrics`
--
ALTER TABLE `metrics`
  ADD KEY `metrics_load_id` (`load_id`),
  ADD KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  ADD KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  ADD KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`);

--
-- Indexes for table `navigation_menus`
--
ALTER TABLE `navigation_menus`
  ADD PRIMARY KEY (`navigation_menu_id`);

--
-- Indexes for table `navigation_menu_items`
--
ALTER TABLE `navigation_menu_items`
  ADD PRIMARY KEY (`navigation_menu_item_id`);

--
-- Indexes for table `navigation_menu_item_assignments`
--
ALTER TABLE `navigation_menu_item_assignments`
  ADD PRIMARY KEY (`navigation_menu_item_assignment_id`);

--
-- Indexes for table `navigation_menu_item_assignment_settings`
--
ALTER TABLE `navigation_menu_item_assignment_settings`
  ADD UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  ADD KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`);

--
-- Indexes for table `navigation_menu_item_settings`
--
ALTER TABLE `navigation_menu_item_settings`
  ADD UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  ADD KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `notes_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  ADD KEY `notifications_context_id` (`context_id`,`level`),
  ADD KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  ADD KEY `notifications_user_id_level` (`user_id`,`level`);

--
-- Indexes for table `notification_mail_list`
--
ALTER TABLE `notification_mail_list`
  ADD PRIMARY KEY (`notification_mail_list_id`),
  ADD UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`);

--
-- Indexes for table `notification_subscription_settings`
--
ALTER TABLE `notification_subscription_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `oai_resumption_tokens`
--
ALTER TABLE `oai_resumption_tokens`
  ADD UNIQUE KEY `oai_resumption_tokens_pkey` (`token`);

--
-- Indexes for table `plugin_settings`
--
ALTER TABLE `plugin_settings`
  ADD UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  ADD KEY `plugin_settings_plugin_name` (`plugin_name`);

--
-- Indexes for table `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`publication_id`),
  ADD KEY `publications_submission_id` (`submission_id`),
  ADD KEY `publications_section_id` (`section_id`),
  ADD KEY `publications_url_path` (`url_path`);

--
-- Indexes for table `publication_categories`
--
ALTER TABLE `publication_categories`
  ADD UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`);

--
-- Indexes for table `publication_galleys`
--
ALTER TABLE `publication_galleys`
  ADD PRIMARY KEY (`galley_id`),
  ADD KEY `publication_galleys_publication_id` (`publication_id`),
  ADD KEY `publication_galleys_url_path` (`url_path`),
  ADD KEY `publication_galleys_submission_file_id_foreign` (`submission_file_id`);

--
-- Indexes for table `publication_galley_settings`
--
ALTER TABLE `publication_galley_settings`
  ADD UNIQUE KEY `publication_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  ADD KEY `publication_galley_settings_galley_id` (`galley_id`),
  ADD KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indexes for table `publication_settings`
--
ALTER TABLE `publication_settings`
  ADD UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  ADD KEY `publication_settings_publication_id` (`publication_id`),
  ADD KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`query_id`),
  ADD KEY `queries_assoc_id` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `query_participants`
--
ALTER TABLE `query_participants`
  ADD UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`);

--
-- Indexes for table `queued_payments`
--
ALTER TABLE `queued_payments`
  ADD PRIMARY KEY (`queued_payment_id`);

--
-- Indexes for table `review_assignments`
--
ALTER TABLE `review_assignments`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_assignments_submission_id` (`submission_id`),
  ADD KEY `review_assignments_reviewer_id` (`reviewer_id`),
  ADD KEY `review_assignments_form_id` (`review_form_id`),
  ADD KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`);

--
-- Indexes for table `review_files`
--
ALTER TABLE `review_files`
  ADD UNIQUE KEY `review_files_pkey` (`review_id`,`submission_file_id`),
  ADD KEY `review_files_review_id` (`review_id`),
  ADD KEY `review_files_submission_file_id_foreign` (`submission_file_id`);

--
-- Indexes for table `review_forms`
--
ALTER TABLE `review_forms`
  ADD PRIMARY KEY (`review_form_id`);

--
-- Indexes for table `review_form_elements`
--
ALTER TABLE `review_form_elements`
  ADD PRIMARY KEY (`review_form_element_id`),
  ADD KEY `review_form_elements_review_form_id` (`review_form_id`);

--
-- Indexes for table `review_form_element_settings`
--
ALTER TABLE `review_form_element_settings`
  ADD UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  ADD KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`);

--
-- Indexes for table `review_form_responses`
--
ALTER TABLE `review_form_responses`
  ADD KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`);

--
-- Indexes for table `review_form_settings`
--
ALTER TABLE `review_form_settings`
  ADD UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  ADD KEY `review_form_settings_review_form_id` (`review_form_id`);

--
-- Indexes for table `review_rounds`
--
ALTER TABLE `review_rounds`
  ADD PRIMARY KEY (`review_round_id`),
  ADD UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  ADD KEY `review_rounds_submission_id` (`submission_id`);

--
-- Indexes for table `review_round_files`
--
ALTER TABLE `review_round_files`
  ADD UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`submission_file_id`),
  ADD KEY `review_round_files_submission_id` (`submission_id`),
  ADD KEY `review_round_files_submission_file_id_foreign` (`submission_file_id`);

--
-- Indexes for table `scheduled_tasks`
--
ALTER TABLE `scheduled_tasks`
  ADD UNIQUE KEY `scheduled_tasks_pkey` (`class_name`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `sections_journal_id` (`journal_id`);

--
-- Indexes for table `section_settings`
--
ALTER TABLE `section_settings`
  ADD UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  ADD KEY `section_settings_section_id` (`section_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_pkey` (`session_id`),
  ADD KEY `sessions_user_id` (`user_id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`);

--
-- Indexes for table `stage_assignments`
--
ALTER TABLE `stage_assignments`
  ADD PRIMARY KEY (`stage_assignment_id`),
  ADD UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  ADD KEY `stage_assignments_submission_id` (`submission_id`),
  ADD KEY `stage_assignments_user_group_id` (`user_group_id`),
  ADD KEY `stage_assignments_user_id` (`user_id`);

--
-- Indexes for table `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`static_page_id`);

--
-- Indexes for table `static_page_settings`
--
ALTER TABLE `static_page_settings`
  ADD UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  ADD KEY `static_page_settings_static_page_id` (`static_page_id`);

--
-- Indexes for table `subeditor_submission_group`
--
ALTER TABLE `subeditor_submission_group`
  ADD UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  ADD KEY `section_editors_context_id` (`context_id`),
  ADD KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  ADD KEY `subeditor_submission_group_user_id` (`user_id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `submissions_context_id` (`context_id`),
  ADD KEY `submissions_publication_id` (`current_publication_id`);

--
-- Indexes for table `submission_comments`
--
ALTER TABLE `submission_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `submission_comments_submission_id` (`submission_id`);

--
-- Indexes for table `submission_files`
--
ALTER TABLE `submission_files`
  ADD PRIMARY KEY (`submission_file_id`),
  ADD KEY `submission_files_submission_id` (`submission_id`),
  ADD KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  ADD KEY `submission_files_file_id_foreign` (`file_id`);

--
-- Indexes for table `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  ADD PRIMARY KEY (`revision_id`),
  ADD KEY `submission_file_revisions_submission_file_id_foreign` (`submission_file_id`),
  ADD KEY `submission_file_revisions_file_id_foreign` (`file_id`);

--
-- Indexes for table `submission_file_settings`
--
ALTER TABLE `submission_file_settings`
  ADD UNIQUE KEY `submission_file_settings_pkey` (`submission_file_id`,`locale`,`setting_name`),
  ADD KEY `submission_file_settings_id` (`submission_file_id`);

--
-- Indexes for table `submission_search_keyword_list`
--
ALTER TABLE `submission_search_keyword_list`
  ADD PRIMARY KEY (`keyword_id`),
  ADD UNIQUE KEY `submission_search_keyword_text` (`keyword_text`);

--
-- Indexes for table `submission_search_objects`
--
ALTER TABLE `submission_search_objects`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `submission_search_object_submission` (`submission_id`);

--
-- Indexes for table `submission_search_object_keywords`
--
ALTER TABLE `submission_search_object_keywords`
  ADD UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  ADD KEY `submission_search_object_keywords_keyword_id` (`keyword_id`);

--
-- Indexes for table `submission_settings`
--
ALTER TABLE `submission_settings`
  ADD UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  ADD KEY `submission_settings_submission_id` (`submission_id`);

--
-- Indexes for table `submission_tombstones`
--
ALTER TABLE `submission_tombstones`
  ADD PRIMARY KEY (`tombstone_id`),
  ADD KEY `submission_tombstones_journal_id` (`journal_id`),
  ADD KEY `submission_tombstones_submission_id` (`submission_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indexes for table `subscription_types`
--
ALTER TABLE `subscription_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `subscription_type_settings`
--
ALTER TABLE `subscription_type_settings`
  ADD UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  ADD KEY `subscription_type_settings_type_id` (`type_id`);

--
-- Indexes for table `temporary_files`
--
ALTER TABLE `temporary_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `temporary_files_user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_username` (`username`),
  ADD UNIQUE KEY `users_email` (`email`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`user_group_id`),
  ADD KEY `user_groups_user_group_id` (`user_group_id`),
  ADD KEY `user_groups_context_id` (`context_id`),
  ADD KEY `user_groups_role_id` (`role_id`);

--
-- Indexes for table `user_group_settings`
--
ALTER TABLE `user_group_settings`
  ADD UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`);

--
-- Indexes for table `user_group_stage`
--
ALTER TABLE `user_group_stage`
  ADD UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  ADD KEY `user_group_stage_context_id` (`context_id`),
  ADD KEY `user_group_stage_user_group_id` (`user_group_id`),
  ADD KEY `user_group_stage_stage_id` (`stage_id`);

--
-- Indexes for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  ADD KEY `user_settings_user_id` (`user_id`),
  ADD KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`);

--
-- Indexes for table `user_user_groups`
--
ALTER TABLE `user_user_groups`
  ADD UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  ADD KEY `user_user_groups_user_group_id` (`user_group_id`),
  ADD KEY `user_user_groups_user_id` (`user_id`);

--
-- Indexes for table `versions`
--
ALTER TABLE `versions`
  ADD UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_keys`
--
ALTER TABLE `access_keys`
  MODIFY `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement_types`
--
ALTER TABLE `announcement_types`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_sources`
--
ALTER TABLE `auth_sources`
  MODIFY `auth_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `citations`
--
ALTER TABLE `citations`
  MODIFY `citation_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `completed_payments`
--
ALTER TABLE `completed_payments`
  MODIFY `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  MODIFY `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  MODIFY `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_object_tombstones`
--
ALTER TABLE `data_object_tombstones`
  MODIFY `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_object_tombstone_oai_set_objects`
--
ALTER TABLE `data_object_tombstone_oai_set_objects`
  MODIFY `object_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edit_decisions`
--
ALTER TABLE `edit_decisions`
  MODIFY `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_log`
--
ALTER TABLE `email_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates_default`
--
ALTER TABLE `email_templates_default`
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `event_log`
--
ALTER TABLE `event_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `filter_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `filter_groups`
--
ALTER TABLE `filter_groups`
  MODIFY `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `institutional_subscriptions`
--
ALTER TABLE `institutional_subscriptions`
  MODIFY `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `institutional_subscription_ip`
--
ALTER TABLE `institutional_subscription_ip`
  MODIFY `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `issue_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_files`
--
ALTER TABLE `issue_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_galleys`
--
ALTER TABLE `issue_galleys`
  MODIFY `galley_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `journal_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `library_files`
--
ALTER TABLE `library_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metadata_descriptions`
--
ALTER TABLE `metadata_descriptions`
  MODIFY `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `navigation_menus`
--
ALTER TABLE `navigation_menus`
  MODIFY `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `navigation_menu_items`
--
ALTER TABLE `navigation_menu_items`
  MODIFY `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `navigation_menu_item_assignments`
--
ALTER TABLE `navigation_menu_item_assignments`
  MODIFY `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notification_mail_list`
--
ALTER TABLE `notification_mail_list`
  MODIFY `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_subscription_settings`
--
ALTER TABLE `notification_subscription_settings`
  MODIFY `setting_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publications`
--
ALTER TABLE `publications`
  MODIFY `publication_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publication_galleys`
--
ALTER TABLE `publication_galleys`
  MODIFY `galley_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `query_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queued_payments`
--
ALTER TABLE `queued_payments`
  MODIFY `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_assignments`
--
ALTER TABLE `review_assignments`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_forms`
--
ALTER TABLE `review_forms`
  MODIFY `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_form_elements`
--
ALTER TABLE `review_form_elements`
  MODIFY `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_rounds`
--
ALTER TABLE `review_rounds`
  MODIFY `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stage_assignments`
--
ALTER TABLE `stage_assignments`
  MODIFY `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submission_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_comments`
--
ALTER TABLE `submission_comments`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_files`
--
ALTER TABLE `submission_files`
  MODIFY `submission_file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  MODIFY `revision_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_search_keyword_list`
--
ALTER TABLE `submission_search_keyword_list`
  MODIFY `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_search_objects`
--
ALTER TABLE `submission_search_objects`
  MODIFY `object_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_tombstones`
--
ALTER TABLE `submission_tombstones`
  MODIFY `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_types`
--
ALTER TABLE `subscription_types`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temporary_files`
--
ALTER TABLE `temporary_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `publication_galleys`
--
ALTER TABLE `publication_galleys`
  ADD CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);

--
-- Constraints for table `review_files`
--
ALTER TABLE `review_files`
  ADD CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);

--
-- Constraints for table `review_round_files`
--
ALTER TABLE `review_round_files`
  ADD CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);

--
-- Constraints for table `submission_files`
--
ALTER TABLE `submission_files`
  ADD CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`);

--
-- Constraints for table `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  ADD CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  ADD CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
