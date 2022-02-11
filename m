Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A31C24B2FC6
	for <lists+dm-devel@lfdr.de>; Fri, 11 Feb 2022 22:47:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644616048;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tM0GVT635qzrKuyZ0SEbbClUVbG/sK/erXQVFeTkSm8=;
	b=DW2Y2diqIo3bLhltMXtpFTkaU9FKdseEJe/LxwCOcfx0Fv4G5GouoZbKUgMY76QkXr8B2z
	udWga09aqBmC43wcLesdQ7qlJoesnn5m2+jLXRhhUaIo8eFHJ2i8R9CLmSx7Ek155hEcRL
	VQI4L5y0cNiOzVne2Xk5cyl47IcTpLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-ePV872U-Nqqul1tfdvd-xQ-1; Fri, 11 Feb 2022 16:47:26 -0500
X-MC-Unique: ePV872U-Nqqul1tfdvd-xQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B305192781C;
	Fri, 11 Feb 2022 21:47:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 743E179C59;
	Fri, 11 Feb 2022 21:47:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F2391806D1C;
	Fri, 11 Feb 2022 21:47:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21BLfpmZ024858 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Feb 2022 16:41:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5EAD240E7F20; Fri, 11 Feb 2022 21:41:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ABFD40E7F1F
	for <dm-devel@redhat.com>; Fri, 11 Feb 2022 21:41:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 866A48027FA
	for <dm-devel@redhat.com>; Fri, 11 Feb 2022 21:41:40 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-119-ARY7WyDbM52lKOaULgW2Hw-1; Fri, 11 Feb 2022 16:41:28 -0500
X-MC-Unique: ARY7WyDbM52lKOaULgW2Hw-1
Received: by mail-ot1-f69.google.com with SMTP id
	r16-20020a9d7510000000b0059ea94f86eeso6051154otk.8
	for <dm-devel@redhat.com>; Fri, 11 Feb 2022 13:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tpMNyPQ6L7rwPA4GSYE86kruce/OO/n8Rw3lkBYRqxc=;
	b=Y6dod3vWNbBW4lgjEvfuLgyRVHGoy0QHGtbL0w+W3qn+ejyH0SGIMAmCeWpNU9PxcB
	+96K1Vhb0a8CXdK76S0PaXddeYtdT4WQjEEBlo+N/e5ijN38vABDddAIaJzMAvLH7D3g
	5hhiR24CAh0yV5OKFY9jA3miN99Mdi6LSTl6pKY2ZehAsdyIsitFfgttWuP/xBoO9R98
	iNxrfP2m0Ta5g+xuvYa5bhUrhEfbVFFLbojNNy1omNDpDrd4JgJ/sLmA6gW1zHFK3PMQ
	RdCvth0eSE5PajUUUjnhqjduD7dLgPpbKM6I9U/ZqIzAO6SDscsYbcyl6QwoVA9w84vk
	+aLQ==
X-Gm-Message-State: AOAM533K8eh1gqcFoXOo27qoVG7SjyExl+wKZKtfAkrSoVzOkf9d9vCe
	GIu3ojq8JAMmE6heEDeIwod3pisRrm0ioyOXoeCnMFaFiv7mvKySQAcDxt0Kw2ofIAPFMADKnlW
	Z1fBKOWxkw78dMevfgc1ciLgtMoqsVKFLQbOGNPLT+jP0yKuw4CIRmWy7A6pzZgk+oA==
X-Received: by 2002:a9d:d4c:: with SMTP id 70mr1309174oti.45.1644615687313;
	Fri, 11 Feb 2022 13:41:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzf5gLazt1jBAQ7XMES2H7/5Hj/cMuqHfTH9oJBaRY1iZVevTkFbiJNV2fzrRS7uVQpcASPzQ==
X-Received: by 2002:a9d:d4c:: with SMTP id 70mr1309164oti.45.1644615686831;
	Fri, 11 Feb 2022 13:41:26 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	p11sm10506598oiv.17.2022.02.11.13.41.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Feb 2022 13:41:26 -0800 (PST)
From: Mike Snitzer <snitzer@redhat.com>
To: dm-devel@redhat.com
Date: Fri, 11 Feb 2022 16:40:56 -0500
Message-Id: <20220211214057.40612-14-snitzer@redhat.com>
In-Reply-To: <20220211214057.40612-1-snitzer@redhat.com>
References: <20220211214057.40612-1-snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org
Subject: [dm-devel] [PATCH v2 13/14] dm delay: use dm_submit_bio_remap
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm-delay.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-delay.c b/drivers/md/dm-delay.c
index 59e51d285b0e..9a51bf51a859 100644
--- a/drivers/md/dm-delay.c
+++ b/drivers/md/dm-delay.c
@@ -72,7 +72,7 @@ static void flush_bios(struct bio *bio)
 	while (bio) {
 		n = bio->bi_next;
 		bio->bi_next = NULL;
-		submit_bio_noacct(bio);
+		dm_submit_bio_remap(bio, NULL);
 		bio = n;
 	}
 }
@@ -232,6 +232,7 @@ static int delay_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	ti->num_flush_bios = 1;
 	ti->num_discard_bios = 1;
+	ti->accounts_remapped_io = true;
 	ti->per_io_data_size = sizeof(struct dm_delay_info);
 	return 0;
 
@@ -355,7 +356,7 @@ static int delay_iterate_devices(struct dm_target *ti,
 
 static struct target_type delay_target = {
 	.name	     = "delay",
-	.version     = {1, 2, 1},
+	.version     = {1, 3, 0},
 	.features    = DM_TARGET_PASSES_INTEGRITY,
 	.module      = THIS_MODULE,
 	.ctr	     = delay_ctr,
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

