Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 40B9E264FF3
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 21:56:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-Lu3JSE7sO8CKfriRupvVow-1; Thu, 10 Sep 2020 15:56:45 -0400
X-MC-Unique: Lu3JSE7sO8CKfriRupvVow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB49B57087;
	Thu, 10 Sep 2020 19:56:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EB0219C4F;
	Thu, 10 Sep 2020 19:56:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0A9C922F9;
	Thu, 10 Sep 2020 19:56:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AJuUIx025213 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 15:56:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B502103CD7; Thu, 10 Sep 2020 19:56:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56C00103CAE
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 19:56:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E57A811E7F
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 19:56:27 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-273-UX614nbzPHCoAiwYOWgMtQ-1;
	Thu, 10 Sep 2020 15:56:24 -0400
X-MC-Unique: UX614nbzPHCoAiwYOWgMtQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 65402AD5C;
	Thu, 10 Sep 2020 19:56:38 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, lixiaokeng@huawei.com
Date: Thu, 10 Sep 2020 21:56:11 +0200
Message-Id: <20200910195611.8439-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08AJuUIx025213
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, dm-devel@redhat.com,
	Zhiqiang Liu <liuzhiqiang26@huawei.com>, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2] libmultipath: setup_map(): don't break
	multipath attributes
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

From: Martin Wilck <mwilck@suse.com>

setup_map() is called both for new maps (e.g. from coalesce_paths())
and existing maps (e.g. from reload_map(), resize_map()). In the former
case, the map will be removed from global data structures, so incomplete
initialization is not an issue. But In the latter case, removal isn't
generally possible. We expect that mpp->features, mpp->hwhandler,
mpp->selector have been initialized and are are non-NULL. We must make sure
not to break this assumption because of an error in this setup_map()
invocation. As these properties aren't likely to change during an update
operation, saving and restoring them is better than leaving the map
improperly initialized.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---

v1->v2: forgot to remove the call to free_multipath_attributes().

This is supposed to be applied on top of lixiaokeng's patch
"libmultipath: check whether mpp->features is NUll in setup_map".

 libmultipath/configure.c | 29 +++++++++++++++++++++++++----
 libmultipath/util.h      |  7 +++++++
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 5d5d941..8fd12df 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -298,6 +298,7 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 	struct pathgroup * pgp;
 	struct config *conf;
 	int i, n_paths, marginal_pathgroups;
+	char *save_attr;
 
 	/*
 	 * don't bother if devmap size is unknown
@@ -307,10 +308,6 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 		return 1;
 	}
 
-	/*
-	 * free features, selector, and hwhandler properties if they are being reused
-	 */
-	free_multipath_attributes(mpp);
 	if (mpp->disable_queueing && VECTOR_SIZE(mpp->paths) != 0)
 		mpp->disable_queueing = 0;
 
@@ -328,11 +325,35 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 
 	select_pgfailback(conf, mpp);
 	select_pgpolicy(conf, mpp);
+
+	/*
+	 * If setup_map() is called from e.g. from reload_map() or resize_map(),
+	 * make sure that we don't corrupt attributes.
+	 */
+	save_attr = steal_ptr(mpp->selector);
 	select_selector(conf, mpp);
+	if (!mpp->selector)
+		mpp->selector = save_attr;
+	else
+		free(save_attr);
+
 	select_no_path_retry(conf, mpp);
 	select_retain_hwhandler(conf, mpp);
+
+	save_attr = steal_ptr(mpp->features);
 	select_features(conf, mpp);
+	if (!mpp->features)
+		mpp->features = save_attr;
+	else
+		free(save_attr);
+
+	save_attr = steal_ptr(mpp->hwhandler);
 	select_hwhandler(conf, mpp);
+	if (!mpp->hwhandler)
+		mpp->hwhandler = save_attr;
+	else
+		free(save_attr);
+
 	select_rr_weight(conf, mpp);
 	select_minio(conf, mpp);
 	select_mode(conf, mpp);
diff --git a/libmultipath/util.h b/libmultipath/util.h
index 52aa559..045bbee 100644
--- a/libmultipath/util.h
+++ b/libmultipath/util.h
@@ -110,4 +110,11 @@ static inline void clear_bit_in_bitfield(unsigned int bit, struct bitfield *bf)
 	bf->bits[bit / bits_per_slot] &= ~(1ULL << (bit % bits_per_slot));
 }
 
+#define steal_ptr(x)		       \
+	({			       \
+		void *___p = x;	       \
+		x = NULL;	       \
+		___p;		       \
+	})
+
 #endif /* _UTIL_H */
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

