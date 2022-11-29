Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6868363B7CF
	for <lists+dm-devel@lfdr.de>; Tue, 29 Nov 2022 03:28:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669688905;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=96Mv/CGopARcxcgBKMqkUsPtVod+rFqVz0fsA9OaGvI=;
	b=Pn6UiVn4J3+ofU3Z0xFODAaFdPBeyf15b2NPgwr+YII+J8rH6Q/B113+kzeZMUcurVe2z7
	VNbK+QcDVz91DZTSX1x7n934r1bwdqXje6DdsuejxPAVEyNQv3ulwNji1iMGwYy8a/YbTi
	wx6rMfNILyTXqO9m/XTKfbkeI7SoJ2E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-4YuZRR4oOq2yhxiynPm01A-1; Mon, 28 Nov 2022 21:28:22 -0500
X-MC-Unique: 4YuZRR4oOq2yhxiynPm01A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AD082999B36;
	Tue, 29 Nov 2022 02:28:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1533339D7C;
	Tue, 29 Nov 2022 02:28:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 11E521946A43;
	Tue, 29 Nov 2022 02:28:12 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 172081946594
 for <dm-devel@listman.corp.redhat.com>; Tue, 29 Nov 2022 02:28:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EED9D18EB4; Tue, 29 Nov 2022 02:28:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E794617595
 for <dm-devel@redhat.com>; Tue, 29 Nov 2022 02:28:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C62811C068C3
 for <dm-devel@redhat.com>; Tue, 29 Nov 2022 02:28:10 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (hwsga01-in.huaweimarine.com
 [45.249.212.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-159-KwnlUIKHPWyULTd6wZCvyQ-1; Mon, 28 Nov 2022 21:28:08 -0500
X-MC-Unique: KwnlUIKHPWyULTd6wZCvyQ-1
Received: from mail02.huawei.com (unknown [172.30.67.153])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NLmTV260Hz4f3pFW;
 Tue, 29 Nov 2022 10:27:58 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.127.227])
 by APP1 (Coremail) with SMTP id cCh0CgBHPaweboVjlJ0JBQ--.11870S4;
 Tue, 29 Nov 2022 10:28:01 +0800 (CST)
From: Luo Meng <luomeng12@huawei.com>
To: agk@redhat.com, snitzer@kernel.org, dm-devel@redhat.com, ejt@redhat.com
Date: Tue, 29 Nov 2022 10:48:46 +0800
Message-Id: <20221129024850.1842973-1-luomeng12@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBHPaweboVjlJ0JBQ--.11870S4
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY47kC6x804xWl14x267AKxVW8JVW5JwAF
 c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
 0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xv
 wVC0I7IYx2IY6xkF7I0E14v26rxl6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjc
 xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
 07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
 18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
 r41l42xK82IYc2Ij64vIr41l42xK82IY64kExVAvwVAq07x20xyl4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
 C2KfnxnUUI43ZEXa7IU1VHq3UUUUU==
X-CM-SenderInfo: 5oxrzvtqj6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [dm-devel] [dm-devel v2 0/4] dm: Fix UAF in run_timer_softirq()
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
Cc: luomeng12@huawei.com, yukuai3@huawei.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

*** BLURB HERE ***

Luo Meng (4):
  dm thin: Fix UAF in run_timer_softirq()
  dm clone: Fix UAF in clone_dtr()
  dm cache: Fix UAF in destroy()
  dm integrity: Fix UAF in dm_integrity_dtr()

 drivers/md/dm-cache-target.c | 1 +
 drivers/md/dm-clone-target.c | 1 +
 drivers/md/dm-integrity.c    | 2 ++
 drivers/md/dm-thin.c         | 2 ++
 4 files changed, 6 insertions(+)

-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

