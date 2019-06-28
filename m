Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD4259B69
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jun 2019 14:33:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4232B307D90E;
	Fri, 28 Jun 2019 12:32:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10CEA1001B21;
	Fri, 28 Jun 2019 12:32:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 642A11806B16;
	Fri, 28 Jun 2019 12:32:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5SCV1Fu024683 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 08:31:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DDD746013C; Fri, 28 Jun 2019 12:31:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D37926013A;
	Fri, 28 Jun 2019 12:30:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EBB37CBA0;
	Fri, 28 Jun 2019 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uuAO7Ip7/oFj8Y2WIj1GzBB+07T8ur4xQHwAjjIg0CY=;
	b=jwbD5P//JCjlS3C8Nc9p3eAw1i
	HvPNsBW++l53kPPeJPYoGyqXmfOc4kId6HxdotW69VHWR3FPnKcLUyQIF3GNXy49UtYZGUo6WKE00
	4q3SLsGmXWpiIgi/gMMcV4XzYojSE2AlqqEicqFBkIMz00bhC3hQJU4c+JHK7Kzbuou2j3QxYwBKo
	nta7n6yr8YtJ0dEkqLGxUBzivUK/KLNGvBNUrAfdlVg5owkWby52WVJOdKvU7UanYNuDl7/34RRPN
	ih4pc9UpGZguGG8jzx/ANZ59bkJC4oJ9Pn5P06A5sBz2JVshX+dbk0eOG64dJsfR5DQoC+gztb6Dw
	gC53uiVA==;
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hgq1U-00055B-7t; Fri, 28 Jun 2019 12:30:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
	(envelope-from <mchehab@bombadil.infradead.org>)
	id 1hgq1S-0005S2-9t; Fri, 28 Jun 2019 09:30:34 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Fri, 28 Jun 2019 09:30:07 -0300
Message-Id: <69039a9ae8c5327e14e9fc3dbc9e810f92091b52.1561724493.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Fri, 28 Jun 2019 12:30:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Fri, 28 Jun 2019 12:30:44 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'mchehab@bombadil.infradead.org' RCPT:''
X-RedHat-Spam-Score: -2.048  (DKIM_SIGNED, DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org <mchehab@bombadil.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@infradead.org>,
	linux-raid@vger.kernel.org, dm-devel@redhat.com,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Shaohua Li <shli@kernel.org>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH 14/39] docs: device-mapper: move it to the
	admin-guide
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 28 Jun 2019 12:33:08 +0000 (UTC)

The DM support describes lots of aspects related to mapped
disk partitions from the userspace PoV.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 .../{ => admin-guide}/device-mapper/cache-policies.rst          | 0
 Documentation/{ => admin-guide}/device-mapper/cache.rst         | 0
 Documentation/{ => admin-guide}/device-mapper/delay.rst         | 0
 Documentation/{ => admin-guide}/device-mapper/dm-crypt.rst      | 0
 Documentation/{ => admin-guide}/device-mapper/dm-dust.txt       | 0
 Documentation/{ => admin-guide}/device-mapper/dm-flakey.rst     | 0
 Documentation/{ => admin-guide}/device-mapper/dm-init.rst       | 0
 Documentation/{ => admin-guide}/device-mapper/dm-integrity.rst  | 0
 Documentation/{ => admin-guide}/device-mapper/dm-io.rst         | 0
 Documentation/{ => admin-guide}/device-mapper/dm-log.rst        | 0
 .../{ => admin-guide}/device-mapper/dm-queue-length.rst         | 0
 Documentation/{ => admin-guide}/device-mapper/dm-raid.rst       | 0
 .../{ => admin-guide}/device-mapper/dm-service-time.rst         | 0
 Documentation/{ => admin-guide}/device-mapper/dm-uevent.rst     | 0
 Documentation/{ => admin-guide}/device-mapper/dm-zoned.rst      | 0
 Documentation/{ => admin-guide}/device-mapper/era.rst           | 0
 Documentation/{ => admin-guide}/device-mapper/index.rst         | 2 --
 Documentation/{ => admin-guide}/device-mapper/kcopyd.rst        | 0
 Documentation/{ => admin-guide}/device-mapper/linear.rst        | 0
 Documentation/{ => admin-guide}/device-mapper/log-writes.rst    | 0
 .../{ => admin-guide}/device-mapper/persistent-data.rst         | 0
 Documentation/{ => admin-guide}/device-mapper/snapshot.rst      | 0
 Documentation/{ => admin-guide}/device-mapper/statistics.rst    | 0
 Documentation/{ => admin-guide}/device-mapper/striped.rst       | 0
 Documentation/{ => admin-guide}/device-mapper/switch.rst        | 0
 .../{ => admin-guide}/device-mapper/thin-provisioning.rst       | 0
 Documentation/{ => admin-guide}/device-mapper/unstriped.rst     | 0
 Documentation/{ => admin-guide}/device-mapper/verity.rst        | 0
 Documentation/{ => admin-guide}/device-mapper/writecache.rst    | 0
 Documentation/{ => admin-guide}/device-mapper/zero.rst          | 0
 Documentation/admin-guide/index.rst                             | 1 +
 MAINTAINERS                                                     | 2 +-
 drivers/md/Kconfig                                              | 2 +-
 drivers/md/dm-init.c                                            | 2 +-
 drivers/md/dm-raid.c                                            | 2 +-
 35 files changed, 5 insertions(+), 6 deletions(-)
 rename Documentation/{ => admin-guide}/device-mapper/cache-policies.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/cache.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/delay.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-crypt.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-dust.txt (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-flakey.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-init.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-integrity.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-io.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-log.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-queue-length.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-raid.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-service-time.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-uevent.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/dm-zoned.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/era.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/index.rst (98%)
 rename Documentation/{ => admin-guide}/device-mapper/kcopyd.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/linear.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/log-writes.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/persistent-data.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/snapshot.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/statistics.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/striped.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/switch.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/thin-provisioning.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/unstriped.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/verity.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/writecache.rst (100%)
 rename Documentation/{ => admin-guide}/device-mapper/zero.rst (100%)

diff --git a/Documentation/device-mapper/cache-policies.rst b/Documentation/admin-guide/device-mapper/cache-policies.rst
similarity index 100%
rename from Documentation/device-mapper/cache-policies.rst
rename to Documentation/admin-guide/device-mapper/cache-policies.rst
diff --git a/Documentation/device-mapper/cache.rst b/Documentation/admin-guide/device-mapper/cache.rst
similarity index 100%
rename from Documentation/device-mapper/cache.rst
rename to Documentation/admin-guide/device-mapper/cache.rst
diff --git a/Documentation/device-mapper/delay.rst b/Documentation/admin-guide/device-mapper/delay.rst
similarity index 100%
rename from Documentation/device-mapper/delay.rst
rename to Documentation/admin-guide/device-mapper/delay.rst
diff --git a/Documentation/device-mapper/dm-crypt.rst b/Documentation/admin-guide/device-mapper/dm-crypt.rst
similarity index 100%
rename from Documentation/device-mapper/dm-crypt.rst
rename to Documentation/admin-guide/device-mapper/dm-crypt.rst
diff --git a/Documentation/device-mapper/dm-dust.txt b/Documentation/admin-guide/device-mapper/dm-dust.txt
similarity index 100%
rename from Documentation/device-mapper/dm-dust.txt
rename to Documentation/admin-guide/device-mapper/dm-dust.txt
diff --git a/Documentation/device-mapper/dm-flakey.rst b/Documentation/admin-guide/device-mapper/dm-flakey.rst
similarity index 100%
rename from Documentation/device-mapper/dm-flakey.rst
rename to Documentation/admin-guide/device-mapper/dm-flakey.rst
diff --git a/Documentation/device-mapper/dm-init.rst b/Documentation/admin-guide/device-mapper/dm-init.rst
similarity index 100%
rename from Documentation/device-mapper/dm-init.rst
rename to Documentation/admin-guide/device-mapper/dm-init.rst
diff --git a/Documentation/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
similarity index 100%
rename from Documentation/device-mapper/dm-integrity.rst
rename to Documentation/admin-guide/device-mapper/dm-integrity.rst
diff --git a/Documentation/device-mapper/dm-io.rst b/Documentation/admin-guide/device-mapper/dm-io.rst
similarity index 100%
rename from Documentation/device-mapper/dm-io.rst
rename to Documentation/admin-guide/device-mapper/dm-io.rst
diff --git a/Documentation/device-mapper/dm-log.rst b/Documentation/admin-guide/device-mapper/dm-log.rst
similarity index 100%
rename from Documentation/device-mapper/dm-log.rst
rename to Documentation/admin-guide/device-mapper/dm-log.rst
diff --git a/Documentation/device-mapper/dm-queue-length.rst b/Documentation/admin-guide/device-mapper/dm-queue-length.rst
similarity index 100%
rename from Documentation/device-mapper/dm-queue-length.rst
rename to Documentation/admin-guide/device-mapper/dm-queue-length.rst
diff --git a/Documentation/device-mapper/dm-raid.rst b/Documentation/admin-guide/device-mapper/dm-raid.rst
similarity index 100%
rename from Documentation/device-mapper/dm-raid.rst
rename to Documentation/admin-guide/device-mapper/dm-raid.rst
diff --git a/Documentation/device-mapper/dm-service-time.rst b/Documentation/admin-guide/device-mapper/dm-service-time.rst
similarity index 100%
rename from Documentation/device-mapper/dm-service-time.rst
rename to Documentation/admin-guide/device-mapper/dm-service-time.rst
diff --git a/Documentation/device-mapper/dm-uevent.rst b/Documentation/admin-guide/device-mapper/dm-uevent.rst
similarity index 100%
rename from Documentation/device-mapper/dm-uevent.rst
rename to Documentation/admin-guide/device-mapper/dm-uevent.rst
diff --git a/Documentation/device-mapper/dm-zoned.rst b/Documentation/admin-guide/device-mapper/dm-zoned.rst
similarity index 100%
rename from Documentation/device-mapper/dm-zoned.rst
rename to Documentation/admin-guide/device-mapper/dm-zoned.rst
diff --git a/Documentation/device-mapper/era.rst b/Documentation/admin-guide/device-mapper/era.rst
similarity index 100%
rename from Documentation/device-mapper/era.rst
rename to Documentation/admin-guide/device-mapper/era.rst
diff --git a/Documentation/device-mapper/index.rst b/Documentation/admin-guide/device-mapper/index.rst
similarity index 98%
rename from Documentation/device-mapper/index.rst
rename to Documentation/admin-guide/device-mapper/index.rst
index 105e253bc231..c77c58b8f67b 100644
--- a/Documentation/device-mapper/index.rst
+++ b/Documentation/admin-guide/device-mapper/index.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 =============
 Device Mapper
 =============
diff --git a/Documentation/device-mapper/kcopyd.rst b/Documentation/admin-guide/device-mapper/kcopyd.rst
similarity index 100%
rename from Documentation/device-mapper/kcopyd.rst
rename to Documentation/admin-guide/device-mapper/kcopyd.rst
diff --git a/Documentation/device-mapper/linear.rst b/Documentation/admin-guide/device-mapper/linear.rst
similarity index 100%
rename from Documentation/device-mapper/linear.rst
rename to Documentation/admin-guide/device-mapper/linear.rst
diff --git a/Documentation/device-mapper/log-writes.rst b/Documentation/admin-guide/device-mapper/log-writes.rst
similarity index 100%
rename from Documentation/device-mapper/log-writes.rst
rename to Documentation/admin-guide/device-mapper/log-writes.rst
diff --git a/Documentation/device-mapper/persistent-data.rst b/Documentation/admin-guide/device-mapper/persistent-data.rst
similarity index 100%
rename from Documentation/device-mapper/persistent-data.rst
rename to Documentation/admin-guide/device-mapper/persistent-data.rst
diff --git a/Documentation/device-mapper/snapshot.rst b/Documentation/admin-guide/device-mapper/snapshot.rst
similarity index 100%
rename from Documentation/device-mapper/snapshot.rst
rename to Documentation/admin-guide/device-mapper/snapshot.rst
diff --git a/Documentation/device-mapper/statistics.rst b/Documentation/admin-guide/device-mapper/statistics.rst
similarity index 100%
rename from Documentation/device-mapper/statistics.rst
rename to Documentation/admin-guide/device-mapper/statistics.rst
diff --git a/Documentation/device-mapper/striped.rst b/Documentation/admin-guide/device-mapper/striped.rst
similarity index 100%
rename from Documentation/device-mapper/striped.rst
rename to Documentation/admin-guide/device-mapper/striped.rst
diff --git a/Documentation/device-mapper/switch.rst b/Documentation/admin-guide/device-mapper/switch.rst
similarity index 100%
rename from Documentation/device-mapper/switch.rst
rename to Documentation/admin-guide/device-mapper/switch.rst
diff --git a/Documentation/device-mapper/thin-provisioning.rst b/Documentation/admin-guide/device-mapper/thin-provisioning.rst
similarity index 100%
rename from Documentation/device-mapper/thin-provisioning.rst
rename to Documentation/admin-guide/device-mapper/thin-provisioning.rst
diff --git a/Documentation/device-mapper/unstriped.rst b/Documentation/admin-guide/device-mapper/unstriped.rst
similarity index 100%
rename from Documentation/device-mapper/unstriped.rst
rename to Documentation/admin-guide/device-mapper/unstriped.rst
diff --git a/Documentation/device-mapper/verity.rst b/Documentation/admin-guide/device-mapper/verity.rst
similarity index 100%
rename from Documentation/device-mapper/verity.rst
rename to Documentation/admin-guide/device-mapper/verity.rst
diff --git a/Documentation/device-mapper/writecache.rst b/Documentation/admin-guide/device-mapper/writecache.rst
similarity index 100%
rename from Documentation/device-mapper/writecache.rst
rename to Documentation/admin-guide/device-mapper/writecache.rst
diff --git a/Documentation/device-mapper/zero.rst b/Documentation/admin-guide/device-mapper/zero.rst
similarity index 100%
rename from Documentation/device-mapper/zero.rst
rename to Documentation/admin-guide/device-mapper/zero.rst
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 42819addebc6..e0763c51b024 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -79,6 +79,7 @@ configure specific aspects of kernel behavior to your liking.
    namespaces/index
    perf-security
    acpi/index
+   device-mapper/index
 
 .. only::  subproject and html
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 524e2c4300dc..40d057631004 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4703,7 +4703,7 @@ Q:	http://patchwork.kernel.org/project/dm-devel/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
 T:	quilt http://people.redhat.com/agk/patches/linux/editing/
 S:	Maintained
-F:	Documentation/device-mapper/
+F:	Documentation/admin-guide/device-mapper/
 F:	drivers/md/Makefile
 F:	drivers/md/Kconfig
 F:	drivers/md/dm*
diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index 5ccac0b77f17..3834332f4963 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -453,7 +453,7 @@ config DM_INIT
 	Enable "dm-mod.create=" parameter to create mapped devices at init time.
 	This option is useful to allow mounting rootfs without requiring an
 	initramfs.
-	See Documentation/device-mapper/dm-init.rst for dm-mod.create="..."
+	See Documentation/admin-guide/device-mapper/dm-init.rst for dm-mod.create="..."
 	format.
 
 	If unsure, say N.
diff --git a/drivers/md/dm-init.c b/drivers/md/dm-init.c
index b65faef2c4b5..b869316d3722 100644
--- a/drivers/md/dm-init.c
+++ b/drivers/md/dm-init.c
@@ -25,7 +25,7 @@ static char *create;
  * Format: dm-mod.create=<name>,<uuid>,<minor>,<flags>,<table>[,<table>+][;<name>,<uuid>,<minor>,<flags>,<table>[,<table>+]+]
  * Table format: <start_sector> <num_sectors> <target_type> <target_args>
  *
- * See Documentation/device-mapper/dm-init.rst for dm-mod.create="..." format
+ * See Documentation/admin-guide/device-mapper/dm-init.rst for dm-mod.create="..." format
  * details.
  */
 
diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 7a87a640f8ba..8a60a4a070ac 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -3558,7 +3558,7 @@ static void raid_status(struct dm_target *ti, status_type_t type,
 		 * v1.5.0+:
 		 *
 		 * Sync action:
-		 *   See Documentation/device-mapper/dm-raid.rst for
+		 *   See Documentation/admin-guide/device-mapper/dm-raid.rst for
 		 *   information on each of these states.
 		 */
 		DMEMIT(" %s", sync_action);
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
