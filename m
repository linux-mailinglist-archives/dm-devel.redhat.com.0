Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB21406AED
	for <lists+dm-devel@lfdr.de>; Fri, 10 Sep 2021 13:44:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-e_wJ5jSjPfypFYFdHLAe4A-1; Fri, 10 Sep 2021 07:43:43 -0400
X-MC-Unique: e_wJ5jSjPfypFYFdHLAe4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B13B36302;
	Fri, 10 Sep 2021 11:43:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 149C319D9F;
	Fri, 10 Sep 2021 11:43:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C82CA1832DDA;
	Fri, 10 Sep 2021 11:43:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18ABh5Kt010364 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Sep 2021 07:43:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6FADE20BC8F1; Fri, 10 Sep 2021 11:43:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A65420807EA
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 11:43:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53968101A529
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 11:43:05 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-272-9czQbyi1NtG9NESM2cFspA-1; Fri, 10 Sep 2021 07:43:01 -0400
X-MC-Unique: 9czQbyi1NtG9NESM2cFspA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6409F20063;
	Fri, 10 Sep 2021 11:43:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14F5B13D34;
	Fri, 10 Sep 2021 11:43:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id CP0QA8REO2GPOAAAMHmgww
	(envelope-from <mwilck@suse.com>); Fri, 10 Sep 2021 11:43:00 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 10 Sep 2021 13:41:13 +0200
Message-Id: <20210910114120.13665-29-mwilck@suse.com>
In-Reply-To: <20210910114120.13665-1-mwilck@suse.com>
References: <20210910114120.13665-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18ABh5Kt010364
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, Chongyun Wu <wu.chongyun@h3c.com>,
	dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 28/35] multipathd: uxlsnr: move handler execution
	to separate function
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Move the actual execution of the handler out of parse_cmd(). For now,
we do it in uxsock_trigger().

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/uxlsnr.c | 47 ++++++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
index 65cb5ca..cfff0ae 100644
--- a/multipathd/uxlsnr.c
+++ b/multipathd/uxlsnr.c
@@ -293,11 +293,9 @@ static void handle_inotify(int fd, struct watch_descriptors *wds)
 
 static const struct timespec ts_zero = { .tv_sec = 0, };
 
-static int parse_cmd (struct client *c, void *data, int timeout)
+static int parse_cmd(struct client *c)
 {
 	int r;
-	struct handler * h;
-	struct timespec tmo;
 
 	r = get_cmdvec(c->cmd, &c->cmdvec);
 
@@ -308,26 +306,35 @@ static int parse_cmd (struct client *c, void *data, int timeout)
 		return 0;
 	}
 
-	h = find_handler_for_cmdvec(c->cmdvec);
+	c->handler = find_handler_for_cmdvec(c->cmdvec);
 
-	if (!h || !h->fn) {
+	if (!c->handler || !c->handler->fn) {
 		genhelp_handler(c->cmd, EINVAL, &c->reply);
 		if (get_strbuf_len(&c->reply) == 0)
 			r = EINVAL;
-		goto free_cmdvec;
+		else
+			r = 0;
 	}
 
-	/*
-	 * execute handler
-	 */
+	return r;
+}
+
+static int execute_handler(struct client *c, struct vectors *vecs, int timeout)
+{
+	int r;
+	struct timespec tmo;
+
+	if (!c->handler)
+		return EINVAL;
+
 	if (clock_gettime(CLOCK_REALTIME, &tmo) == 0) {
 		tmo.tv_sec += timeout;
 	} else {
 		tmo.tv_sec = 0;
 	}
-	if (h->locked) {
+
+	if (c->handler->locked) {
 		int locked = 0;
-		struct vectors * vecs = (struct vectors *)data;
 
 		pthread_cleanup_push(cleanup_lock, &vecs->lock);
 		if (tmo.tv_sec) {
@@ -339,15 +346,11 @@ static int parse_cmd (struct client *c, void *data, int timeout)
 		if (r == 0) {
 			locked = 1;
 			pthread_testcancel();
-			r = h->fn(c->cmdvec, &c->reply, data);
+			r = c->handler->fn(c->cmdvec, &c->reply, vecs);
 		}
 		pthread_cleanup_pop(locked);
 	} else
-		r = h->fn(c->cmdvec, &c->reply, data);
-
-free_cmdvec:
-	free_keys(c->cmdvec);
-	c->cmdvec = NULL;
+		r = c->handler->fn(c->cmdvec, &c->reply, vecs);
 
 	return r;
 }
@@ -367,7 +370,15 @@ static int uxsock_trigger(struct client *c, void *trigger_data)
 		return r;
 	}
 
-	r = parse_cmd(c, vecs, uxsock_timeout / 1000);
+	r = parse_cmd(c);
+
+	if (r == 0 && c->handler)
+		r = execute_handler(c, vecs, uxsock_timeout / 1000);
+
+	if (c->cmdvec) {
+		free_keys(c->cmdvec);
+		c->cmdvec = NULL;
+	}
 
 	if (r > 0) {
 		if (r == ETIMEDOUT)
-- 
2.33.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

