Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 49FDA2DE693
	for <lists+dm-devel@lfdr.de>; Fri, 18 Dec 2020 16:30:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-u61mRxr3P66UbcSF-RtlGw-1; Fri, 18 Dec 2020 10:30:47 -0500
X-MC-Unique: u61mRxr3P66UbcSF-RtlGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C981C107ACE3;
	Fri, 18 Dec 2020 15:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A73255D769;
	Fri, 18 Dec 2020 15:30:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 051794A7C6;
	Fri, 18 Dec 2020 15:30:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIFRGUY017079 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 10:27:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 853AAF3D17; Fri, 18 Dec 2020 15:27:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FFDAF3D10
	for <dm-devel@redhat.com>; Fri, 18 Dec 2020 15:27:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08FB3186E123
	for <dm-devel@redhat.com>; Fri, 18 Dec 2020 15:27:14 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-530-GUD_SjSKNheIAD9fWtKhSw-1;
	Fri, 18 Dec 2020 10:27:11 -0500
X-MC-Unique: GUD_SjSKNheIAD9fWtKhSw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3B65CACF1;
	Fri, 18 Dec 2020 15:27:10 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 18 Dec 2020 16:26:38 +0100
Message-Id: <20201218152638.21660-1-mwilck@suse.com>
In-Reply-To: <20201217163255.GB3103@octiron.msp.redhat.com>
References: <20201217163255.GB3103@octiron.msp.redhat.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BIFRGUY017079
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v5 22/29] multipath: fix leak in
	check_path_valid()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If path status was successfully determined before calling store_pathvec(),
free_path() wasn't called.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/main.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index 1949a1c..043d8fa 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -93,7 +93,7 @@ void rcu_register_thread_memb(void) {}
 void rcu_unregister_thread_memb(void) {}
 
 static int
-filter_pathvec (vector pathvec, char * refwwid)
+filter_pathvec (vector pathvec, const char *refwwid)
 {
 	int i;
 	struct path * pp;
@@ -594,8 +594,9 @@ static int
 check_path_valid(const char *name, struct config *conf, bool is_uevent)
 {
 	int fd, r = PATH_IS_ERROR;
-	struct path *pp = NULL;
+	struct path *pp;
 	vector pathvec = NULL;
+	const char *wwid;
 
 	pp = alloc_path();
 	if (!pp)
@@ -664,14 +665,19 @@ check_path_valid(const char *name, struct config *conf, bool is_uevent)
 
 	if (store_path(pathvec, pp) != 0) {
 		free_path(pp);
+		pp = NULL;
 		goto fail;
+	} else {
+		/* make sure path isn't freed twice */
+		wwid = pp->wwid;
+		pp = NULL;
 	}
 
 	/* For find_multipaths = SMART, if there is more than one path
 	 * matching the refwwid, then the path is valid */
 	if (path_discovery(pathvec, DI_SYSFS | DI_WWID) < 0)
 		goto fail;
-	filter_pathvec(pathvec, pp->wwid);
+	filter_pathvec(pathvec, wwid);
 	if (VECTOR_SIZE(pathvec) > 1)
 		r = PATH_IS_VALID;
 	else
@@ -679,21 +685,25 @@ check_path_valid(const char *name, struct config *conf, bool is_uevent)
 
 out:
 	r = print_cmd_valid(r, pathvec, conf);
-	free_pathvec(pathvec, FREE_PATHS);
 	/*
 	 * multipath -u must exit with status 0, otherwise udev won't
 	 * import its output.
 	 */
 	if (!is_uevent && r == PATH_IS_NOT_VALID)
-		return RTVL_FAIL;
-	return RTVL_OK;
+		r = RTVL_FAIL;
+	else
+		r = RTVL_OK;
+	goto cleanup;
 
 fail:
-	if (pathvec)
-		free_pathvec(pathvec, FREE_PATHS);
-	else
+	r = RTVL_FAIL;
+
+cleanup:
+	if (pp != NULL)
 		free_path(pp);
-	return RTVL_FAIL;
+	if (pathvec != NULL)
+		free_pathvec(pathvec, FREE_PATHS);
+	return r;
 }
 
 static int
-- 
2.29.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

