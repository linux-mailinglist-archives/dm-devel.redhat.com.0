Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 50C382772E6
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:45:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-ocZa0JQpN9udiszw_yBCpA-1; Thu, 24 Sep 2020 09:45:17 -0400
X-MC-Unique: ocZa0JQpN9udiszw_yBCpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43083188C139;
	Thu, 24 Sep 2020 13:45:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A9CA1002C08;
	Thu, 24 Sep 2020 13:45:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C28B71826D33;
	Thu, 24 Sep 2020 13:45:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfjFb026813 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B455C2166BA3; Thu, 24 Sep 2020 13:41:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB362166BA0
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97306186E146
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:45 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-254-hO37630DM3m72nv9VnBRKg-1;
	Thu, 24 Sep 2020 09:41:41 -0400
X-MC-Unique: hO37630DM3m72nv9VnBRKg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2D3D7B128;
	Thu, 24 Sep 2020 13:41:39 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:40 +0200
Message-Id: <20200924134054.14632-10-mwilck@suse.com>
In-Reply-To: <20200924134054.14632-1-mwilck@suse.com>
References: <20200924134054.14632-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfjFb026813
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 09/23] multipathd: close pidfile on exit
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

It seems we've been doing this only in the failure case, for ages.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 3db051b..44c1bd1 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -132,6 +132,7 @@ static pthread_cond_t config_cond;
 static pthread_t check_thr, uevent_thr, uxlsnr_thr, uevq_thr, dmevent_thr;
 static bool check_thr_started, uevent_thr_started, uxlsnr_thr_started,
 	uevq_thr_started, dmevent_thr_started;
+static int pid_fd = -1;
 
 static inline enum daemon_status get_running_state(void)
 {
@@ -2894,6 +2895,8 @@ set_oom_adj (void)
 
 static void cleanup_pidfile(void)
 {
+	if (pid_fd >= 0)
+		close(pid_fd);
 	condlog(3, "unlink pidfile");
 	unlink(DEFAULT_PIDFILE);
 }
@@ -3026,7 +3029,6 @@ child (__attribute__((unused)) void *param)
 	pthread_attr_t log_attr, misc_attr, uevent_attr;
 	struct vectors * vecs;
 	int rc;
-	int pid_fd = -1;
 	struct config *conf;
 	char *envp;
 	enum daemon_status state;
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

