Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F1F5925A653
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:20:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-4MaToam_PyOsGQKlzwiJhg-1; Wed, 02 Sep 2020 03:20:23 -0400
X-MC-Unique: 4MaToam_PyOsGQKlzwiJhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C907D1005E66;
	Wed,  2 Sep 2020 07:20:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8BA26CE52;
	Wed,  2 Sep 2020 07:20:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3970C79A32;
	Wed,  2 Sep 2020 07:20:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827KEdj027328 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:20:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A76A210EE952; Wed,  2 Sep 2020 07:20:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A229710EE950
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:20:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B528101A569
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:20:11 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-6-DQgB_zw9MKSrkb4aWaBEfw-1; Wed, 02 Sep 2020 03:20:08 -0400
X-MC-Unique: DQgB_zw9MKSrkb4aWaBEfw-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 138E53D6EEE2BCC8B1F8;
	Wed,  2 Sep 2020 15:20:02 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Sep 2020
	15:19:51 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
Message-ID: <efc49805-8938-00d4-5eff-230f8f6f064e@huawei.com>
Date: Wed, 2 Sep 2020 15:19:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 07/14] libmultipath: check return value of
 dm_mapname in, sysfs_check_holders
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

In sysfs_check_holders func, table_name is obtained by calling
dm_mapname func, and then call dm_reassign_table for reassigning
table. However, we donnot check whether dm_mapname func returns
NULL, and then it may cause a segmentation fault in dm_task_set_name.

Here, we will check whether dm_mapname func returns NULL before
using it.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/sysfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/libmultipath/sysfs.c b/libmultipath/sysfs.c
index 12a82d95..5390de62 100644
--- a/libmultipath/sysfs.c
+++ b/libmultipath/sysfs.c
@@ -278,7 +278,11 @@ int sysfs_check_holders(char * check_devt, char * new_devt)
 			continue;
 		}
 		table_name = dm_mapname(major, table_minor);
-
+		if (!table_name) {
+			condlog(2, "%s: mapname not found for %d:%d", check_dev,
+				major, table_minor);
+			continue;
+		}
 		condlog(0, "%s: reassign table %s old %s new %s", check_dev,
 			table_name, check_devt, new_devt);

-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

