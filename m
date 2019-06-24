Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 403FF505CA
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:31:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 081D43092665;
	Mon, 24 Jun 2019 09:31:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAA2D60C18;
	Mon, 24 Jun 2019 09:31:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D8D61806B1A;
	Mon, 24 Jun 2019 09:31:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9ToE1005904 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA1175D9C8; Mon, 24 Jun 2019 09:29:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5CBE5D9C5;
	Mon, 24 Jun 2019 09:29:47 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CFEC307CDD5;
	Mon, 24 Jun 2019 09:29:41 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:29:32 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:54 +0200
Message-Id: <20190624092756.7769-30-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Mon, 24 Jun 2019 09:29:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Mon, 24 Jun 2019 09:29:41 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 28/30] multipath-tools tests: add test for
	uid_attrs parsing
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 24 Jun 2019 09:31:36 +0000 (UTC)

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/uevent.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/uevent.c b/tests/uevent.c
index 215d97ad..f4afd9b4 100644
--- a/tests/uevent.c
+++ b/tests/uevent.c
@@ -95,6 +95,23 @@ static void test_ro_good(void **state)
 	assert_int_equal(uevent_get_disk_ro(uev), DISK_RO);
 }
 
+static void test_uid_attrs(void **state)
+{
+	/* see test_uid_attrs above */
+	struct config *conf = get_multipath_config();
+	vector attrs = &conf->uid_attrs;
+
+	assert_int_equal(VECTOR_SIZE(attrs), 3);
+	assert_null(get_uid_attribute_by_attrs(conf, "hda"));
+	assert_string_equal("ID_BOGUS",
+			    get_uid_attribute_by_attrs(conf, "sdaw"));
+	assert_string_equal("ID_SPAM",
+			    get_uid_attribute_by_attrs(conf, "dasdu"));
+	assert_string_equal("ID_EGGS",
+			    get_uid_attribute_by_attrs(conf, "nvme2n4"));
+	put_multipath_config(conf);
+}
+
 static void test_wwid(void **state)
 {
 	struct uevent *uev = *state;
@@ -280,6 +297,7 @@ int test_uevent_get_XXX(void)
 		cmocka_unit_test(test_minor_good),
 		cmocka_unit_test(test_ro_good),
 		cmocka_unit_test(test_dm_name_good),
+		cmocka_unit_test(test_uid_attrs),
 		cmocka_unit_test(test_wwid),
 		cmocka_unit_test(test_major_bad_0),
 		cmocka_unit_test(test_major_bad_1),
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
