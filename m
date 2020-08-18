Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F36C32485AF
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 15:10:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-mN8twgjhNqKgRVE5blTDCQ-1; Tue, 18 Aug 2020 09:10:34 -0400
X-MC-Unique: mN8twgjhNqKgRVE5blTDCQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C851894B6F;
	Tue, 18 Aug 2020 13:10:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE3C139A75;
	Tue, 18 Aug 2020 13:10:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAEE3181A06B;
	Tue, 18 Aug 2020 13:10:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07IDA8aG024192 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 09:10:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 71BC330B84; Tue, 18 Aug 2020 13:10:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D7C38A4D2
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 13:10:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 273B681163A
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 13:10:03 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-485-WAauB1gvPoaPbMYus8etaQ-1; Tue, 18 Aug 2020 09:09:57 -0400
X-MC-Unique: WAauB1gvPoaPbMYus8etaQ-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id C2DBAB7908B846D9293E;
	Tue, 18 Aug 2020 21:09:45 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 18 Aug 2020
	21:09:35 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, <dm-devel@redhat.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
Message-ID: <178ce8f8-cf74-bb32-1e5c-41674f493a24@huawei.com>
Date: Tue, 18 Aug 2020 21:09:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH 4/5] multipathd: disable queueing for recreated
 map in uev_remove_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There may be a race window here:
1. all paths gone, causing map flushed both from multipathd and kernel
2. paths regenerated, causing multipathd creating the map again.

1 will generate a remove uevent which can be handled after 2, so we can
disable queueing for the map created by 2 here temporarily and let the
change uevent (generated by 2) calling uev_add_map->setup_multipath
to set queueing again. This can prevent the deadlock in this race window.

The possible deadlock is: all udevd workers hangs in devices because of
queue_if_no_path, so no udevd workers can handle new event and since
multipathd will remove the map, the checkerloop cannot check this map's
retry tick timeout and cancel the io hang which makes the udevd worker
hang forever. multipathd cannot receive any uevent from udevd because
all udevd workers hang there so the map cannot be recreated again which
makes a deadlock.

Signed-off-by: Lixiaokeng@huawei.com
---
 multipathd/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/multipathd/main.c b/multipathd/main.c
index baa18183..d7e20a10 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -798,6 +798,7 @@ uev_remove_map (struct uevent * uev, struct vectors * vecs)
 		goto out;
 	}

+	dm_queue_if_no_path(alias, 0);
 	remove_map_and_stop_waiter(mpp, vecs);
 out:
 	lock_cleanup_pop(vecs->lock);
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

