Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0BE38AF4
	for <lists+dm-devel@lfdr.de>; Fri,  7 Jun 2019 15:09:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF8CF2F8BDA;
	Fri,  7 Jun 2019 13:09:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C219E84D00;
	Fri,  7 Jun 2019 13:09:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DBF018433A1;
	Fri,  7 Jun 2019 13:09:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57D7CIB000936 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 09:07:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA91083868; Fri,  7 Jun 2019 13:07:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6301E82EEF;
	Fri,  7 Jun 2019 13:07:10 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41D85C03D478;
	Fri,  7 Jun 2019 13:06:54 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 07 Jun 2019 07:06:43 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  7 Jun 2019 15:05:50 +0200
Message-Id: <20190607130552.13203-29-mwilck@suse.com>
In-Reply-To: <20190607130552.13203-1-mwilck@suse.com>
References: <20190607130552.13203-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Fri, 07 Jun 2019 13:06:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Fri, 07 Jun 2019 13:06:57 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 28/30] multipath-tools tests: add test for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 07 Jun 2019 13:09:49 +0000 (UTC)

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
