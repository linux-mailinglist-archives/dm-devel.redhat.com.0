Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA0C4084D0
	for <lists+dm-devel@lfdr.de>; Mon, 13 Sep 2021 08:40:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-SV232a4-N3Khk76WcDFX5Q-1; Mon, 13 Sep 2021 02:40:17 -0400
X-MC-Unique: SV232a4-N3Khk76WcDFX5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDB55108469A;
	Mon, 13 Sep 2021 06:40:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC6D21001281;
	Mon, 13 Sep 2021 06:40:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C86B14EA29;
	Mon, 13 Sep 2021 06:40:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18ABgxZg010182 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Sep 2021 07:42:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 017A510BC29B; Fri, 10 Sep 2021 11:42:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0CBE117C2F0
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 11:42:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 021FC800C00
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 11:42:57 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-207-2VnZ6CftPOaGvd7L8maYLg-1; Fri, 10 Sep 2021 07:42:53 -0400
X-MC-Unique: 2VnZ6CftPOaGvd7L8maYLg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0B0D422434;
	Fri, 10 Sep 2021 11:42:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B419613D34;
	Fri, 10 Sep 2021 11:42:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id qIi5KbtEO2GPOAAAMHmgww
	(envelope-from <mwilck@suse.com>); Fri, 10 Sep 2021 11:42:51 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 10 Sep 2021 13:40:51 +0200
Message-Id: <20210910114120.13665-7-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18ABgxZg010182
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 13 Sep 2021 02:39:51 -0400
Cc: lixiaokeng@huawei.com, Chongyun Wu <wu.chongyun@h3c.com>,
	dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 06/35] multipathd: fix systemd notification when
	stopping while reloading
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

After sending "RELOADING=1" to systemd, a service must send
"READY=1" before "STOPPING=1". Otherwise systemd will be confused
and will not regard the service as stopped. Subsequent attempts
to start multipathd via socket activation fail until systemd times
out the reload operation.

The problem can be reproduced by running "multipathd shutdown"
quickly after "multipathd reconfigure".

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 3aff241..67160b9 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -210,9 +210,12 @@ static void do_sd_notify(enum daemon_status old_state,
 	if (msg && !safe_sprintf(notify_msg, "STATUS=%s", msg))
 		sd_notify(0, notify_msg);
 
-	if (new_state == DAEMON_SHUTDOWN)
+	if (new_state == DAEMON_SHUTDOWN) {
+		/* Tell systemd that we're not RELOADING any more */
+		if (old_state == DAEMON_CONFIGURE && startup_done)
+			sd_notify(0, "READY=1");
 		sd_notify(0, "STOPPING=1");
-	else if (new_state == DAEMON_IDLE && old_state == DAEMON_CONFIGURE) {
+	} else if (new_state == DAEMON_IDLE && old_state == DAEMON_CONFIGURE) {
 		sd_notify(0, "READY=1");
 		startup_done = true;
 	} else if (new_state == DAEMON_CONFIGURE && startup_done)
-- 
2.33.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

