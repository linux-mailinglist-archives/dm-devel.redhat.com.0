Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 752C424552F
	for <lists+dm-devel@lfdr.de>; Sun, 16 Aug 2020 03:42:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-4KhagLQjP2aEyrYF5-7HoA-1; Sat, 15 Aug 2020 21:42:21 -0400
X-MC-Unique: 4KhagLQjP2aEyrYF5-7HoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 287E9801A9D;
	Sun, 16 Aug 2020 01:42:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1E6C10013C1;
	Sun, 16 Aug 2020 01:42:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1718A4EE19;
	Sun, 16 Aug 2020 01:41:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07G1fW2L023913 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 15 Aug 2020 21:41:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87106202278E; Sun, 16 Aug 2020 01:41:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8246C202278B
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 01:41:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA68985A5A7
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 01:41:29 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-10-pxN6gWVvOACIvf1fSSx68A-1; Sat, 15 Aug 2020 21:41:27 -0400
X-MC-Unique: pxN6gWVvOACIvf1fSSx68A-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id CCC1BD69E964C2A622EC;
	Sun, 16 Aug 2020 09:41:22 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0;
	Sun, 16 Aug 2020 09:41:12 +0800
To: <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
Date: Sun, 16 Aug 2020 09:41:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>,
	liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH 0/6] multipath-tools series: some cleanups and
	fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


When I learn and review the multipath-tools source code, I find
some cleanups and fixes.

repo: openSUSE/multipath-tools
repo link: https://github.com/openSUSE/multipath-tools
branch: upstream-queue

ZhiqiangLiu (6):
  checker: remove useless name check in checker_get func
  multipathd: adopt static char* arr in daemon_status
  multipathd: adopt static char* arr in sd_notify_status func
  libmultipath: check blist before calling MALLOC in alloc_ble_device
    func
  vector: add lower boundary check in vector_foreach_slot_after
  multipathd: return NULL if MALLOC fails in alloc_waiteri func

 libmultipath/blacklist.c |  8 +++++--
 libmultipath/checkers.c  |  9 ++++----
 libmultipath/vector.h    |  6 +++---
 multipathd/main.c        | 56 +++++++++++++++++++++++-------------------------
 multipathd/main.h        |  3 ++-
 multipathd/waiter.c      |  4 +++-
 6 files changed, 45 insertions(+), 41 deletions(-)

-- 
1.8.3.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

