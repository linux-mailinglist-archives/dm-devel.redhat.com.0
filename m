Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8625A77386B
	for <lists+dm-devel@lfdr.de>; Tue,  8 Aug 2023 08:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691477633;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PdjdYZE1W4uqQT328EVW+hq9M3T/ooojdsmAPluKGDA=;
	b=h3i+oMA3PpJENXAxsxfYtNP2u70nRmjIER8DQOz4IRJay3aWQTdqXrzajb2UTkzlk2as+/
	uQQb7tOMywPLN+985W754sPu4DpFZs6OJRmw7R2edGRlLB5/OJThu7OD3GLPPPFy4pH6Ye
	jUEtT88fRAFHmCn13GP4jXURjk59Hds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-xhxjKBmiPfSM7KOIlp2vTw-1; Tue, 08 Aug 2023 02:53:49 -0400
X-MC-Unique: xhxjKBmiPfSM7KOIlp2vTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EC3E8057AB;
	Tue,  8 Aug 2023 06:53:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E679B112131B;
	Tue,  8 Aug 2023 06:53:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BA31D1947224;
	Tue,  8 Aug 2023 06:53:33 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E0A781946587
 for <dm-devel@listman.corp.redhat.com>; Mon,  7 Aug 2023 08:34:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E564FC15BAE; Mon,  7 Aug 2023 08:34:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD791C15BAD
 for <dm-devel@redhat.com>; Mon,  7 Aug 2023 08:34:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD33B3813F21
 for <dm-devel@redhat.com>; Mon,  7 Aug 2023 08:34:14 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-156-lelvwH_GMA-y9XIwwyR-ew-1; Mon,
 07 Aug 2023 04:34:12 -0400
X-MC-Unique: lelvwH_GMA-y9XIwwyR-ew-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 44AAB218A9;
 Mon,  7 Aug 2023 08:34:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F71013487;
 Mon,  7 Aug 2023 08:34:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9RkuA4Os0GTCBwAAMHmgww
 (envelope-from <vbabka@suse.cz>); Mon, 07 Aug 2023 08:34:11 +0000
From: Vlastimil Babka <vbabka@suse.cz>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Jens Axboe <axboe@kernel.dk>
Date: Mon,  7 Aug 2023 10:33:57 +0200
Message-ID: <20230807083356.19222-2-vbabka@suse.cz>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 08 Aug 2023 06:53:24 +0000
Subject: [dm-devel] [PATCH for 6.5 regression] PM: hibernate: fix
 resume_store() return value when hibernation not available
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
Cc: loic.poulain@linaro.org, regressions@lists.linux.dev,
 linux-pm@vger.kernel.org, snitzer@kernel.org, gregkh@linuxfoundation.org,
 joern@lazybastard.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, richard@nod.at, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, hch@lst.de,
 Vlastimil Babka <vbabka@suse.cz>, vigneshr@ti.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On a laptop with hibernation set up but not actively used, and with
secure boot and lockdown enabled kernel, 6.5-rc1 gets stuck on boot with
the following repeated messages:

  A start job is running for Resume from hibernation using device /dev/system/swap (24s / no limit)
  lockdown_is_locked_down: 25311154 callbacks suppressed
  Lockdown: systemd-hiberna: hibernation is restricted; see man kernel_lockdown.7
  ...

Checking the resume code leads to commit cc89c63e2fe3 ("PM: hibernate:
move finding the resume device out of software_resume") which
inadvertently changed the return value from resume_store() to 0 when
!hibernation_available(). This apparently translates to userspace
write() returning 0 as in number of bytes written, and userspace looping
indefinitely in the attempt to write the intended value.

Fix this by returning the full number of bytes that were to be written,
as that's what was done before the commit.

Fixes: cc89c63e2fe3 ("PM: hibernate: move finding the resume device out of software_resume")
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Resend with review/ack tags added and not buried in the thread.
Link: https://lore.kernel.org/all/2cfa5f55-1d68-8a4f-d049-13f42e0d1484@suse.cz/

 kernel/power/hibernate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index e1b4bfa938dd..2b4a946a6ff5 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -1166,7 +1166,7 @@ static ssize_t resume_store(struct kobject *kobj, struct kobj_attribute *attr,
 	int error;
 
 	if (!hibernation_available())
-		return 0;
+		return n;
 
 	if (len && buf[len-1] == '\n')
 		len--;
-- 
2.41.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

