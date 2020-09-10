Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AF6D0264496
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 12:50:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-x2hXPzK-M3i7L0GkgGk94g-1; Thu, 10 Sep 2020 06:50:00 -0400
X-MC-Unique: x2hXPzK-M3i7L0GkgGk94g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39E051091063;
	Thu, 10 Sep 2020 10:49:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1627A10027A4;
	Thu, 10 Sep 2020 10:49:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA5C8181A270;
	Thu, 10 Sep 2020 10:49:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AAnpdp023298 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 06:49:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F58E202343D; Thu, 10 Sep 2020 10:49:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28773202451D
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:49:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30DD4801220
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:49:48 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-315-zZlhAyqHOuqklD7NfWdCdA-1; Thu, 10 Sep 2020 06:49:44 -0400
X-MC-Unique: zZlhAyqHOuqklD7NfWdCdA-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 827B398F97EF260878A1;
	Thu, 10 Sep 2020 18:49:38 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.208) by DGGEMS414-HUB.china.huawei.com
	(10.3.19.214) with Microsoft SMTP Server id 14.3.487.0;
	Thu, 10 Sep 2020 18:49:28 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
References: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
Message-ID: <4a43f1ca-c756-ed8f-c69d-a388b0911a61@huawei.com>
Date: Thu, 10 Sep 2020 18:49:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
X-Originating-IP: [10.174.178.208]
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
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH V4 05/14] multipathd: check return value of
 malloc in cli_getprkey func
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

In cli_getprkey func, we check the return value of malloc.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 multipathd/cli_handlers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index e9698704..235e2a2e 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -1531,6 +1531,8 @@ cli_getprkey(void * v, char ** reply, int * len, void * data)
 		return 1;

 	*reply = malloc(26);
+	if (!*reply)
+		return 1;

 	if (!get_be64(mpp->reservation_key)) {
 		sprintf(*reply, "none\n");
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

