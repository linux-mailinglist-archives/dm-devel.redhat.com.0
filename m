Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 40C463196E8
	for <lists+dm-devel@lfdr.de>; Fri, 12 Feb 2021 00:47:28 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-NkpeI1w_MQyC1nYPW471-Q-1; Thu, 11 Feb 2021 18:47:24 -0500
X-MC-Unique: NkpeI1w_MQyC1nYPW471-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E79E0192CC42;
	Thu, 11 Feb 2021 23:47:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0DA75D9C2;
	Thu, 11 Feb 2021 23:47:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A366818095CB;
	Thu, 11 Feb 2021 23:47:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11BNl3tL010506 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 18:47:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C603C10341F; Thu, 11 Feb 2021 23:47:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFAB410342B
	for <dm-devel@redhat.com>; Thu, 11 Feb 2021 23:47:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79FB2858F18
	for <dm-devel@redhat.com>; Thu, 11 Feb 2021 23:47:01 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-494-1UqaY5PKMnaAk9AKYdZbfQ-1;
	Thu, 11 Feb 2021 18:46:58 -0500
X-MC-Unique: 1UqaY5PKMnaAk9AKYdZbfQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 49983AE8A;
	Thu, 11 Feb 2021 23:46:57 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 12 Feb 2021 00:46:48 +0100
Message-Id: <20210211234650.21890-2-mwilck@suse.com>
In-Reply-To: <20210211234650.21890-1-mwilck@suse.com>
References: <20210211234650.21890-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11BNl3tL010506
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 2/4] multipath-tools: devt test: avoid failure
	when run in containers
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

/sys/dev/block is usually unavailable containers, causing libudev
calls to fail. Skip the respective tests.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/devt.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/devt.c b/tests/devt.c
index 2b72851..02f2e8f 100644
--- a/tests/devt.c
+++ b/tests/devt.c
@@ -11,11 +11,25 @@
 #include <cmocka.h>
 #include <libudev.h>
 #include <sys/sysmacros.h>
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <unistd.h>
 #include "util.h"
 #include "debug.h"
 
 #include "globals.c"
 
+static bool sys_dev_block_exists(void)
+{
+	int fd;
+	bool rc;
+
+	fd = open("/sys/dev/block", O_RDONLY|O_DIRECTORY);
+	rc = (fd != -1);
+	close(fd);
+	return rc;
+}
+
 static int get_one_devt(char *devt, size_t len)
 {
 	struct udev_enumerate *enm;
@@ -71,6 +85,8 @@ static void test_devt2devname_devt_good(void **state)
 {
 	char dummy[BLK_DEV_SIZE];
 
+	if (!sys_dev_block_exists())
+		skip();
 	assert_int_equal(devt2devname(dummy, sizeof(dummy), *state), 0);
 }
 
@@ -137,6 +153,8 @@ static void test_devt2devname_real(void **state)
 	struct udev_list_entry *first, *item;
 	unsigned int i = 0;
 
+	if (!sys_dev_block_exists())
+		skip();
 	enm = udev_enumerate_new(udev);
 	assert_non_null(enm);
 	r = udev_enumerate_add_match_subsystem(enm, "block");
-- 
2.29.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

