Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A421124DB54
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 18:38:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-ukXMDY-HOHqnlk-6hYbyTA-1; Fri, 21 Aug 2020 12:38:13 -0400
X-MC-Unique: ukXMDY-HOHqnlk-6hYbyTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E7B41885D8D;
	Fri, 21 Aug 2020 16:38:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F77C7AED6;
	Fri, 21 Aug 2020 16:38:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51390181A06B;
	Fri, 21 Aug 2020 16:37:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07L9h7f7003719 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 05:43:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A812100BCA6; Fri, 21 Aug 2020 09:43:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5E13100BCA5
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 09:43:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E140186E145
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 09:43:05 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-544--p9qA1WFOBmkgRfLjz5eog-1; Fri, 21 Aug 2020 05:42:59 -0400
X-MC-Unique: -p9qA1WFOBmkgRfLjz5eog-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 42BF04719393A9A8F56B;
	Fri, 21 Aug 2020 17:27:14 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Fri, 21 Aug 2020
	17:27:03 +0800
From: Ye Bin <yebin10@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Fri, 21 Aug 2020 17:26:47 +0800
Message-ID: <20200821092651.1587859-1-yebin10@huawei.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07L9h7f7003719
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 21 Aug 2020 12:37:46 -0400
Cc: yebin10@huawei.com
Subject: [dm-devel] [PATCH 0/4] Fix use-after-free in dm_bm_set_read_only
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ye Bin (4):
  dm thin metadata: Avoid return pmd->bm wild pointer when process with
    error
  dm thin metadata: Fix use-after-free in dm_bm_set_read_only
  dm cache metadata: Avoid return pmd->bm wild pointer when process with
    error
  dm cache metadata: Avoid use-after-free in
    dm_cache_metadata_set_read_only

 drivers/md/dm-cache-metadata.c | 14 ++++++++++----
 drivers/md/dm-thin-metadata.c  | 14 ++++++++++----
 2 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

