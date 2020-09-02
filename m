Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D0C2A25A66F
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:24:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-LmgZk_7iMx2zVY8x3xghqQ-1; Wed, 02 Sep 2020 03:24:07 -0400
X-MC-Unique: LmgZk_7iMx2zVY8x3xghqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 409DB1005E6D;
	Wed,  2 Sep 2020 07:24:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16F8419649;
	Wed,  2 Sep 2020 07:24:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FC20180B655;
	Wed,  2 Sep 2020 07:24:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827Nv6g027868 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:23:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF13EC2241; Wed,  2 Sep 2020 07:23:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAB00C2319
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:23:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26C05811E76
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:23:55 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-171-T96v8uhLOlaJuMAe2P7aJQ-1; Wed, 02 Sep 2020 03:23:52 -0400
X-MC-Unique: T96v8uhLOlaJuMAe2P7aJQ-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id BDB431CAA95D1DD64FF0;
	Wed,  2 Sep 2020 15:23:49 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS414-HUB.china.huawei.com
	(10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Sep 2020
	15:23:42 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
Message-ID: <eeea4f08-bcb1-65b6-2fe8-b078961a07d3@huawei.com>
Date: Wed, 2 Sep 2020 15:23:42 +0800
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 11/14] mpathpersist: check whether malloc
 paramp->trnptid_list, fails in handle_args func
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

In handle_args func, we donot check whether malloc paramp and
each paramp->trnptid_list[j] fails before using them, it may
cause access NULL pointer.

Here, we add alloc_prout_param_descriptor to allocate and init
paramp, and we add free_prout_param_descriptor to free paramp
and each paramp->trnptid_list[j].

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 mpathpersist/main.c | 55 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 28bfe410..f20c902c 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -153,6 +153,39 @@ static int do_batch_file(const char *batch_fn)
 	return ret;
 }

+static struct prout_param_descriptor *
+alloc_prout_param_descriptor(int num_transportid)
+{
+	struct prout_param_descriptor *paramp;
+
+	if (num_transportid < 0 || num_transportid > MPATH_MX_TIDS)
+		return NULL;
+
+	paramp= malloc(sizeof(struct prout_param_descriptor) +
+				(sizeof(struct transportid *) * num_transportid));
+
+	if (!paramp)
+		return NULL;
+
+	paramp->num_transportid = num_transportid;
+	memset(paramp, 0, sizeof(struct prout_param_descriptor) +
+			(sizeof(struct transportid *) * num_transportid));
+	return paramp;
+}
+
+static void free_prout_param_descriptor(struct prout_param_descriptor *paramp)
+{
+	int i;
+	if (!paramp)
+		return;
+
+	for (i = 0; i < paramp->num_transportid; i++)
+		free(paramp->trnptid_list[i]);
+
+	free(paramp);
+	paramp = NULL;
+}
+
 static int handle_args(int argc, char * argv[], int nline)
 {
 	int c;
@@ -525,9 +558,12 @@ static int handle_args(int argc, char * argv[], int nline)
 		int j;
 		struct prout_param_descriptor *paramp;

-		paramp= malloc(sizeof(struct prout_param_descriptor) + (sizeof(struct transportid *)*(MPATH_MX_TIDS )));
-
-		memset(paramp, 0, sizeof(struct prout_param_descriptor) + (sizeof(struct transportid *)*(MPATH_MX_TIDS)));
+		paramp = alloc_prout_param_descriptor(num_transport);
+		if (!paramp) {
+			fprintf(stderr, "malloc paramp failed\n");
+			ret = MPATH_PR_OTHER;
+			goto out_fd;
+		}

 		for (j = 7; j >= 0; --j) {
 			paramp->key[j] = (param_rk & 0xff);
@@ -551,6 +587,12 @@ static int handle_args(int argc, char * argv[], int nline)
 			for (j = 0 ; j < num_transport; j++)
 			{
 				paramp->trnptid_list[j] = (struct transportid *)malloc(sizeof(struct transportid));
+				if (!paramp->trnptid_list[j]) {
+					fprintf(stderr, "malloc paramp->trnptid_list[%d] failed.\n", j);
+					ret = MPATH_PR_OTHER;
+					free_prout_param_descriptor(paramp);
+					goto out_fd;
+				}
 				memcpy(paramp->trnptid_list[j], &transportids[j],sizeof(struct transportid));
 			}
 		}
@@ -558,12 +600,7 @@ static int handle_args(int argc, char * argv[], int nline)
 		/* PROUT commands other than 'register and move' */
 		ret = __mpath_persistent_reserve_out (fd, prout_sa, 0, prout_type,
 				paramp, noisy);
-		for (j = 0 ; j < num_transport; j++)
-		{
-			tmp = paramp->trnptid_list[j];
-			free(tmp);
-		}
-		free(paramp);
+		free_prout_param_descriptor(paramp);
 	}

 	if (ret != MPATH_PR_SUCCESS)
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

