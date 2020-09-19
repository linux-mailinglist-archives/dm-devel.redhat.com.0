Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9C020270D01
	for <lists+dm-devel@lfdr.de>; Sat, 19 Sep 2020 12:29:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-69MxRj2hMxarBuufylpb-Q-1; Sat, 19 Sep 2020 06:29:10 -0400
X-MC-Unique: 69MxRj2hMxarBuufylpb-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30BBA100747E;
	Sat, 19 Sep 2020 10:29:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7F6D73660;
	Sat, 19 Sep 2020 10:29:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E591644A47;
	Sat, 19 Sep 2020 10:29:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08JASwiM029677 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 19 Sep 2020 06:28:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B0EC100C2B2; Sat, 19 Sep 2020 10:28:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7667D100C2AE
	for <dm-devel@redhat.com>; Sat, 19 Sep 2020 10:28:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 071FB8007DF
	for <dm-devel@redhat.com>; Sat, 19 Sep 2020 10:28:56 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-397-dod0UxNJOxSsJnincUJ4Pw-1; Sat, 19 Sep 2020 06:28:51 -0400
X-MC-Unique: dod0UxNJOxSsJnincUJ4Pw-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 035B4498979300F1AA0B;
	Sat, 19 Sep 2020 18:28:47 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.487.0; Sat, 19 Sep 2020 18:28:36 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <ae709d8f-64f7-30bc-bd08-fc2398c0c093@huawei.com>
Message-ID: <39c4b48b-4cc8-062e-c6c8-1207b38f576a@huawei.com>
Date: Sat, 19 Sep 2020 18:28:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ae709d8f-64f7-30bc-bd08-fc2398c0c093@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH V6 11/14] mpathpersist: check whether malloc
 paramp->trnptid_list fails in handle_args func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
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

We change num_transport to num_transportids to combine them.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 mpathpersist/main.c | 64 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 28bfe410..f6a8b38c 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -153,6 +153,37 @@ static int do_batch_file(const char *batch_fn)
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
+	memset(paramp, 0, sizeof(struct prout_param_descriptor) +
+			(sizeof(struct transportid *) * num_transportid));
+	return paramp;
+}
+
+static void free_prout_param_descriptor(struct prout_param_descriptor *paramp)
+{
+	unsigned int i;
+	if (!paramp)
+		return;
+
+	for (i = 0; i < paramp->num_transportid; i++)
+		free(paramp->trnptid_list[i]);
+
+	free(paramp);
+}
+
 static int handle_args(int argc, char * argv[], int nline)
 {
 	int c;
@@ -177,7 +208,6 @@ static int handle_args(int argc, char * argv[], int nline)
 	int prin = 1;
 	int prin_sa = -1;
 	int prout_sa = -1;
-	int num_transport =0;
 	char *batch_fn = NULL;
 	void *resp = NULL;
 	struct transportid * tmp;
@@ -334,13 +364,13 @@ static int handle_args(int argc, char * argv[], int nline)
 				break;

 			case 'X':
-				if (0 != construct_transportid(optarg, transportids, num_transport)) {
+				if (0 != construct_transportid(optarg, transportids, num_transportids)) {
 					fprintf(stderr, "bad argument to '--transport-id'\n");
 					ret = MPATH_PR_SYNTAX_ERROR;
 					goto out;
 				}

-				++num_transport;
+				++num_transportids;
 				break;

 			case 'l':
@@ -525,9 +555,12 @@ static int handle_args(int argc, char * argv[], int nline)
 		int j;
 		struct prout_param_descriptor *paramp;

-		paramp= malloc(sizeof(struct prout_param_descriptor) + (sizeof(struct transportid *)*(MPATH_MX_TIDS )));
-
-		memset(paramp, 0, sizeof(struct prout_param_descriptor) + (sizeof(struct transportid *)*(MPATH_MX_TIDS)));
+		paramp = alloc_prout_param_descriptor(num_transportids);
+		if (!paramp) {
+			fprintf(stderr, "malloc paramp failed\n");
+			ret = MPATH_PR_OTHER;
+			goto out_fd;
+		}

 		for (j = 7; j >= 0; --j) {
 			paramp->key[j] = (param_rk & 0xff);
@@ -544,13 +577,19 @@ static int handle_args(int argc, char * argv[], int nline)
 		if (param_aptpl)
 			paramp->sa_flags |= MPATH_F_APTPL_MASK;

-		if (num_transport)
+		if (num_transportids)
 		{
 			paramp->sa_flags |= MPATH_F_SPEC_I_PT_MASK;
-			paramp->num_transportid = num_transport;
-			for (j = 0 ; j < num_transport; j++)
+			paramp->num_transportid = num_transportids;
+			for (j = 0 ; j < num_transportids; j++)
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
@@ -558,12 +597,7 @@ static int handle_args(int argc, char * argv[], int nline)
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

