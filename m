Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 030D5260B84
	for <lists+dm-devel@lfdr.de>; Tue,  8 Sep 2020 09:06:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-oERPbmnQNvKRpXMwEunN_g-1; Tue, 08 Sep 2020 03:06:36 -0400
X-MC-Unique: oERPbmnQNvKRpXMwEunN_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F40CC18B9F03;
	Tue,  8 Sep 2020 07:06:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7962E27BDD;
	Tue,  8 Sep 2020 07:06:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30D03181A050;
	Tue,  8 Sep 2020 07:06:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08876PUJ003780 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 03:06:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C30F1112850; Tue,  8 Sep 2020 07:06:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7648F111284D
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 07:06:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78976827F14
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 07:06:22 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-244-2p_CONbuOYSa-4zbW1-cyQ-1; Tue, 08 Sep 2020 03:06:20 -0400
X-MC-Unique: 2p_CONbuOYSa-4zbW1-cyQ-1
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 76772AE48E5BBB84FA4C;
	Tue,  8 Sep 2020 15:06:16 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.232) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 8 Sep 2020 15:06:06 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>
References: <a3672ace-9637-20e2-04ce-857e364ffdb3@huawei.com>
Message-ID: <04f01b5d-7142-eac1-b043-f0fc19702bd7@huawei.com>
Date: Tue, 8 Sep 2020 15:06:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a3672ace-9637-20e2-04ce-857e364ffdb3@huawei.com>
X-Originating-IP: [10.174.179.232]
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
	dm-devel mailing list <dm-devel@redhat.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH V2 14/14] multipathpersist: delete unused
 variable in handle_args
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
Content-Language: en-GB

In handle_args, the tmp isn't used. We delete it.

V1->V2: modify patch because of "mpathpersist: check whether
malloc paramp->trnptid_list fails in handle_args func" changing

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 mpathpersist/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index da67c15c..85453ac2 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -211,7 +211,6 @@ static int handle_args(int argc, char * argv[], int nline)
        int prout_sa = -1;
        char *batch_fn = NULL;
        void *resp = NULL;
-       struct transportid * tmp;

        memset(transportids, 0, MPATH_MX_TIDS * sizeof(struct transportid));

--


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

