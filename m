Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDE7464E12
	for <lists+dm-devel@lfdr.de>; Wed,  1 Dec 2021 13:38:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-99mc_9HrOl2MYinjdvWBfA-1; Wed, 01 Dec 2021 07:38:01 -0500
X-MC-Unique: 99mc_9HrOl2MYinjdvWBfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE3221006AA3;
	Wed,  1 Dec 2021 12:37:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC0785E24E;
	Wed,  1 Dec 2021 12:37:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31D034A706;
	Wed,  1 Dec 2021 12:37:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B1CbDAU008766 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Dec 2021 07:37:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 685594047279; Wed,  1 Dec 2021 12:37:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 649394047272
	for <dm-devel@redhat.com>; Wed,  1 Dec 2021 12:37:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C62E80A0AF
	for <dm-devel@redhat.com>; Wed,  1 Dec 2021 12:37:13 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-65-_YBs52mDNBCkc0xFkOWPxg-1; Wed, 01 Dec 2021 07:37:11 -0500
X-MC-Unique: _YBs52mDNBCkc0xFkOWPxg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 81D86212BA;
	Wed,  1 Dec 2021 12:37:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4EF0513FF5;
	Wed,  1 Dec 2021 12:37:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id 0CZ6EXZsp2GGKAAAMHmgww
	(envelope-from <mwilck@suse.com>); Wed, 01 Dec 2021 12:37:10 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed,  1 Dec 2021 13:36:50 +0100
Message-Id: <20211201123650.16240-22-mwilck@suse.com>
In-Reply-To: <20211201123650.16240-1-mwilck@suse.com>
References: <20211201123650.16240-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1B1CbDAU008766
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 21/21] libmultipath: update_pathvec_from_dm:
	don't force DI_WWID
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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

From: Martin Wilck <mwilck@suse.com>

For existing paths, we don't need to force setting DI_WWID. It's
pointless because it would matter only in multipathd, and all
callers of update_multipath_table() / update_pathvec_from_dm()
in multipathd call it with flags=0, so this code won't be executed.
And this makes sense, because the path would either have been
cleanly initialized via path_discover() or an uevent, or pathinfo()
would have been called in update_pathvec_from_dm() in an earlier
invocation.

Also remove the misleading comment, and make coverity happy by
checking the return value of pathinfo().

---

Note: I haven't fully made up my mind whether we should act
on a pathinfo() failure here. For now, let the log message suffice.
Because the pathinfo flags are usually clear and pp->udev exists,
the only possible failure would be filtering by foreign libraries
or by devnode, which seems highly unlikely if it hasn't happened
beforehand.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs_vec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index df5709a..bfec840 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -149,16 +149,15 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 			 * uninitialized struct path to pgp->paths, with only
 			 * pp->dev_t filled in. Thus if pp->udev is set here,
 			 * we know that the path is in pathvec already.
-			 * However, it's possible that the path in pathvec is
-			 * different from the one the kernel still had in its
-			 * map.
 			 */
 			if (pp->udev) {
 				if (pathinfo_flags & ~DI_NOIO) {
 					conf = get_multipath_config();
 					pthread_cleanup_push(put_multipath_config,
 							     conf);
-					pathinfo(pp, conf, pathinfo_flags|DI_WWID);
+					if (pathinfo(pp, conf, pathinfo_flags) != PATHINFO_OK)
+						condlog(2, "%s: pathinfo failed for existing path %s (flags=0x%x)",
+							__func__, pp->dev, pathinfo_flags);
 					pthread_cleanup_pop(1);
 				}
 			} else {
-- 
2.33.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

