Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 47183219D85
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:18:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-1XAIiBy7M7-VKiJh1bLcYg-1; Thu, 09 Jul 2020 06:17:33 -0400
X-MC-Unique: 1XAIiBy7M7-VKiJh1bLcYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 731EA1937FFA;
	Thu,  9 Jul 2020 10:17:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DCD66FEE1;
	Thu,  9 Jul 2020 10:17:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2BED1806B0B;
	Thu,  9 Jul 2020 10:17:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AGwcX029389 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:16:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 96FD0208DD80; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 931962026D69
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 712D010B9501
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-102-YO_Yr-9ePrWfljRIzZwtQA-1;
	Thu, 09 Jul 2020 06:16:55 -0400
X-MC-Unique: YO_Yr-9ePrWfljRIzZwtQA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0C49FADC0;
	Thu,  9 Jul 2020 10:16:54 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:15:59 +0200
Message-Id: <20200709101620.6786-15-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AGwcX029389
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 14/35] libmultipath: rlookup_binding(): remove
	newline in log message
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This clutters the log. The corresponding message in lookup_binding()
doesn't have a newline, either.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 2 +-
 tests/alias.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index 14401ca..35f1beb 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -215,7 +215,7 @@ rlookup_binding(FILE *f, char *buff, const char *map_alias)
 		}
 		if (strcmp(alias, map_alias) == 0){
 			condlog(3, "Found matching alias [%s] in bindings file."
-				"\nSetting wwid to %s", alias, wwid);
+				" Setting wwid to %s", alias, wwid);
 			strlcpy(buff, wwid, WWID_SIZE);
 			return 0;
 		}
diff --git a/tests/alias.c b/tests/alias.c
index 30414db..22ffd55 100644
--- a/tests/alias.c
+++ b/tests/alias.c
@@ -552,7 +552,7 @@ static void rl_match_a(void **state)
 
 	buf[0] = '\0';
 	will_return(__wrap_fgets, "MPATHa WWID0\n");
-	expect_condlog(3, "Found matching alias [MPATHa] in bindings file.\n"
+	expect_condlog(3, "Found matching alias [MPATHa] in bindings file. "
 		       "Setting wwid to WWID0\n");
 	rc = rlookup_binding(NULL, buf, "MPATHa");
 	assert_int_equal(rc, 0);
@@ -617,7 +617,7 @@ static void rl_match_b(void **state)
 	will_return(__wrap_fgets, "MPATHa WWID0\n");
 	will_return(__wrap_fgets, "MPATHz WWID26\n");
 	will_return(__wrap_fgets, "MPATHb WWID2\n");
-	expect_condlog(3, "Found matching alias [MPATHb] in bindings file.\n"
+	expect_condlog(3, "Found matching alias [MPATHb] in bindings file. "
 		       "Setting wwid to WWID2\n");
 	rc = rlookup_binding(NULL, buf, "MPATHb");
 	assert_int_equal(rc, 0);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

