Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEEA625A29
	for <lists+dm-devel@lfdr.de>; Fri, 11 Nov 2022 13:05:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668168341;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IRsQ6R5A/o+ii4koCmesdjfVeFv6YO5eVvd7tsne4l0=;
	b=ixsRqu54UHA5Z8tdGRDCUtj0y4QU6JpQ31BYy0W2IwpVZu/Jdl2yVl43oZZD3+2Ew/KH54
	xIMtSxr0bpvZHlJjePSZT1vHmooNA3S01M+jKm6nW4HK1SU/n55S+ogEUiP6ciocvU0/3n
	73mnU1JlU8qVCcOPH4E9FuuopPB+6Ek=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-aNBXtGozOiG8jYmmxy-TNQ-1; Fri, 11 Nov 2022 07:05:40 -0500
X-MC-Unique: aNBXtGozOiG8jYmmxy-TNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88D6A858F13;
	Fri, 11 Nov 2022 12:05:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 769032166B26;
	Fri, 11 Nov 2022 12:05:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CFE4B19465B7;
	Fri, 11 Nov 2022 12:05:28 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 357161946586
 for <dm-devel@listman.corp.redhat.com>; Fri, 11 Nov 2022 12:05:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 16CF21415127; Fri, 11 Nov 2022 12:05:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EAD9140EBF5
 for <dm-devel@redhat.com>; Fri, 11 Nov 2022 12:05:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9DE7882820
 for <dm-devel@redhat.com>; Fri, 11 Nov 2022 12:05:26 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-KSRIz3niO-aeLInIxlsHhw-1; Fri, 11 Nov 2022 07:05:23 -0500
X-MC-Unique: KSRIz3niO-aeLInIxlsHhw-1
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N7xmv4nKQzmV6p;
 Fri, 11 Nov 2022 19:48:47 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 11 Nov 2022 19:49:03 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 19:49:02 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <snitzer@kernel.org>, <Martin.Wilck@suse.com>, <ejt@redhat.com>,
 <jack@suse.cz>, <tytso@mit.edu>, <yi.zhang@huawei.com>,
 <chengzhihao1@huawei.com>
Date: Fri, 11 Nov 2022 20:10:26 +0800
Message-ID: <20221111121029.3985561-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] [PATCH 0/3] dm thin: Fix ABBA deadlock between
 shrink_slab and dm_pool_abort_metadata
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
Cc: dm-devel@redhat.com, linux-ext4@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Zhihao Cheng (3):
  dm bufio: Fix missing decrement of no_sleep_enabled if
    dm_bufio_client_create failed
  dm bufio: Split main logic out of dm_bufio_client creation/destroy
  dm thin: Fix ABBA deadlock between shrink_slab and
    dm_pool_abort_metadata

 drivers/md/dm-bufio.c                         | 189 +++++++++++++-----
 drivers/md/dm-thin-metadata.c                 |  36 +++-
 drivers/md/persistent-data/dm-block-manager.c |  21 ++
 drivers/md/persistent-data/dm-block-manager.h |   4 +
 include/linux/dm-bufio.h                      |  14 +-
 5 files changed, 214 insertions(+), 50 deletions(-)

-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

