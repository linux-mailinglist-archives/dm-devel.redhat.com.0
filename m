Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8483926C521
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 18:27:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-oXf2sIQbPC-xWB5ttZxEMA-1; Wed, 16 Sep 2020 12:27:39 -0400
X-MC-Unique: oXf2sIQbPC-xWB5ttZxEMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BADD3186DD27;
	Wed, 16 Sep 2020 16:27:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5DD219728;
	Wed, 16 Sep 2020 16:27:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBF6844A6A;
	Wed, 16 Sep 2020 16:27:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GGRGOc029144 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 12:27:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 436C4F5CC4; Wed, 16 Sep 2020 16:27:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D33FF556E
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 16:27:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E69A918AE953
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 16:27:13 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-503-_8F3ulT9NzKMXAWNnWVgSQ-1;
	Wed, 16 Sep 2020 12:27:11 -0400
X-MC-Unique: _8F3ulT9NzKMXAWNnWVgSQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0BFDBB46E;
	Wed, 16 Sep 2020 16:27:24 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Sep 2020 18:26:58 +0200
Message-Id: <20200916162658.3818-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GGRGOc029144
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] libmultipath: fix memory leak in
	_check_bindings_file
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

We must pass "&line" to the cleanup function, not "line".

Fixes: "libmultipath: add consistency check for alias settings"
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 2 +-
 libmultipath/util.c  | 8 ++++++++
 libmultipath/util.h  | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index de28f25..a7ba485 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -580,7 +580,7 @@ static int _check_bindings_file(const struct config *conf, FILE *file,
 	size_t line_len = 0;
 	ssize_t n;
 
-	pthread_cleanup_push(free, line);
+	pthread_cleanup_push(cleanup_free_ptr, &line);
 	while ((n = getline(&line, &line_len, file)) >= 0) {
 		char *c, *alias, *wwid, *saveptr;
 		const char *mpe_wwid;
diff --git a/libmultipath/util.c b/libmultipath/util.c
index 8412d30..395c710 100644
--- a/libmultipath/util.c
+++ b/libmultipath/util.c
@@ -406,6 +406,14 @@ void cleanup_mutex(void *arg)
 	pthread_mutex_unlock(arg);
 }
 
+void cleanup_free_ptr(void *arg)
+{
+	void **p = arg;
+
+	if (p && *p)
+		free(*p);
+}
+
 struct bitfield *alloc_bitfield(unsigned int maxbit)
 {
 	unsigned int n;
diff --git a/libmultipath/util.h b/libmultipath/util.h
index 94ed872..21a4088 100644
--- a/libmultipath/util.h
+++ b/libmultipath/util.h
@@ -49,6 +49,7 @@ int should_exit(void);
 
 void close_fd(void *arg);
 void cleanup_mutex(void *arg);
+void cleanup_free_ptr(void *arg);
 
 struct scandir_result {
 	struct dirent **di;
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

