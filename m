Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2BE635EC9
	for <lists+dm-devel@lfdr.de>; Wed, 23 Nov 2022 14:03:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669208619;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+mZK7OZZ+h++cF7Z4iWAIaNV+R4DxhHzfsucYG6PRAw=;
	b=bzjYAM3f9Lp52G3zjfY3gSRuV+FCwJnYWcwFg4nz3XW2FiRPKhWGIFkLdl4nwpSDSh+Z4g
	l+ZWwXqbdDzzE5/T8AjCx4UJCNWJ3imn0wVEbipcWbXg3bjGAVEyludRQJFnnRxO457rB1
	x5r/D6ICPOxShYXwvdJa2/zb0nN1buc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-jfa8B_1lOAGY2HiVOBFDpw-1; Wed, 23 Nov 2022 08:03:32 -0500
X-MC-Unique: jfa8B_1lOAGY2HiVOBFDpw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6742E3811F2F;
	Wed, 23 Nov 2022 13:03:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F8C4492B0C;
	Wed, 23 Nov 2022 13:03:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 01C9419465A3;
	Wed, 23 Nov 2022 13:03:30 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AF6741946587
 for <dm-devel@listman.corp.redhat.com>; Wed, 23 Nov 2022 12:45:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8DD5F111E413; Wed, 23 Nov 2022 12:45:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 863DE111E410
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 12:45:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 684951C0896F
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 12:45:18 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-blZeAGqNOUuZLeU1nXkWYw-1; Wed, 23 Nov 2022 07:45:16 -0500
X-MC-Unique: blZeAGqNOUuZLeU1nXkWYw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 45B6BB81F71;
 Wed, 23 Nov 2022 12:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E06C433D6;
 Wed, 23 Nov 2022 12:45:13 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 23 Nov 2022 07:44:53 -0500
Message-Id: <20221123124458.266492-8-sashal@kernel.org>
In-Reply-To: <20221123124458.266492-1-sashal@kernel.org>
References: <20221123124458.266492-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [PATCH AUTOSEL 4.19 08/11] dm-integrity: set
 dma_alignment limit in io_hints
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
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
 Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com,
 Keith Busch <kbusch@kernel.org>, agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Keith Busch <kbusch@kernel.org>

[ Upstream commit 29aa778bb66795e6a78b1c99beadc83887827868 ]

This device mapper needs bio vectors to be sized and memory aligned to
the logical block size. Set the minimum required queue limit
accordingly.

Signed-off-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Mike Snitzer <snitzer@kernel.org>
Link: https://lore.kernel.org/r/20221110184501.2451620-5-kbusch@meta.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/md/dm-integrity.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 8456e82409e2..7492e6abb5a5 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -2564,6 +2564,7 @@ static void dm_integrity_io_hints(struct dm_target *ti, struct queue_limits *lim
 		limits->logical_block_size = ic->sectors_per_block << SECTOR_SHIFT;
 		limits->physical_block_size = ic->sectors_per_block << SECTOR_SHIFT;
 		blk_limits_io_min(limits, ic->sectors_per_block << SECTOR_SHIFT);
+		limits->dma_alignment = limits->logical_block_size - 1;
 	}
 }
 
-- 
2.35.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

