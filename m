Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6B94525882A
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 08:27:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-g6kednaGMPyzXloIMLDdBQ-1; Tue, 01 Sep 2020 02:27:17 -0400
X-MC-Unique: g6kednaGMPyzXloIMLDdBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B940A1005E78;
	Tue,  1 Sep 2020 06:27:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78EF026335;
	Tue,  1 Sep 2020 06:27:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26EB2180B656;
	Tue,  1 Sep 2020 06:27:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0816QTHQ015836 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Sep 2020 02:26:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6567D110E9A8; Tue,  1 Sep 2020 06:26:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FA16110E99B
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 06:26:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5271A185A78B
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 06:26:27 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-358-iXIPfvvfOBK1rb0n9W80ew-1; Tue, 01 Sep 2020 02:26:23 -0400
X-MC-Unique: iXIPfvvfOBK1rb0n9W80ew-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id B6E97EC9822F2FD6B362;
	Tue,  1 Sep 2020 14:26:18 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Sep 2020
	14:26:11 +0800
From: Ye Bin <yebin10@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Tue, 1 Sep 2020 14:25:41 +0800
Message-ID: <20200901062544.827277-1-yebin10@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0816QTHQ015836
X-loop: dm-devel@redhat.com
Cc: Ye Bin <yebin10@huawei.com>
Subject: [dm-devel] [PATCH v2 0/3] Fix use-after-free in dm_bm_set_read_only
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ye Bin (3):
  dm cache metadata: Avoid return pmd->bm wild pointer when process with
    error
  dm thin metadata: Avoid return pmd->bm wild pointer when process with
    error
  dm thin metadata: Fix use-after-free in dm_bm_set_read_only

 drivers/md/dm-cache-metadata.c                |  8 ++++++--
 drivers/md/dm-thin-metadata.c                 | 10 +++++++---
 drivers/md/persistent-data/dm-block-manager.c | 14 ++++++++------
 3 files changed, 21 insertions(+), 11 deletions(-)

-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

