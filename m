Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 671955AC9DF
	for <lists+dm-devel@lfdr.de>; Mon,  5 Sep 2022 07:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662357098;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xNT8gyGQI0y0W0ok8jkDF5wdb/0Aq0aGk8OEO9kKVGo=;
	b=GJdweri/+Xk16JBIbPLb/q0orPSbpa/D30K/PpNP5hPSwjnKGLiLsarT08Lnmv+P6RZhOE
	8GqMl0KLbThVWczgtNY7QgTUR3T9nUxeTK92HHiRpmd+ojc55i52saHr/h6lyxv8AhbLMc
	nS5ehxf9R8vIQfZi++ZyC7wflTMwDFA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-ybTwLCT2ND6uhd2VKjIucg-1; Mon, 05 Sep 2022 01:51:35 -0400
X-MC-Unique: ybTwLCT2ND6uhd2VKjIucg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 210A83815D2C;
	Mon,  5 Sep 2022 05:51:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94EE7492CA4;
	Mon,  5 Sep 2022 05:51:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2A126193F518;
	Mon,  5 Sep 2022 05:51:24 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 304611946A47
 for <dm-devel@listman.corp.redhat.com>; Mon,  5 Sep 2022 03:01:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 04A8940C141D; Mon,  5 Sep 2022 03:01:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 013CF4010D42
 for <dm-devel@redhat.com>; Mon,  5 Sep 2022 03:01:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE6D08037AC
 for <dm-devel@redhat.com>; Mon,  5 Sep 2022 03:01:42 +0000 (UTC)
Received: from mail-m972.mail.163.com (mail-m972.mail.163.com
 [123.126.97.2]) by relay.mimecast.com with ESMTP id
 us-mta-158-NetSMNFiOWSXyrLlVJpmDg-1; Sun, 04 Sep 2022 23:01:40 -0400
X-MC-Unique: NetSMNFiOWSXyrLlVJpmDg-1
Received: from localhost.localdomain (unknown [116.128.244.169])
 by smtp2 (Coremail) with SMTP id GtxpCgA32ubnYhVjnBptaw--.45088S2;
 Mon, 05 Sep 2022 10:46:01 +0800 (CST)
From: Jiangshan Yi <13667453960@163.com>
To: agk@redhat.com,
	snitzer@kernel.org
Date: Mon,  5 Sep 2022 10:45:52 +0800
Message-Id: <20220905024552.1200248-1-13667453960@163.com>
MIME-Version: 1.0
X-CM-TRANSID: GtxpCgA32ubnYhVjnBptaw--.45088S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrury7Jr47ZFy5GrW8Kr13CFg_yoWfZrX_uw
 18X34jgrWUG34F9w15ta1avFy0ya98WrWkXF1avanxZa98Zw47CayDCr13K3WDCFyUtF15
 Zwn8t3WrA3s0qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU16BT7UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: bprtllyxuvjmiwq6il2tof0z/1tbiyBJz+1p7HmciEQABs4
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Mon, 05 Sep 2022 05:51:23 +0000
Subject: [dm-devel] [PATCH] dm-raid: fix spelling typo in comment
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
Cc: dm-devel@redhat.com, k2ci <kernel-bot@kylinos.cn>,
 linux-kernel@vger.kernel.org, Jiangshan Yi <yijiangshan@kylinos.cn>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jiangshan Yi <yijiangshan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/md/dm-raid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index c640be453313..0a30a22bebf0 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -2590,7 +2590,7 @@ static int analyse_superblocks(struct dm_target *ti, struct raid_set *rs)
 
 /*
  * Adjust data_offset and new_data_offset on all disk members of @rs
- * for out of place reshaping if requested by contructor
+ * for out of place reshaping if requested by constructor
  *
  * We need free space at the beginning of each raid disk for forward
  * and at the end for backward reshapes which userspace has to provide
-- 
2.27.0


No virus found
		Checked by Hillstone Network AntiVirus

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

