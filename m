Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA520451524
	for <lists+dm-devel@lfdr.de>; Mon, 15 Nov 2021 21:24:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-kOZCv5oLMpKpDgWWTD53Rw-1; Mon, 15 Nov 2021 15:24:00 -0500
X-MC-Unique: kOZCv5oLMpKpDgWWTD53Rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FA348799EC;
	Mon, 15 Nov 2021 20:23:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C76975D6D7;
	Mon, 15 Nov 2021 20:23:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D7081806D03;
	Mon, 15 Nov 2021 20:23:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AFKMFXY015162 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 15 Nov 2021 15:22:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A44C040CFD10; Mon, 15 Nov 2021 20:22:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EE7A4010FE9
	for <dm-devel@redhat.com>; Mon, 15 Nov 2021 20:22:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8405E1066689
	for <dm-devel@redhat.com>; Mon, 15 Nov 2021 20:22:15 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-601-NhGjhrPpNvKhdMHqdeHWEA-1; Mon, 15 Nov 2021 15:22:13 -0500
X-MC-Unique: NhGjhrPpNvKhdMHqdeHWEA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F36B21954;
	Mon, 15 Nov 2021 20:22:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB6C313A95;
	Mon, 15 Nov 2021 20:22:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id CFBvM3PBkmGRDAAAMHmgww
	(envelope-from <mwilck@suse.com>); Mon, 15 Nov 2021 20:22:11 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 15 Nov 2021 21:22:01 +0100
Message-Id: <20211115202201.755-3-mwilck@suse.com>
In-Reply-To: <20211115202201.755-1-mwilck@suse.com>
References: <20211115202201.755-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1AFKMFXY015162
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 3/3] kpartx: find_unused_loop_device(): add
	newlines
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

... to avoid these messages being joined with the error message
from the caller.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/lopart.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kpartx/lopart.c b/kpartx/lopart.c
index fccb522..ba9f2c0 100644
--- a/kpartx/lopart.c
+++ b/kpartx/lopart.c
@@ -209,26 +209,26 @@ nothing_found:
 	}
 
 	if (!somedev)
-		fprintf(stderr, "mount: could not find any device /dev/loop#");
+		fprintf(stderr, "mount: could not find any device /dev/loop#\n");
 
 	else if (!someloop) {
 		if (loop_known == 1)
 			fprintf(stderr,
 				"mount: Could not find any loop device.\n"
-				"       Maybe /dev/loop# has a wrong major number?");
+				"       Maybe /dev/loop# has a wrong major number?\n");
 		else if (loop_known == -1)
 			fprintf(stderr,
 				"mount: Could not find any loop device, and, according to %s,\n"
 				"       this kernel does not know about the loop device.\n"
-				"       (If so, then recompile or `modprobe loop'.)",
+				"       (If so, then recompile or `modprobe loop'.)\n",
 				PROC_DEVICES);
 		else
 			fprintf(stderr,
 				"mount: Could not find any loop device. Maybe this kernel does not know\n"
 				"       about the loop device (then recompile or `modprobe loop'), or\n"
-				"       maybe /dev/loop# has the wrong major number?");
+				"       maybe /dev/loop# has the wrong major number?\n");
 	} else
-		fprintf(stderr, "mount: could not find any free loop device");
+		fprintf(stderr, "mount: could not find any free loop device\n");
 	return NULL;
 }
 
-- 
2.33.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

