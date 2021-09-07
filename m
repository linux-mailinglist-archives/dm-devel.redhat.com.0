Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7685D4023AE
	for <lists+dm-devel@lfdr.de>; Tue,  7 Sep 2021 08:57:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-rTcn_3v9OZ2Rm49o8hFG-Q-1; Tue, 07 Sep 2021 02:57:10 -0400
X-MC-Unique: rTcn_3v9OZ2Rm49o8hFG-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92C5D1854E2A;
	Tue,  7 Sep 2021 06:57:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71AD860C9F;
	Tue,  7 Sep 2021 06:57:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2C1E44A5A;
	Tue,  7 Sep 2021 06:57:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1876upW8011018 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Sep 2021 02:56:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E96E09C071; Tue,  7 Sep 2021 06:56:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3E5A8579A
	for <dm-devel@redhat.com>; Tue,  7 Sep 2021 06:56:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79689857AA9
	for <dm-devel@redhat.com>; Tue,  7 Sep 2021 06:56:48 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-173-2mw6kshwPj-eJmijui9Fag-1; Tue, 07 Sep 2021 02:56:45 -0400
X-MC-Unique: 2mw6kshwPj-eJmijui9Fag-1
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4D83F220AC;
	Tue,  7 Sep 2021 06:56:44 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0FEC712FF9;
	Tue,  7 Sep 2021 06:56:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA id TE1eASwNN2ErCQAAGKfGzw
	(envelope-from <mwilck@suse.com>); Tue, 07 Sep 2021 06:56:44 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue,  7 Sep 2021 08:56:33 +0200
Message-Id: <20210907065636.22937-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1876upW8011018
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 0/3] multipath-tools: final touces before next PR
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hello Christophe, hello Ben,

here are a few final small fixes for the next multipath-tools PR:
https://github.com/opensvc/multipath-tools/pull/13

(Christophe, please give Ben a few days for review before merging).

Notes:

 - The patch for libmultipath.version differs from the one I posted
   previously (https://listman.redhat.com/archives/dm-devel/2021-September/msg00011.html).
   In the previous one I hadn't sticked to the guide line I had
   set up myself (bumping the version of every symbol in the ABI
   for incompatible changes). The previous patch (bumping only the
   version of the symbols that had actually changed) has some advantages,
   in particular being able to track which symbols actually differ between
   versions. We may want to discuss changing the policy towards
   this procedure in the future, but we can't do it silently like I did
   in the first version of this patch.
 - I wrote previously that "libmultipath: drop unnecessary parameter 
   from remove_map()" broke the directio test, but that was a braino.
   It broke the dmevents tests. The fix is in this series.

Regards,
Martin

Martin Wilck (3):
  libmultipath.version: adapt to changes in remove_map
  multipath-tools tests: fix dmevents test
  Update .gitignore

 .gitignore                        |  4 ++++
 libmultipath/libmultipath.version | 17 +++++++----------
 tests/dmevents.c                  |  4 +---
 3 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.33.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

