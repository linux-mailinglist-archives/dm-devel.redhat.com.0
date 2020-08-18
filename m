Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EC3142485AA
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 15:09:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-Z9J8zQHOMrOB0fTeEOl3XA-1; Tue, 18 Aug 2020 09:08:59 -0400
X-MC-Unique: Z9J8zQHOMrOB0fTeEOl3XA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 041C681F022;
	Tue, 18 Aug 2020 13:08:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C01357BE6B;
	Tue, 18 Aug 2020 13:08:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F602181A06B;
	Tue, 18 Aug 2020 13:08:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ID8nKh024110 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 09:08:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D92B33247; Tue, 18 Aug 2020 13:08:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58F2630B84
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 13:08:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 457F9101A56A
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 13:08:47 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-33-GNzKsu_lNnKFkBgwwftaOg-1; Tue, 18 Aug 2020 09:08:40 -0400
X-MC-Unique: GNzKsu_lNnKFkBgwwftaOg-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id BEA1FD7825AC4FFFF9B0;
	Tue, 18 Aug 2020 21:08:34 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 18 Aug 2020
	21:08:28 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, <dm-devel@redhat.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
Message-ID: <8fd64929-cb4b-5267-1899-15a82e2ff678@huawei.com>
Date: Tue, 18 Aug 2020 21:08:27 +0800
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
Subject: [dm-devel] [PATCH 3/5] multipathd: add reclear_pp_from_mpp in
	ev_remove_path
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

Add reclear_pp_from_mpp in ev_remove_path to make sure that pp is cleared in mpp.

When multipathd del path xxx, multipathd -v2, multipathd add path xxx and multipath -U
dm-x are executed simultaneously, multipath -U dm-x will case coredump.

The reason is that there are two paths with same dev_t in dm_table. The process
is as follows:

multipathd del path xxx(such as sde whose dev_t is 8:64):

cli_del_path
	->ev_remove_path
		->domap //dm_table in kernel will be reloaded and doesn't contain 8:64.
		        //Then multipath -v2 is executed, and the dm_table in kernel
		        //will be reloaded and contains 8:64.
		->setup_multipath
			->update_multipath_strings
				->update_multipath_table
					->dm_get_map //get params with 8:64
					->disassemble_map //pp1 will be saved mpp->pg
		->delete pp1 in pathvec
		->clear_ref_from_mpp //pp is cleared in mpp->paths but still saved in
		                     //mpp->pg
		->free_paths //pp1 is freed but still exist in mpp->pg

multipathd add path sde
cli_add_path
	->store_pathinfo //alloc pp2 (dev_t is 8:64), and store it to gvecs->pathvec
	->ev_add_path
		->adopt_paths
			->update_mpp_paths //pp1 is found in mpp->pg and its dev_t is
			                   //8:64 and dev is not sde (cased by free).
			                   //it will be stored in mpp->paths.
			->pp2 is stored to mpp->paths
		->setup_map //params with two 8:64
		->domap //dm_table is reloaded and contains two 8:64

multipath -U dm-x(sde is one path of dm-x)
main
	->check_usable_paths
		->dm_get_maps //get params with two 8:64
		->disassemble_map //alloc pp3, and pp3 is saved twice in mpp->pg
		->free_multipath(mpp, FREE_PATHS) //double free

Here, we add that pp1 in mpp->pg is cleared in clear_ref_from_mpp.

Reported-by: Tianxiong Lu <lutianxiong@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 multipathd/main.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/multipathd/main.c b/multipathd/main.c
index 9ec65856..a1db17a0 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1059,6 +1059,32 @@ fail:
 	return 1;
 }

+static
+void reclear_pp_from_mpp(struct path * pp, struct vectors * vecs)
+{
+	struct multipath * mpp = NULL;
+	struct pathgroup * pgp;
+	int i = -1;
+	int j = 0;
+	int is_log = 0;
+
+	mpp = find_mp_by_wwid(vecs->mpvec, pp->wwid);
+	if(!!mpp) {
+		if ((i = find_slot(mpp->paths, (void *)pp)) != -1) {
+			vector_del_slot(mpp->paths, i);
+			is_log = 1;
+		}
+		vector_foreach_slot (mpp->pg, pgp, j) {
+			if ((i = find_slot(pgp->paths, (void *)pp)) != -1) {
+				vector_del_slot(pgp->paths, i);
+				is_log = 1;
+			}
+		}
+		if (is_log)
+			condlog(2, "%s: reclear path from mpp %s", pp->dev, mpp->alias);
+	}
+}
+
 static int
 uev_remove_path (struct uevent *uev, struct vectors * vecs, int need_do_map)
 {
@@ -1186,6 +1212,7 @@ out:
 	if ((i = find_slot(vecs->pathvec, (void *)pp)) != -1)
 		vector_del_slot(vecs->pathvec, i);

+	reclear_pp_from_mpp(pp, vecs);
 	free_path(pp);

 	return retval;
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

