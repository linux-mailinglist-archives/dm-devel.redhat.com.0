Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D595B406AD7
	for <lists+dm-devel@lfdr.de>; Fri, 10 Sep 2021 13:43:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-HWo6UXZaPCaLdWAd72X1Zg-1; Fri, 10 Sep 2021 07:43:29 -0400
X-MC-Unique: HWo6UXZaPCaLdWAd72X1Zg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 060CD802CB7;
	Fri, 10 Sep 2021 11:43:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D40581B46D;
	Fri, 10 Sep 2021 11:43:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 926FB1805986;
	Fri, 10 Sep 2021 11:43:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18ABh0nW010225 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Sep 2021 07:43:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 400DC63536; Fri, 10 Sep 2021 11:43:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B6481FA864
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 11:43:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 235B8100B8C2
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 11:43:00 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-162-w0C43yZVPWWPvNY6yzVFug-1; Fri, 10 Sep 2021 07:42:57 -0400
X-MC-Unique: w0C43yZVPWWPvNY6yzVFug-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9131A22434;
	Fri, 10 Sep 2021 11:42:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3945013D34;
	Fri, 10 Sep 2021 11:42:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id MDYBDMBEO2GPOAAAMHmgww
	(envelope-from <mwilck@suse.com>); Fri, 10 Sep 2021 11:42:56 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 10 Sep 2021 13:41:03 +0200
Message-Id: <20210910114120.13665-19-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18ABh0nW010225
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, Chongyun Wu <wu.chongyun@h3c.com>,
	dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 18/35] multipathd: uxlsnr: avoid using fd -1 in
	ppoll()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Minor edit: if notifications are off, we set the poll fd to
-1 but still use the POLLIN mask. It looks nicer if to poll
the correct fd, but reset the event mask to 0 if we're not
actually interested in it.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/uxlsnr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
index 6506109..98a9f71 100644
--- a/multipathd/uxlsnr.c
+++ b/multipathd/uxlsnr.c
@@ -357,11 +357,11 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 		}
 
 		reset_watch(notify_fd, &wds, &sequence_nr);
+		polls[POLLFD_NOTIFY].fd = notify_fd;
 		if (notify_fd == -1 || (wds.conf_wd == -1 && wds.dir_wd == -1))
-			polls[POLLFD_NOTIFY].fd = -1;
+			polls[POLLFD_NOTIFY].events = 0;
 		else
-			polls[POLLFD_NOTIFY].fd = notify_fd;
-		polls[POLLFD_NOTIFY].events = POLLIN;
+			polls[POLLFD_NOTIFY].events = POLLIN;
 
 		/* setup the clients */
 		i = POLLFDS_BASE;
-- 
2.33.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

