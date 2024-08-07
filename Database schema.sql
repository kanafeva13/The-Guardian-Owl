CREATE TABLE `complications` (
  `id` integer PRIMARY KEY,
  `medical_code` varchar(255),
  `name` varchar(255),
  `description` text,
  `severity_level` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `symptoms` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `complication_id` integer,
  `is_common` boolean,
  `created_at` timestamp
);

CREATE TABLE `risk_factors` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `risk_level` varchar(255),
  `complication_id` integer,
  `age_range` varchar(255),
  `medical_condition` varchar(255),
  `lifestyle_factor` varchar(255),
  `criteria` jsonb,
  `created_at` timestamp
);

CREATE TABLE `references` (
  `id` integer PRIMARY KEY,
  `source_name` varchar(255),
  `source_link` varchar(255),
  `complication_id` integer,
  `created_at` timestamp
);

CREATE TABLE `responses` (
  `id` integer PRIMARY KEY,
  `complication_id` integer,
  `risk_assessment_template` text,
  `instruction` text,
  `disclaimer` text,
  `resource_link` varchar(255)
);

ALTER TABLE `symptoms` ADD FOREIGN KEY (`complication_id`) REFERENCES `complications` (`id`);

ALTER TABLE `risk_factors` ADD FOREIGN KEY (`complication_id`) REFERENCES `complications` (`id`);

ALTER TABLE `references` ADD FOREIGN KEY (`complication_id`) REFERENCES `complications` (`id`);

ALTER TABLE `responses` ADD FOREIGN KEY (`complication_id`) REFERENCES `complications` (`id`);
