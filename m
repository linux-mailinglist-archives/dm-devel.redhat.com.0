Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD26C09F3
	for <lists+dm-devel@lfdr.de>; Mon, 20 Mar 2023 06:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679289439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Zx4LcuK34n6TjIdvsLRN/lBn6hOQY69wtOIQWpRSVHw=;
	b=gDa2/GIY2SnTNp6jc87r/oFDyBqCf5Z78O/znM28DoB/bEw9udglHsfIrur3d3CgUNV16Q
	MnvuidQKNeeOBl59YbfVNaekcn1E49WJxtzKoLqMe4OACAOmkJ/P3itG1CMeI7oGPmFa9m
	BWU2oEymvwU0lLcLxKa/N7+xIr/8IPE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-81OCwOuHOB2zcsrQAKg9SQ-1; Mon, 20 Mar 2023 01:17:17 -0400
X-MC-Unique: 81OCwOuHOB2zcsrQAKg9SQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39FBA858297;
	Mon, 20 Mar 2023 05:17:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6734540C6E68;
	Mon, 20 Mar 2023 05:17:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E877619472D2;
	Mon, 20 Mar 2023 05:16:59 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB6581946595
 for <dm-devel@listman.corp.redhat.com>; Sat, 18 Mar 2023 13:17:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9F2E0140E960; Sat, 18 Mar 2023 13:17:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96742140EBF4
 for <dm-devel@redhat.com>; Sat, 18 Mar 2023 13:17:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70BE885A588
 for <dm-devel@redhat.com>; Sat, 18 Mar 2023 13:17:08 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2105.outbound.protection.outlook.com [40.107.117.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-QKF6JpzfN8GDefprSv2snA-1; Sat, 18 Mar 2023 09:16:52 -0400
X-MC-Unique: QKF6JpzfN8GDefprSv2snA-1
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5386.apcprd06.prod.outlook.com (2603:1096:4:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Sat, 18 Mar
 2023 13:16:44 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.036; Sat, 18 Mar 2023
 13:16:44 +0000
From: Yangtao Li <frank.li@vivo.com>
To: agk@redhat.com,
	snitzer@kernel.org
Date: Sat, 18 Mar 2023 21:16:33 +0800
Message-ID: <20230318131633.41573-1-frank.li@vivo.com>
X-ClientProxiedBy: SGBP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::19)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB5386:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4d19cf-3fca-4516-8d19-08db27b304ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: qAqsaE/pbXhUiWvKLRkT5ZHX67rSQyu+Z9YLm+EiAoZoo8Tk2TpnYif1/ZN2sJh7IhBkGD1kir8ZV2vP067BrGg/I8QdoYuRgx28tNY6AoHgrjoGEgwf/8gEN7NgYM24c2U1lsVsKsP/laupkaeRop8pgqMdGDkZG17BrEioj+2xlYZUwSum3sx7aqvUl2YpeMYSdpXQTBuXPUfNGDvpwsK/q0pcsmhJDZrgs9VT5jok+zpOui8b0PngcjvxbPXC/M/d55W+hNzHIXM7F6afMppgk/bYm6tWDv+PAsD1hl8YRBYY/DR5D+zftHWvkpOvzgyZcXwBGRYIBBpA3Fy1Z4aEXlsVPRAcQY4imPSsC+zWhmhIce4tMmFl/fxVhpOswPU9YAQ9Khykrj3yxE2CwpotvX/b9FRNyCrrLQcomp1eBgLEs2a+8XQHffx9YcXnGDw94sMDSchwb5o1jw3WWtZY5gH4VEa9nIu74HbNa1KbPNIgpeNCqGgbaFo0OjFRgzQXN9DQNrexOjS2wI3Qur8GJ/ZsOJlOz+XTiqkkPkw/j7Oe0dNiJsB7PNTjcpJ3X0UwFUCmZzQnHHIiizYIAW120Yy0LQ/5Rh8yW3SdZkMsBWSTNDsTudHi4GhbgLk7lTiHUbhglIpoKFkX6CZKB5GgrZaadhVErLyOJrZcobqapXapEaaEHSdhgG3sYmRy74NmSryKrk9ccIB1ti2iXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199018)(186003)(2616005)(6486002)(83380400001)(316002)(6666004)(52116002)(107886003)(26005)(6506007)(478600001)(6512007)(1076003)(66476007)(2906002)(38100700002)(36756003)(86362001)(4326008)(38350700002)(5660300002)(30864003)(8676002)(66556008)(8936002)(41300700001)(66946007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tmXI8JfGVVQ6WD4Yc460RRB8hZmg8t8dlo5mF3wZ4sofywUUa0PkJdu+1hxd?=
 =?us-ascii?Q?cQliwa1kzKB+PdHuXoz7BjG+p7/OZXcyy1/UnZz8ALGn/UQD7DANeWzduoT/?=
 =?us-ascii?Q?QbCTWIqdX6ZxwfT6DS59NBiqdu+hcc5prIqNo0206mjOrHvp++heuAzfEYjb?=
 =?us-ascii?Q?QNShA10kVvJ+TrwSrpc3nA+9UxdoGbEMykz8O5JRF8MPeNqEJJ/D009Hswwp?=
 =?us-ascii?Q?Wy/uOIfoFFJBdHTIGBREYZjiNlCaIoryzdGuwn5ZJHWExInX27O5e6nYiTtw?=
 =?us-ascii?Q?IXrYJGvDEGdvk9NNUKFTINtsVjEUlKpYDgufCj+sOg+AU0VlcPmJCcb5MUpj?=
 =?us-ascii?Q?TT/9AP/TzsXExWMQJg4lEBybAO6VUk820CUbhqBpUAVfDVx6WCujQSGUH9xz?=
 =?us-ascii?Q?oTIhH9BtUCy2gNTq39g8uyQjSrKczt5HfBvnldnl/zWcRNWrIlSvpstoNVQR?=
 =?us-ascii?Q?KOElkz2PdYJwNZTbaQ67clIhZd+od08lj1I8C6wsQkkpR9TSnWIqfYIUhRYp?=
 =?us-ascii?Q?+WachwOUyCwVgKxJkfhnG00/iWmbcNmI3dcTzxhu3nQThj3XgFjj/it/izZC?=
 =?us-ascii?Q?WfWQgjS/KW2FshSo/ZsKkcWd1OM/TW8rUM3pkyNYoZHvEcjc16Yg6OAI9n2c?=
 =?us-ascii?Q?TqxN1gwuyxFprZTGGh3cjdSVzMvHESmguvoZsCi1BCkNE8QkbTxAlARBpB0U?=
 =?us-ascii?Q?Cgn+0m9WDvu7yE01AJfu/jtpcozvpCiTYWLy2JjjA6dVqe5AckG5Txr7L4be?=
 =?us-ascii?Q?mbs4tly+y1pIix8IfeDmMIIMA5E2bIcDMU6qKpEi2uqas2lI2rQCY4T6XchD?=
 =?us-ascii?Q?ANHUshrG8UYfF3V2nXPQZelUWhTZK4Z3aI8QpWFzvMqUPVwf+qbomXGYujMv?=
 =?us-ascii?Q?LBl18t6fX0mfXOZpe9BpVWyWCI1V/6AS7VDd27oeNpRzpVbTAPUP66X5kCLc?=
 =?us-ascii?Q?Fgsay8PL+QfXNECSC2u4GkqDljcJH0cFCOw7fkwJVyVV2WcPL22C3070MD6E?=
 =?us-ascii?Q?8ckEtVv6lkfw5A2MJBExW6jZygmozqFfp0YoYhzlCwPQsYq5rZKrC3h/SKg+?=
 =?us-ascii?Q?fVW3qBqRkDUcavfCfKgvR6ucP3DINoNA6HJfUHDygCWbxf+0nbrH69O9bGu7?=
 =?us-ascii?Q?iQLxcQo17NO687WfzOj99aPND+E53XkvQoYp5EBYHR6vx4aqhqePkY/M1wtI?=
 =?us-ascii?Q?xkG9QKCONv4sH05pnrMrdV00ijPJtSNB3ihiiPkbeffrT1nH/+TrqeWtKqFe?=
 =?us-ascii?Q?deoULiAiZfAyIefgs/Zkw/NCo8DD5twacvRaZ8Dblbgxk5Wc2ha0ZhB6nxsA?=
 =?us-ascii?Q?3b6ssLScN8c6qVavn7TEAgg2VJ8DvvIjrLVaCtxg81Li0iKgoLmCKYqOJxsA?=
 =?us-ascii?Q?UDmqDpZKxSpqMI3+eqchdb99tGxYV9bWtjYcQ0VI3fRhBTXJb7C4jbMDuf7H?=
 =?us-ascii?Q?3i4SLs/apnuY3mp08I3ccegpYGLI5UPTVxUUlknQVONHVgCs7Lcq5ygrN1/M?=
 =?us-ascii?Q?begnarTNQIRitqn7xrQPLyIbSD8TncCGXPYVdGNQ80ONEP2TBcqdhUMzZOGG?=
 =?us-ascii?Q?Aersx5K7w/x4p4gMjrIyxfUKhF/W3aGtfrqmmeuk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4d19cf-3fca-4516-8d19-08db27b304ec
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2023 13:16:44.1109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3l33nG1w4Jq/pDQ/zewB2WOnR/FGkR9FuBSVphL6NfPvaySsqg6JSg/7gisMZakMwFuJlbZuEC83kLpwf9ZNSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5386
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Mon, 20 Mar 2023 05:16:58 +0000
Subject: [dm-devel] [PATCH] dm: Add error information printing for
 dm_register_target()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ensure that all error handling branches print error information. In this
way, when this function fails, the upper-layer functions can directly
return an error code without missing debugging information. Otherwise,
the error message will be printed redundantly or missing. BTW, remove
redundant printing information.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/md/dm-cache-target.c  |  7 ++-----
 drivers/md/dm-clone-target.c  | 10 +---------
 drivers/md/dm-crypt.c         |  8 +-------
 drivers/md/dm-delay.c         | 13 +------------
 drivers/md/dm-dust.c          |  7 +------
 drivers/md/dm-ebs-target.c    |  7 +------
 drivers/md/dm-era-target.c    | 10 +---------
 drivers/md/dm-flakey.c        |  7 +------
 drivers/md/dm-integrity.c     |  9 +--------
 drivers/md/dm-log-writes.c    |  7 +------
 drivers/md/dm-mpath.c         |  5 +----
 drivers/md/dm-raid1.c         | 16 ++++++----------
 drivers/md/dm-snap.c          | 12 +++---------
 drivers/md/dm-switch.c        |  8 +-------
 drivers/md/dm-target.c        |  7 ++++---
 drivers/md/dm-verity-target.c |  8 +-------
 drivers/md/dm-writecache.c    | 10 +---------
 drivers/md/dm-zero.c          |  7 +------
 18 files changed, 29 insertions(+), 129 deletions(-)

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index dbbcfa580078..dba2d85105f5 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -3458,13 +3458,10 @@ static int __init dm_cache_init(void)
 		return -ENOMEM;
 
 	r = dm_register_target(&cache_target);
-	if (r) {
-		DMERR("cache target registration failed: %d", r);
+	if (r)
 		kmem_cache_destroy(migration_cache);
-		return r;
-	}
 
-	return 0;
+	return r;
 }
 
 static void __exit dm_cache_exit(void)
diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index f38a27604c7a..cb0078a7201c 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -2196,19 +2196,11 @@ static struct target_type clone_target = {
 /* Module functions */
 static int __init dm_clone_init(void)
 {
-	int r;
-
 	_hydration_cache = KMEM_CACHE(dm_clone_region_hydration, 0);
 	if (!_hydration_cache)
 		return -ENOMEM;
 
-	r = dm_register_target(&clone_target);
-	if (r < 0) {
-		DMERR("Failed to register clone target");
-		return r;
-	}
-
-	return 0;
+	return dm_register_target(&clone_target);
 }
 
 static void __exit dm_clone_exit(void)
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 3ba53dc3cc3f..52615a258e13 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -3662,13 +3662,7 @@ static struct target_type crypt_target = {
 
 static int __init dm_crypt_init(void)
 {
-	int r;
-
-	r = dm_register_target(&crypt_target);
-	if (r < 0)
-		DMERR("register failed %d", r);
-
-	return r;
+	return dm_register_target(&crypt_target);
 }
 
 static void __exit dm_crypt_exit(void)
diff --git a/drivers/md/dm-delay.c b/drivers/md/dm-delay.c
index a425046f88c7..00d18b2070a5 100644
--- a/drivers/md/dm-delay.c
+++ b/drivers/md/dm-delay.c
@@ -370,18 +370,7 @@ static struct target_type delay_target = {
 
 static int __init dm_delay_init(void)
 {
-	int r;
-
-	r = dm_register_target(&delay_target);
-	if (r < 0) {
-		DMERR("register failed %d", r);
-		goto bad_register;
-	}
-
-	return 0;
-
-bad_register:
-	return r;
+	return dm_register_target(&delay_target);
 }
 
 static void __exit dm_delay_exit(void)
diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index 7ae9936752de..9bf3cdf548de 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -573,12 +573,7 @@ static struct target_type dust_target = {
 
 static int __init dm_dust_init(void)
 {
-	int r = dm_register_target(&dust_target);
-
-	if (r < 0)
-		DMERR("dm_register_target failed %d", r);
-
-	return r;
+	return dm_register_target(&dust_target);
 }
 
 static void __exit dm_dust_exit(void)
diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
index b1068a68bc46..38da4de3ecbf 100644
--- a/drivers/md/dm-ebs-target.c
+++ b/drivers/md/dm-ebs-target.c
@@ -455,12 +455,7 @@ static struct target_type ebs_target = {
 
 static int __init dm_ebs_init(void)
 {
-	int r = dm_register_target(&ebs_target);
-
-	if (r < 0)
-		DMERR("register failed %d", r);
-
-	return r;
+	return dm_register_target(&ebs_target);
 }
 
 static void dm_ebs_exit(void)
diff --git a/drivers/md/dm-era-target.c b/drivers/md/dm-era-target.c
index c2e7780cdd2d..554d234fca18 100644
--- a/drivers/md/dm-era-target.c
+++ b/drivers/md/dm-era-target.c
@@ -1756,15 +1756,7 @@ static struct target_type era_target = {
 
 static int __init dm_era_init(void)
 {
-	int r;
-
-	r = dm_register_target(&era_target);
-	if (r) {
-		DMERR("era target registration failed: %d", r);
-		return r;
-	}
-
-	return 0;
+	return dm_register_target(&era_target);
 }
 
 static void __exit dm_era_exit(void)
diff --git a/drivers/md/dm-flakey.c b/drivers/md/dm-flakey.c
index 5b7556d2a9d9..14179355e6a1 100644
--- a/drivers/md/dm-flakey.c
+++ b/drivers/md/dm-flakey.c
@@ -509,12 +509,7 @@ static struct target_type flakey_target = {
 
 static int __init dm_flakey_init(void)
 {
-	int r = dm_register_target(&flakey_target);
-
-	if (r < 0)
-		DMERR("register failed %d", r);
-
-	return r;
+	return dm_register_target(&flakey_target);
 }
 
 static void __exit dm_flakey_exit(void)
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index b0d5057fbdd9..b99c3f98412b 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -4693,8 +4693,6 @@ static struct target_type integrity_target = {
 
 static int __init dm_integrity_init(void)
 {
-	int r;
-
 	journal_io_cache = kmem_cache_create("integrity_journal_io",
 					     sizeof(struct journal_io), 0, 0, NULL);
 	if (!journal_io_cache) {
@@ -4702,12 +4700,7 @@ static int __init dm_integrity_init(void)
 		return -ENOMEM;
 	}
 
-	r = dm_register_target(&integrity_target);
-
-	if (r < 0)
-		DMERR("register failed %d", r);
-
-	return r;
+	return dm_register_target(&integrity_target);
 }
 
 static void __exit dm_integrity_exit(void)
diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index cbd0f81f4a35..0ce9b01d1393 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -940,12 +940,7 @@ static struct target_type log_writes_target = {
 
 static int __init dm_log_writes_init(void)
 {
-	int r = dm_register_target(&log_writes_target);
-
-	if (r < 0)
-		DMERR("register failed %d", r);
-
-	return r;
+	return dm_register_target(&log_writes_target);
 }
 
 static void __exit dm_log_writes_exit(void)
diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 61ab1a8d2c9c..bea3cda9938e 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -2235,11 +2235,8 @@ static int __init dm_multipath_init(void)
 	}
 
 	r = dm_register_target(&multipath_target);
-	if (r < 0) {
-		DMERR("request-based register failed %d", r);
-		r = -EINVAL;
+	if (r < 0)
 		goto bad_register_target;
-	}
 
 	return 0;
 
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index bc417a5e5b89..82430b8dedfa 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -1498,22 +1498,18 @@ static struct target_type mirror_target = {
 
 static int __init dm_mirror_init(void)
 {
-	int r = -ENOMEM;
+	int r;
 
 	dm_raid1_wq = alloc_workqueue("dm_raid1_wq", 0, 0);
-	if (!dm_raid1_wq)
-		goto bad_target;
+	if (!dm_raid1_wq) {
+		DMERR("Failed to alloc workqueue");
+		return -ENOMEM;
+	}
 
 	r = dm_register_target(&mirror_target);
-	if (r < 0) {
+	if (r < 0)
 		destroy_workqueue(dm_raid1_wq);
-		goto bad_target;
-	}
-
-	return 0;
 
-bad_target:
-	DMERR("Failed to register mirror target");
 	return r;
 }
 
diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index f766c21408f1..9c49f53760d0 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -2815,22 +2815,16 @@ static int __init dm_snapshot_init(void)
 	}
 
 	r = dm_register_target(&snapshot_target);
-	if (r < 0) {
-		DMERR("snapshot target register failed %d", r);
+	if (r < 0)
 		goto bad_register_snapshot_target;
-	}
 
 	r = dm_register_target(&origin_target);
-	if (r < 0) {
-		DMERR("Origin target register failed %d", r);
+	if (r < 0)
 		goto bad_register_origin_target;
-	}
 
 	r = dm_register_target(&merge_target);
-	if (r < 0) {
-		DMERR("Merge target register failed %d", r);
+	if (r < 0)
 		goto bad_register_merge_target;
-	}
 
 	return 0;
 
diff --git a/drivers/md/dm-switch.c b/drivers/md/dm-switch.c
index ee2432927e90..5a5976b0cfb8 100644
--- a/drivers/md/dm-switch.c
+++ b/drivers/md/dm-switch.c
@@ -568,13 +568,7 @@ static struct target_type switch_target = {
 
 static int __init dm_switch_init(void)
 {
-	int r;
-
-	r = dm_register_target(&switch_target);
-	if (r < 0)
-		DMERR("dm_register_target() failed %d", r);
-
-	return r;
+	return dm_register_target(&switch_target);
 }
 
 static void __exit dm_switch_exit(void)
diff --git a/drivers/md/dm-target.c b/drivers/md/dm-target.c
index 26ea22b1a0d7..2653a1c5e084 100644
--- a/drivers/md/dm-target.c
+++ b/drivers/md/dm-target.c
@@ -85,11 +85,12 @@ int dm_register_target(struct target_type *tt)
 	int rv = 0;
 
 	down_write(&_lock);
-	if (__find_target_type(tt->name))
+	if (__find_target_type(tt->name)) {
 		rv = -EEXIST;
-	else
+		DMERR("can't find dm-%s target type", tt->name);
+	} else {
 		list_add(&tt->list, &_targets);
-
+	}
 	up_write(&_lock);
 	return rv;
 }
diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index ade83ef3b439..1eed2a9b4e8e 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -1501,13 +1501,7 @@ static struct target_type verity_target = {
 
 static int __init dm_verity_init(void)
 {
-	int r;
-
-	r = dm_register_target(&verity_target);
-	if (r < 0)
-		DMERR("register failed %d", r);
-
-	return r;
+	return dm_register_target(&verity_target);
 }
 
 static void __exit dm_verity_exit(void)
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 3aa5874f0aef..81b60b75a9fa 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -2776,15 +2776,7 @@ static struct target_type writecache_target = {
 
 static int __init dm_writecache_init(void)
 {
-	int r;
-
-	r = dm_register_target(&writecache_target);
-	if (r < 0) {
-		DMERR("register failed %d", r);
-		return r;
-	}
-
-	return 0;
+	return dm_register_target(&writecache_target);
 }
 
 static void __exit dm_writecache_exit(void)
diff --git a/drivers/md/dm-zero.c b/drivers/md/dm-zero.c
index 2601cd520384..4d96a9d50894 100644
--- a/drivers/md/dm-zero.c
+++ b/drivers/md/dm-zero.c
@@ -68,12 +68,7 @@ static struct target_type zero_target = {
 
 static int __init dm_zero_init(void)
 {
-	int r = dm_register_target(&zero_target);
-
-	if (r < 0)
-		DMERR("register failed %d", r);
-
-	return r;
+	return dm_register_target(&zero_target);
 }
 
 static void __exit dm_zero_exit(void)
-- 
2.35.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

