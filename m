Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B92B821D48A
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 13:08:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-qF287CViNG-LTPcQ4i3LfA-1; Mon, 13 Jul 2020 07:08:34 -0400
X-MC-Unique: qF287CViNG-LTPcQ4i3LfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A6D41087;
	Mon, 13 Jul 2020 11:08:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 046941000235;
	Mon, 13 Jul 2020 11:08:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C91872F79;
	Mon, 13 Jul 2020 11:08:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DB8Di8016434 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 07:08:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 64646217B435; Mon, 13 Jul 2020 11:08:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FEC02166BA2
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 11:08:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03CCC800394
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 11:08:12 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-86-rBHU8qy-PlGN50ayotYNxA-1;
	Mon, 13 Jul 2020 07:08:07 -0400
X-MC-Unique: rBHU8qy-PlGN50ayotYNxA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EA132B1A1;
	Mon, 13 Jul 2020 11:08:07 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, <lixiaokeng@huawei.com>
Date: Mon, 13 Jul 2020 13:07:40 +0200
Message-Id: <20200713110743.26329-2-mwilck@suse.com>
In-Reply-To: <20200713110743.26329-1-mwilck@suse.com>
References: <20200713110743.26329-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06DB8Di8016434
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 1/4] master - libmultipath: fix use after free
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: lixiaokeng <lixiaokeng@huawei.com>

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
Signed-off-by: Martin Wilck <mwilck@suse.com>
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
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

