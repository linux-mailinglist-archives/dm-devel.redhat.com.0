Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 54C8122D550
	for <lists+dm-devel@lfdr.de>; Sat, 25 Jul 2020 08:03:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-ihBZSuvHMkquRE1aAGPwxQ-1; Sat, 25 Jul 2020 02:03:52 -0400
X-MC-Unique: ihBZSuvHMkquRE1aAGPwxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EF628014D4;
	Sat, 25 Jul 2020 06:03:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01EEA5C1BB;
	Sat, 25 Jul 2020 06:03:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65AB1A3588;
	Sat, 25 Jul 2020 06:03:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06P62snM028335 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 25 Jul 2020 02:02:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8D1A2156A2E; Sat, 25 Jul 2020 06:02:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C47BF2156A30
	for <dm-devel@redhat.com>; Sat, 25 Jul 2020 06:02:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CB448007B1
	for <dm-devel@redhat.com>; Sat, 25 Jul 2020 06:02:52 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-264-HqDrad8KNmGVOFDBvEcMuQ-1; Sat, 25 Jul 2020 02:02:49 -0400
X-MC-Unique: HqDrad8KNmGVOFDBvEcMuQ-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 84AA1425B5ABAD650EA0;
	Sat, 25 Jul 2020 13:47:10 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Sat, 25 Jul 2020
	13:47:01 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>
Message-ID: <1694e42f-92e7-e380-bc8c-ac3ec47cafdc@huawei.com>
Date: Sat, 25 Jul 2020 13:47:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, dm-devel@redhat.com, liuzhiqiang26@huawei.com,
	lutianxiong@huawei.com
Subject: [dm-devel] [dm-level] upstream-queue-libmultipath: fix memory leak
 when iscsi login/out and "multipath -r" executed
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When one iscsi device logs in and logs out with the "multipath -r"
executed at the same time, memory leak happens in multipathd
process.

The reason is following. When "multipath -r" is executed, the path
will be free in configure function. Before path_discovery executed,
iscsi device logs out. Then path_discovery will not find any path and
there is no path in the gvecs->pathvec. When map_discovery function
is executed, disassemble_map function will be called. Because
gvecs->pathvec->slot is empty and is_deamon is 1, a path will be
allocated and is not stored in gvecs->pathvec but store in
mpp->pg. But when the mpp is removed and freed by remove_map
function, the path will not be free and can't be find anymore.

The procedure details given as follows,
1."multipath -r" is executed
main
	->child
		->reconfigure
			->configure
				->path_discovery //after iscsi logout
				->map_discovery
					->update_multipath_table
						->disassemble_map
							->alloc_path
2.then "multipath -r" is executed again
main
main
	->child
		->reconfigure
			->remove_maps_and_stop_waiters
				->remove_maps

Here, we delete checking is_deamon. Because whether the process is a
daemon process or not, we think the path should be add to gvecs->pathvec.

Reported-by: Tianxiong Li <lutianxiong@huawei.com>
Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>

---
 libmultipath/dmparser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index b856a07f..d556f642 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -315,7 +315,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 						WWID_SIZE);
 				}
 				/* Only call this in multipath client mode */
-				if (!is_daemon && store_path(pathvec, pp))
+				if (store_path(pathvec, pp))
 					goto out1;
 			} else {
 				if (!strlen(pp->wwid) &&
--

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

