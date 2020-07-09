Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A683D2199AC
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 09:25:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-49zFwLIdP_CAxppbtj4j4A-1; Thu, 09 Jul 2020 03:25:18 -0400
X-MC-Unique: 49zFwLIdP_CAxppbtj4j4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6252F80F051;
	Thu,  9 Jul 2020 07:25:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63AF05D9DD;
	Thu,  9 Jul 2020 07:25:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0D4F1809547;
	Thu,  9 Jul 2020 07:24:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0697OdgU010938 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 03:24:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3323100405E; Thu,  9 Jul 2020 07:24:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8135C1004044
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 07:24:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EE7D800883
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 07:24:37 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-507-_HRkatJ3M5qjFaEV9Y83fQ-1; Thu, 09 Jul 2020 03:24:34 -0400
X-MC-Unique: _HRkatJ3M5qjFaEV9Y83fQ-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 3505E8906AFB2EE3B3DF
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 15:08:55 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 9 Jul 2020
	15:08:49 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: <dm-devel@redhat.com>
Message-ID: <d1e9b61a-ab10-5ecf-8fd1-c13155d2ed45@huawei.com>
Date: Thu, 9 Jul 2020 15:08:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com, lutianxiong@huawei.com
Subject: [dm-devel] [dm-level] master - libmultipath: fix use after free
 when iscsi logs in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When two iscsi ips log in and out alternately and  the following scripts run
at the same time,

#!/bin/bash
interval=5
while true
do
        iscsiadm -m node -p 9.41.147.171 &> /dev/null
        iscsiadm -m node -p 9.41.148.172 &> /dev/null
        iscsiadm -m session &> /dev/null
        rescan-scsi-bus.sh &> /dev/null
        multipath -v2 &> /dev/null
        multipath -ll &> /dev/null
        sleep $interval
done

multipathd will have a segfault after about 30 mins.

The reason is that mpp->hwe is accessed after hwe is already freed. In
extract_hwe_from_path func, mpp->hwe is set to pp->hwe, so they points to the
same hwe. For some reasons, pp->mpp will be set to NULL in orphan_path func.
Then, pp and hwe will be freed with (pp->mpp == NULL) in free_path func
called by ev_remove_path func. However, mpp->hwe is not set to NULL while hwe
is already freed. So, when iscsi device logs in and new path is added to mpp,
mpp->hwe will be accessed in select_pgfailback func. Finally, use-after-free
problem occurs.

The procedure details given as follows,
1.wait_dmevents thread
wait_dmevents
	->dmevent_loop
		->update_multipath
			->__setup_multipath
				->update_multipath_strings
					 -> sync_paths
						->orphan_path
2.uevqloop thread  (iscsi log out, remove path)
uevqloop
->uevent_dispatch
	->service_uevq
		->uev_remove_path
			->ev_remove_path  //pp->mpp is NULL
				->free_path(pp)
			//pp->hew are freed but mpp->hwe is not set to NULL
3.ev_remove_path  (iscsi log in, add path)
uevqloop
->uevent_dispatch
	->service_uevq
		->ev_add_path
			->select_pgfailback //mpp->hwe is accessed

Here, we will set mpp->hwe to NULL before setting pp->map to NULL in orphan_path
func.

Signed-off-by: Tianxiong Lu <lutianxiong@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 libmultipath/structs_vec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 3dbbaa0..9bbe5d1 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -93,6 +93,8 @@ int adopt_paths(vector pathvec, struct multipath *mpp)
 void orphan_path(struct path *pp, const char *reason)
 {
 	condlog(3, "%s: orphan path, %s", pp->dev, reason);
+	if (pp->mpp && pp->mpp->hwe == pp->hwe)
+		pp->mpp->hwe = NULL;
 	pp->mpp = NULL;
 	pp->dmstate = PSTATE_UNDEF;
 	pp->uid_attribute = NULL;
--
2.26.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

