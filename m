Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 607BE5A2C3C
	for <lists+dm-devel@lfdr.de>; Fri, 26 Aug 2022 18:23:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661530987;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kqtQy+NOInndUogagzaNGf9aMXpkbERJiqkstBfFxVk=;
	b=ICYY61Zny9M5Ip7ZX027pCps5H14ZL3B8toPONSG5cXcmeVJgLWWt0FklRMU+Av4acV7v2
	EM4NribpnTxwu1Na43p/RrES50IpPFkCuqKXOUV9H9l46Xz/f2vwWFvgW2ZBqUo6CzCsxJ
	E9Ha9TTsgULjQgz4OhRbKXrkIAfOu+s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-6NNGKZHJODuOSj9Arzu1vA-1; Fri, 26 Aug 2022 12:22:38 -0400
X-MC-Unique: 6NNGKZHJODuOSj9Arzu1vA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E4401C06EDC;
	Fri, 26 Aug 2022 16:22:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DBA72166B29;
	Fri, 26 Aug 2022 16:22:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA8081946A43;
	Fri, 26 Aug 2022 16:22:31 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9C5431946A4D
 for <dm-devel@listman.corp.redhat.com>; Fri, 26 Aug 2022 16:22:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C83F1121319; Fri, 26 Aug 2022 16:22:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 888951121315
 for <dm-devel@redhat.com>; Fri, 26 Aug 2022 16:22:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C53C802529
 for <dm-devel@redhat.com>; Fri, 26 Aug 2022 16:22:30 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-359-vEUyLvRgNSuQve5buOe18Q-1; Fri,
 26 Aug 2022 12:22:26 -0400
X-MC-Unique: vEUyLvRgNSuQve5buOe18Q-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6D67A1F938;
 Fri, 26 Aug 2022 16:22:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4352313421;
 Fri, 26 Aug 2022 16:22:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KOkCD0HzCGPocAAAMHmgww
 (envelope-from <mwilck@suse.com>); Fri, 26 Aug 2022 16:22:25 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 26 Aug 2022 18:22:02 +0200
Message-Id: <20220826162203.20317-5-mwilck@suse.com>
In-Reply-To: <20220826162203.20317-1-mwilck@suse.com>
References: <20220826162203.20317-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [dm-devel] [PATCH v3 4/5] libmultipath: check_alias_settings():
 pre-sort mptable by alias
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
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

add_binding() contains an optimization; it assumes that the list of
bindings is alphabetically sorted by alias, and tries to maintain
this order.

But conf->mptable is sorted by wwid. Therefore check_alias_settings() may take
a long time if the mptable is large.

Create a copy of the mptable, sorted by alias, and use it for add_bindings().
This speeds up check_alias_settings by roughly a factor of 10 (0.1s vs. 1s)
for my test setup with 10000 entries in the mptable.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index 548a118..af3e24f 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -672,6 +672,24 @@ static void cleanup_fclose(void *p)
 	fclose(p);
 }
 
+static int alias_compar(const void *p1, const void *p2)
+{
+	const char *alias1 = (*(struct mpentry * const *)p1)->alias;
+	const char *alias2 = (*(struct mpentry * const *)p2)->alias;
+
+	if (alias1 && alias2)
+		return strcmp(alias1, alias2);
+	else
+		/* Move NULL alias to the end */
+		return alias1 ? -1 : alias2 ? 1 : 0;
+}
+
+static void cleanup_vector_free(void *arg)
+{
+	if  (arg)
+		vector_free((vector)arg);
+}
+
 /*
  * check_alias_settings(): test for inconsistent alias configuration
  *
@@ -693,12 +711,24 @@ int check_alias_settings(const struct config *conf)
 	int can_write;
 	int rc = 0, i, fd;
 	Bindings bindings = {.allocated = 0, };
+	vector mptable = NULL;
 	struct mpentry *mpe;
 
+	mptable = vector_convert(NULL, conf->mptable, struct mpentry *, identity);
+	if (!mptable)
+		return -1;
+
 	pthread_cleanup_push_cast(free_bindings, &bindings);
-	vector_foreach_slot(conf->mptable, mpe, i) {
-		if (!mpe->wwid || !mpe->alias)
-			continue;
+	pthread_cleanup_push(cleanup_vector_free, mptable);
+
+	vector_sort(mptable, alias_compar);
+	vector_foreach_slot(mptable, mpe, i) {
+		if (!mpe->alias)
+			/*
+			 * alias_compar() sorts NULL alias at the end,
+			 * so we can stop if we encounter this.
+			 */
+			break;
 		if (add_binding(&bindings, mpe->alias, mpe->wwid) ==
 		    BINDING_CONFLICT) {
 			condlog(0, "ERROR: alias \"%s\" bound to multiple wwids in multipath.conf, "
@@ -710,6 +740,7 @@ int check_alias_settings(const struct config *conf)
 	}
 	/* This clears the bindings */
 	pthread_cleanup_pop(1);
+	pthread_cleanup_pop(1);
 
 	pthread_cleanup_push_cast(free_bindings, &bindings);
 	fd = open_file(conf->bindings_file, &can_write, BINDINGS_FILE_HEADER);
-- 
2.37.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

