Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B81CF298992
	for <lists+dm-devel@lfdr.de>; Mon, 26 Oct 2020 10:41:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-a_JkJiUzNGKFhp-EwCg4sw-1; Mon, 26 Oct 2020 05:41:46 -0400
X-MC-Unique: a_JkJiUzNGKFhp-EwCg4sw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C6381007475;
	Mon, 26 Oct 2020 09:41:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35B855C1C2;
	Mon, 26 Oct 2020 09:41:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C36F192F28;
	Mon, 26 Oct 2020 09:41:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09Q9R6Zl001908 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 05:27:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94D56201E74B; Mon, 26 Oct 2020 09:27:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FE1F200E210
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 09:27:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B2DE811E76
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 09:27:04 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-294-cit1-u6FPIqf24IvK4BZag-1; Mon, 26 Oct 2020 05:26:59 -0400
X-MC-Unique: cit1-u6FPIqf24IvK4BZag-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CKTxc0JpwzkZYg;
	Mon, 26 Oct 2020 17:27:00 +0800 (CST)
Received: from [10.174.178.210] (10.174.178.210) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 26 Oct 2020 17:26:44 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>,
	dm-devel mailing list <dm-devel@redhat.com>
References: <2a95503c-da40-391c-ce76-bdde19636b51@huawei.com>
Message-ID: <f6df9fb3-0a3b-54d9-aca5-44b934e3b312@huawei.com>
Date: Mon, 26 Oct 2020 17:26:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a95503c-da40-391c-ce76-bdde19636b51@huawei.com>
X-Originating-IP: [10.174.178.210]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 4/6] fix change reservtion key to uint8 for memcmp
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The mpp->reservation_key is uint64_t and the paramp->key
is uint8_t. For example, paramp->key is 0x7d0 and the
mpp->reservation_key is 0x00000000000007d0. When memcmp
is called, it will not return 0. We change  reservtion_key
to uint8 to fix that.

Signed-off-by: Jianbing Jiao <jiaojianbing@huawei.com>
Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
---
 libmpathpersist/mpath_persist.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 1f9817ed..02d173dc 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -249,6 +249,9 @@ int __mpath_persistent_reserve_out ( int fd, int rq_servact, int rq_scope,
 	int ret;
 	uint64_t prkey;
 	struct config *conf;
+	uint8_t  uitmp[8] = {0};
+	uint64_t uireservation = {0};
+	int j;

 	ret = mpath_get_map(fd, &alias, &mpp);
 	if (ret != MPATH_PR_SUCCESS)
@@ -274,8 +277,14 @@ int __mpath_persistent_reserve_out ( int fd, int rq_servact, int rq_scope,
 		}
 	}

-	if (memcmp(paramp->key, &mpp->reservation_key, 8) &&
-	    memcmp(paramp->sa_key, &mpp->reservation_key, 8)) {
+	uireservation = get_be64(mpp->reservation_key);
+	for (j = 7; j >= 0; --j) {
+		uitmp[j] = (uireservation & 0xff);
+		uireservation >>= 8;
+	}
+
+	if (memcmp(paramp->key, uitmp, 8) &&
+	    memcmp(paramp->sa_key, uitmp, 8)) {
 		condlog(0, "%s: configured reservation key doesn't match: 0x%" PRIx64, alias, get_be64(mpp->reservation_key));
 		ret = MPATH_PR_SYNTAX_ERROR;
 		goto out1;
--

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

