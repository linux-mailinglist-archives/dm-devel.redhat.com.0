Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 071F62522C0
	for <lists+dm-devel@lfdr.de>; Tue, 25 Aug 2020 23:25:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-g2WdRFToMMK2bH6MALvYqA-1; Tue, 25 Aug 2020 17:25:37 -0400
X-MC-Unique: g2WdRFToMMK2bH6MALvYqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC4671084C8B;
	Tue, 25 Aug 2020 21:25:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C18419C58;
	Tue, 25 Aug 2020 21:25:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B13B61826D2C;
	Tue, 25 Aug 2020 21:25:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07PLP5DC024476 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Aug 2020 17:25:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 88ADC2166B28; Tue, 25 Aug 2020 21:25:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 817342166BA4
	for <dm-devel@redhat.com>; Tue, 25 Aug 2020 21:25:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62614185A78B
	for <dm-devel@redhat.com>; Tue, 25 Aug 2020 21:25:03 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-148-B1UlcaN2Ov2XLwGH87WhpQ-1;
	Tue, 25 Aug 2020 17:25:00 -0400
X-MC-Unique: B1UlcaN2Ov2XLwGH87WhpQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 18FE1B5C0;
	Tue, 25 Aug 2020 21:25:30 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 25 Aug 2020 23:24:50 +0200
Message-Id: <20200825212450.8561-5-mwilck@suse.com>
In-Reply-To: <20200825212450.8561-1-mwilck@suse.com>
References: <20200825212450.8561-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07PLP5DC024476
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 5/5] multipath-tools tests: fix memory leak in
	vpd test
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

regfree() wasn't called on the re used in subst_spaces().

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/vpd.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/tests/vpd.c b/tests/vpd.c
index 3cbad81..e2ec65e 100644
--- a/tests/vpd.c
+++ b/tests/vpd.c
@@ -28,13 +28,17 @@ struct vpdtest {
 	char wwid[WWID_SIZE];
 };
 
+static regex_t space_re;
 static int setup(void **state)
 {
 	struct vpdtest *vt = malloc(sizeof(*vt));
+	int rc;
 
 	if (vt == NULL)
 		return -1;
 	*state = vt;
+	rc = regcomp(&space_re, " +", REG_EXTENDED);
+	assert_int_equal(rc, 0);
 	return 0;
 }
 
@@ -44,6 +48,7 @@ static int teardown(void **state)
 
 	free(vt);
 	*state = NULL;
+	regfree(&space_re);
 	return 0;
 }
 
@@ -360,21 +365,14 @@ static char *subst_spaces(const char *src)
 {
 	char *dst = calloc(1, strlen(src) + 1);
 	char *p;
-	static regex_t *re;
 	regmatch_t match;
-	int rc;
+	int rc = 0;
 
 	assert_non_null(dst);
-	if (re == NULL) {
-		re = calloc(1, sizeof(*re));
-		assert_non_null(re);
-		rc = regcomp(re, " +", REG_EXTENDED);
-		assert_int_equal(rc, 0);
-	}
 
-	for (rc = regexec(re, src, 1, &match, 0), p = dst;
+	for (rc = regexec(&space_re, src, 1, &match, 0), p = dst;
 	    rc == 0;
-	    src += match.rm_eo, rc = regexec(re, src, 1, &match, 0)) {
+	    src += match.rm_eo, rc = regexec(&space_re, src, 1, &match, 0)) {
 		memcpy(p, src, match.rm_so);
 		p += match.rm_so;
 		*p = '_';
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

